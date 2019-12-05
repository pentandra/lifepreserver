# frozen_string_literal: true

require 'ffi/hunspell'
require 'locale'

module LifePreserver
  module Helpers
    module Dictionaries
      # A helper class that wraps a Hunspell dictionary and accounts for any
      # dependent items.
      class WrappedHunspellDictionary
        # @return [Array<Nanoc::Core::BasicItemView>] The item dependencies of
        #   the current Hunspell dictionary item.
        attr_reader :dependencies

        # @return [String] The language (locale tag) of the dictionary.
        attr_reader :lang

        class << self
          # Close the hunspell dictionary at object finalization.
          def finalize(hunspell_dic)
            proc { hunspell_dic.close }
          end
        end

        def initialize(lang = FFI::Hunspell.lang, dependencies = [])
          @lang = Locale.create_language_tag(lang).to_s
          @dict = FFI::Hunspell.dict(lang)
          @dependencies = []

          dependencies.each do |item|
            @dependencies << item

            if item[:kind] == 'extra-dictionary'
              @dict.add_dic(item.raw_filename)
            end

            # process any custom entries
            item.fetch(:entries, []).each do |entry|
              if entry.start_with?('*')
                @dict.delete(entry[1..-1])
              elsif entry.include?('/')
                word, example = entry.split('/', 2)
                @dict.add_with_affix(word, example)
              else
                @dict.add(entry)
              end
            end
          end

          ObjectSpace.define_finalizer(self, self.class.finalize(@dict))
        end

        # To check whether the given word is valid.
        #
        # @param word [String] The word to validate.
        #
        # @return [Boolean] True if the word is valid, false if not.
        def valid?(word)
          @dict.valid?(word)
        end
      end

      # Get an instance of a dictionary for the given language.
      #
      # @note The instances of the dictionary are cached once they have been
      #   requested and reused for subsequent requests.
      #
      # @param lang [String] The language tag of the dictionary needed.
      #
      # @return [Dictionaries::WrappedHunspellDictionary] The dictionary
      #   instance, if found.
      def dictionary_for(lang = Locale.default)
        @@dictionary_cache ||= {}

        hunspell_lang = find_simple_locale(lang)
        if hunspell_lang.nil?
          warn "Unable to resolve a dictionary for '#{lang}' from the following candidates: #{Locale.candidates.map(&:to_s).join(', ')}."
          return
        end

        if @@dictionary_cache.key?(hunspell_lang)
          return @@dictionary_cache[hunspell_lang]
        end

        base_dic = dictionaries(langtag: hunspell_lang, name: "#{hunspell_lang}.dic").first

        unless base_dic && base_dic[:kind] =~ /base-dictionary/
          raise "Could not find base dictionary item for language '#{hunspell_lang}'"
        end

        @@dictionary_cache[hunspell_lang] =
          WrappedHunspellDictionary.new(hunspell_lang, dependencies_for(base_dic))
      end

      # Clears the dictionary cache.
      #
      # @return [void]
      def clear_dictionary_cache
        @@dictionary_cache = nil
      end

      # Find the closest locale for the given language tag. Since the purpose
      # here is to identify which dictionary to use, we only compare simple
      # language tags.
      #
      # @param lang [String] The language tag with which to find a locale.
      #
      # @return [Locale::Tag, nil] The locale of the first candidate who's
      #   value starts with the value of the given language tag.
      def find_simple_locale(lang)
        lang_tag = Locale.create_language_tag(lang.to_s).to_simple
        Locale.candidates(type: :simple).find do |candidate|
          candidate.to_s.start_with?(lang_tag.to_s)
        end
      end

      # Find dictionary items using an optional path glob.
      #
      # @raise [Nanoc::Core::TrivialError] If the dictionaries_root is not set
      #   in site configuration.
      #
      # @see file:var/dictionaries/README.md Dictionary Naming Conventions
      #
      # @param langtag [String] The glob pattern of the language tag.
      # @param name [String] The glob pattern with which to search for specific
      #   dictionary items, under the +:langtag+ parent pattern.
      #
      # @return [Array<Nanoc::Core::BasicItemView>] All dictionary items that
      #   match the given pattern.
      def dictionaries(langtag: '*', name: '*')
        dict_root = @config[:dictionaries_root]
        if dict_root.nil?
          raise Nanoc::Core::TrivialError.new('Cannot find the root of the dictionary items: site configuration has no dictionaries_root')
        end

        @items.find_all(File.join(dict_root, langtag, name))
      end

      # Find all dictionaries of acronyms.
      #
      # @see file:var/dictionaries/README.md Dictionaries README
      #
      # @return [Array<Nanoc::Core::BasicItemView>] All custom Hunspell acronym
      #   dictionary items.
      def acronym_dictionaries
        dictionaries.select { |d| d._unwrap.attributes[:kind] == 'acronym-dictionary' }
      end

      # @return [Hash<Symbol, String>] All abbreviations with the corresponding
      #   long form value, keyed by the acronym.
      def supported_abbreviations
        acronym_dictionaries.map { |dict| dict[:acronym_mappings] }.reduce(&:merge)
      end

      protected

      # Collect all dependent items of the given base dictionary item.
      #
      # @note Dependent items consist of all supplementary personal and extra
      #   dictionaries located in the same directory as the base dictionary.
      #
      # @param base_dic [Nanoc::Core::BasicItemView] The base-dictionary item.
      #
      # @return [Array<Nanoc::Core::BasicItemView>] All the item dependencies of the base
      #   dictionary item, including the base dictionary item itself.
      def dependencies_for(base_dic)
        dependencies = @items.find_all(File.join(File.dirname(base_dic.identifier), '*'))
        dependencies.keep_if { |d| d._unwrap.attributes[:kind] =~ /(personal|extra)-dictionary/ }
        dependencies << base_dic
      end
    end
  end
end
