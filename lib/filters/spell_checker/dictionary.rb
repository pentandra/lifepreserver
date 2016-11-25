require 'ffi/hunspell'

class Dictionary
  DEFAULT_LANG ||= 'en_US'.freeze

  DEFAULT_HUNSPELL_LANGUAGE_CODES ||= %w(de_DE en_US es_ES fr_FR nl_NL uk_UA).freeze

  attr_reader :hunspell_lang
  attr_reader :dictionary_items

  class << self
    def finalize(hunspell_dic)
      proc { hunspell_dic.close }
    end

    def instance(lang = DEFAULT_LANG, options = {})
      @dictionaries ||= {}
      hunspell_lang = find_hunspell_lang(lang)
      @dictionaries[hunspell_lang] ||= new(hunspell_lang, options)
    end

    def find_hunspell_lang(lang_tag)
      lang_tag &&= lang_tag.to_s.tr('-', '_')
      case lang_tag
      when /\A[a-z]{2}\z/
        DEFAULT_HUNSPELL_LANGUAGE_CODES.find(DEFAULT_LANG) { |tag| tag.start_with?(lang_tag) }
      when /\A[a-z]{2}_[A-Z]{2}\z/
        lang_tag
      else
        DEFAULT_LANG
      end
    end
  end

  def initialize(hunspell_lang, options)
    @hunspell_lang = hunspell_lang
    @hunspell_dic = FFI::Hunspell.dict(@hunspell_lang)

    ObjectSpace.define_finalizer(self, self.class.finalize(@hunspell_dic))

    filter = options[:nanoc_spellchecker_filter]
    return unless filter

    @dictionary_items = filter.find_dictionary_items_for(@hunspell_lang)
    dictionary_items.each do |dic_item|
      if dic_item[:kind] == 'extra-dictionary'
        @hunspell_dic.add_dic(dic_item.raw_filename)
      end

      dic_item.fetch(:dic_entries, []).each { |entry| add_entry(@hunspell_dic, entry) }
    end
  end

  def valid?(word)
    @hunspell_dic.valid?(word)
  end

  protected

  def add_entry(hunspell_dic, entry)
    if entry.include?('/')
      word, example = entry.split('/', 2)
      hunspell_dic.add_with_affix(word, example)
    else
      hunspell_dic.add(entry)
    end
  end
end
