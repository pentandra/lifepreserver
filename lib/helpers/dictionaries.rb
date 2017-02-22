require 'ffi/hunspell'
require 'locale'

module LifePreserver
  module Dictionaries
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
        ObjectSpace.define_finalizer(self, self.class.finalize(@dic))

        dependencies.each do |item|
          @dependencies << item

          if item[:kind] == 'extra-dictionary'
            @dic.add_dic(item.raw_filename)
          end

          item.fetch(:entries, []).each { |entry| process_entry(entry) }
        end
      end

      def valid?(word)
        @dic.valid?(word)
      end

      protected

      def process_entry(entry)
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

    # Get an instance of a dictionary for the given language.
    #
    # @param
    #
    # @return [SpellChecker::Dictionaries::Dictionary] instance
    def dictionary(lang = Locale.default)
      @@dictionaries ||= {}

      hunspell_lang = find_closest_lang(lang.to_s)

      if @@dictionaries.key?(hunspell_lang)
        return @@dictionaries[hunspell_lang]
      end

      base_dic = @items["/**/#{hunspell_lang}.dic"]

      unless base_dic && base_dic[:kind] =~ /base-dictionary/
        raise "Could not find base dictionary item for language '#{hunspell_lang}'"
      end

      @@dictionaries[hunspell_lang] = Dictionary.new(hunspell_lang, dependencies_for(base_dic))
    end

    def find_closest_lang(lang)
      lang_tag = Locale::Tag.parse(lang).to_simple
      locale = Locale.app_language_tags.find { |c| c.to_s.start_with?(lang_tag.to_s) }

      unless locale
        raise "Unable to resolve a locale for language '#{lang}' from the following candidates: #{Locale.app_language_tags.map(&:to_s).join(', ')}"
      end

      locale.to_s
    end

    def dependencies_for(base_dic)
      identifier = base_dic.identifier
      dependencies = @items.find_all(File.dirname(identifier.to_s) + '/*')
      dependencies.keep_if { |d| d.unwrap.attributes[:kind] =~ /(?<!base)-dictionary/ }
      dependencies << base_dic
    end
  end
end
