require 'ffi/hunspell'

class Dictionary

  class << self
    def finalize
      proc { @dictionary && @dictionary.close }
    end

    def instance(base_lang = 'en_US', extra_dictionaries = [])
      @dictionary ||= new(base_lang, extra_dictionaries)
    end
  end

  def initialize(base_lang, extra_dictionaries)
    @dictionary = setup_dictionary(base_lang, extra_dictionaries)
    ObjectSpace.define_finalizer(self, self.class.finalize)
  end

  def valid?(word)
    @dictionary.valid?(word)
  end

  protected

  def setup_dictionary(base_lang, extra_dictionaries)
    dictionary = FFI::Hunspell.dict(base_lang)

    extra_dictionaries.each do |extra_dic|
      if (extra_dic[:kind] == 'extra-dictionary')
        dictionary.add_dic(extra_dic.raw_filename)
      end

      extra_dic.fetch(:dic_entries, []).each { |entry| add_entry(dictionary, entry) }
    end
    
    dictionary
  end

  def add_entry(dictionary, entry)
    if entry.include?('/') then
      word, example = entry.split('/', 2)
      dictionary.add_with_affix(word, example)
    else
      dictionary.add(entry)
    end
  end
end
