require 'filters/spell_checker/dictionary'

RSpec.describe Dictionary do
  context 'using default parameters' do
    subject(:dic) { described_class.instance }

    describe '.instance' do
      it 'returns a dictionary instance' do
        expect(dic).to be
      end

      it 'returns the same object when called again' do
        dic2 = described_class.instance
        expect(dic2).to be(dic)
      end

      it 'selects a dictionary language by default if none is provided' do
        expect(dic.hunspell_lang).to eq(Dictionary::DEFAULT_LANG)
      end
    end

    describe '.find_hunspell_lang' do
      it 'returns the default language tag for a nil tag' do
        tag = described_class.find_hunspell_lang(nil)
        expect(tag).to eq(Dictionary::DEFAULT_LANG)
      end

      it 'returns the default language tag for an empty string' do
        tag = described_class.find_hunspell_lang('')
        expect(tag).to eq(Dictionary::DEFAULT_LANG)
      end

      it 'finds the default value for a language code' do
        tag = described_class.find_hunspell_lang('es')
        expect(tag).to eq('es_ES')
      end

      it 'converts a well-formed bcp-47 tag to a hunspell tag' do
        tag = described_class.find_hunspell_lang('en-GB')
        expect(tag).to eq('en_GB')
      end
    end
  end

  context 'passing parameters' do
    subject(:dic) { described_class.instance('en_US') }

    describe '#dictionary_items' do
      it 'returns nil if the dictionary was not setup with extra dictionaries' do
        expect(dic.dictionary_items).to be_nil
      end

      it 'returns a set of extra dictionaries that were used to setup the dictionary' do
      end
    end
  end
end
