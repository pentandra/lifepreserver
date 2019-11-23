# frozen_string_literal: true

require 'ffi/hunspell'
require 'locale'

module LifePreserver
  module Helpers
    module Dictionaries
      # A helper class to manage an Hunspell dictionary item and its
      # item dependencies.
      class Dictionary
        attr_reader :dependencies
        attr_reader :lang

        class << self
          def finalize(hunspell_dic)
            proc { hunspell_dic.close }
          end
        end

        def initialize(lang = FFI::Hunspell.lang, dependencies = [])
          @lang = Locale.create_language_tag(lang).to_s
          @dependencies = []
          @dic = FFI::Hunspell.dict(lang)

          dependencies.each do |item|
            @dependencies << item

            if item[:kind] == 'extra-dictionary'
              @dic.add_dic(item.raw_filename)
            end

            # process any custom entries
            item.fetch(:entries, []).each do |entry|
              if entry.start_with?('*')
                @dic.delete(entry[1..-1])
              elsif entry.include?('/')
                word, example = entry.split('/', 2)
                @dic.add_with_affix(word, example)
              else
                @dic.add(entry)
              end
            end
          end

          ObjectSpace.define_finalizer(self, self.class.finalize(@dic))
        end

        def valid?(word)
          @dic.valid?(word)
        end
      end

      # Get an instance of a dictionary for the given language.
      #
      # @param [String] lang (Locale.default) The language tag of the
      #   dictionary needed.
      #
      # @return [Dictionaries::Dictionary] The dictionary instance, if found.
      def dictionary(lang = Locale.default)
        @@dictionary_cache ||= {}

        hunspell_lang = find_simple_locale(lang)

        unless hunspell_lang
          warn "Unable to resolve a dictionary for '#{lang}' from the following candidates: #{Locale.app_language_tags.map(&:to_s).join(', ')}."
          return
        end

        if @@dictionary_cache.key?(hunspell_lang)
          return @@dictionary_cache[hunspell_lang]
        end

        base_dic = @items["/**/#{hunspell_lang}.dic"]

        unless base_dic && base_dic[:kind] =~ /base-dictionary/
          raise "Could not find base dictionary item for language '#{hunspell_lang}'"
        end

        @@dictionary_cache[hunspell_lang] = Dictionary.new(hunspell_lang, dependencies_for(base_dic))
      end

      # Find the closest locale for the given language tag. Since the purpose
      # here is to identify which dictionary to use, we are limiting ourselves
      # to simple language tags.
      #
      # @param [String] lang The language tag.
      #
      # @return [Locale::Tag] The locale of the first +Locale.app_language_tag+
      #   whos value starts with the value of the given language tag.
      def find_simple_locale(lang)
        lang_tag = Locale.create_language_tag(lang.to_s).to_simple
        Locale.app_language_tags.find do |app_tag|
          app_tag.to_s.start_with?(lang_tag.to_s)
        end
      end

      def dictionaries
        @items.find_all('/lifepreserver/dictionaries/**/*')
      end

      def abbreviation_dictionaries
        dictionaries.select { |d| d._unwrap.attributes[:kind] == 'acronym-dictionary' }
      end

      def supported_abbreviations
        abbreviation_dictionaries.map { |dic| dic[:acronym_mappings] }.reduce(&:merge)
      end

      protected

      # Collect all dependent items of the given base dictionary item.
      #
      # @note Dependent items consist of all supplementary personal and extra
      #   dictionaries located in the same directory as the base dictionary.
      #
      # @param [Nanoc::Core::BasicItemView] base_dic The base dictionary item.
      #
      # @return [Array<Nanoc::Core::BasicItemView>] All the item dependencies of the base
      #   dictionary item, including the base dictionary item itself.
      def dependencies_for(base_dic)
        dependencies = @items.find_all(File.join(File.dirname(base_dic.identifier.to_s), '*'))
        dependencies.keep_if { |d| d._unwrap.attributes[:kind] =~ /(personal|extra)-dictionary/ }
        dependencies << base_dic
      end
    end
  end
end
