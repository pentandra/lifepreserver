# frozen_string_literal: true

require 'ffi/hunspell'
require 'helpers/dictionaries'

RSpec.describe LifePreserver::Helpers::Dictionaries, helper: true, chdir: false do
  let(:directories) { ['var/dictionaries'] }
  let(:dictionaries_root) { '/dicts' }
  let(:default_lang) { 'en_US' }

  before do
    # set defaults
    FFI::Hunspell.directories = directories.flat_map { |d| Dir["#{d}/*/"] }
    FFI::Hunspell.lang = default_lang
    Locale.default = default_lang
    Locale.set_current('en_US', 'en_GB', 'es_ES')
    ctx.config[:dictionaries_root] = dictionaries_root

    # create some dictionaries
    ctx.create_item('content', { kind: 'base-dictionary' }, '/dicts/en_US/en_US.dic')
    ctx.create_item('content', { kind: 'base-dictionary' }, '/dicts/en_GB/en_GB.dic')
    ctx.create_item('content', { kind: 'base-dictionary' }, '/dicts/es_ES/es_ES.dic')
  end

  after do
    helper.clear_dictionary_cache
    Locale.clear
  end

  describe '#dictionary_for' do
    subject { helper.dictionary_for(lang) }

    context 'with default parameters' do
      let(:lang) { nil }

      it 'returns a dictionary instance' do
        expect(subject).not_to be_nil
      end

      it 'returns the same object when called again' do
        subject2 = helper.dictionary_for(lang)
        expect(subject).to be(subject2)
      end
    end

    context 'with a hunspell language code' do
      context 'with a supported language value' do
        let(:lang) { 'en_US' }

        it 'selects the given language' do
          expect(subject.lang).to eq(lang)
        end
      end

      context 'with an unsupported language value' do
        let(:lang) { 'zz_YY' }

        it 'expect subject to be nil' do
          expect(subject).to be_nil
        end
      end

      context 'with a nil value' do
        let(:lang) { nil }

        it 'selects the default dictionary language' do
          expect(subject.lang).to eq(FFI::Hunspell.lang)
        end
      end

      context 'with a BCP 47 language tag' do
        let(:lang) { 'en-Latn-US-x-twain' }

        it 'maps to the simple Hunspell value' do
          expect(subject.lang).to eq('en_US')
        end
      end
    end

    context 'with a missing base dictionary' do
      before do
        Locale.set_current('en_US', 'en_GB', 'fr_FR')
        ctx.create_item('content', { kind: 'extra-dictionary' }, '/dicts/fr_FR/fr_FR.dic')
      end

      let(:lang) { 'fr_FR' }

      it 'does not accept an extra dictionary as a base dictionary' do
        expect { subject }.to raise_error(RuntimeError)
      end
    end

    context 'with dependencies' do
      before do
        ctx.create_item('content', { kind: 'personal-dictionary', entries: ['figgy/piggy', '*word', 'Nanoc'] }, '/dicts/en_US/personal.dic')
        ctx.create_item('Pentandra/M', { kind: 'extra-dictionary' }, '/dicts/en_GB/extra.dic')
      end

      context 'on a personal en_US dictionary' do
        let(:lang) { 'en-US' }

        it 'adds the personal dictionary to the dictionary dependencies' do
          expect(subject.dependencies).to include(ctx.items['/dicts/en_US/personal.dic'])
        end

        it 'adds entries to the base dictionary' do
          expect(subject.valid?('Nanoc')).to be(true)
        end

        it 'adds entries by example to the base dictionary' do
          expect(subject.valid?('figgy')).to be(true)
        end

        it 'deletes entries from the base dictionary' do
          expect(subject.valid?('word')).to be(false)
        end
      end

      xcontext 'on an extra en_GB dictionary' do
        let(:lang) { 'en_GB' }

        it 'adds the extra dictionary to the dictionary dependencies' do
          expect(subject.dependencies).to include(ctx.items['/dicts/en_GB/extra.dic'])
        end

        it 'adds entries to the base dictionary' do
          expect(subject.valid?('Pentandra')).to be(true)
        end

        it 'supports affixes of the base dictionary' do
          expect(subject.valid?('Pentandra\'s')).to be(true)
        end
      end
    end
  end

  describe '#dictionaries' do
    subject { helper.dictionaries(langtag: langtag, name: name) }

    let(:langtag) { '*' }
    let(:name)    { '*' }

    context 'with no site configuration' do
      before do
        ctx.config[:dictionaries_root] = nil
      end

      it 'raises error' do
        expect { subject }.to raise_error(Nanoc::Core::TrivialError)
      end
    end

    context 'with default params' do
      it 'will return all dictionary items' do
        expect(subject).to match_array(ctx.items)
      end
    end

    context 'with english language tag pattern' do
      let(:langtag) { 'en_*' }

      it 'will return all dictionary items with english locales' do
        expect(subject).to contain_exactly(ctx.items['/dicts/en_US/en_US.dic'],
                                           ctx.items['/dicts/en_GB/en_GB.dic'])
      end
    end
  end

  describe '#find_simple_locale' do
    subject { helper.find_simple_locale(arg).to_s }

    context 'using a nil parameter' do
      let(:arg) { nil }

      it { is_expected.to eq(default_lang) }
    end

    context 'using an empty string' do
      let(:arg) { '' }

      it { is_expected.to eq(default_lang) }
    end

    context 'passing a simple BCP47 language tag' do
      let(:arg) { 'es' }

      it { is_expected.to eq('es_ES') }
    end

    context 'passing a full BCP47 tag' do
      let(:arg) { 'en-GB' }

      it { is_expected.to eq('en_GB') }
    end

    context 'passing an extended BCP47 tag' do
      let(:arg) { 'en-US-x-twain' }

      it { is_expected.to eq('en_US') }
    end
  end
end
