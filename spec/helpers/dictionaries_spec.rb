# frozen_string_literal: true

require 'ffi/hunspell'
require 'helpers/dictionaries'

RSpec.describe LifePreserver::Helpers::Dictionaries, helper: true, chdir: false do
  let(:search_paths) { ['var/dictionaries'] }
  let(:dictionaries_root) { '/dicts' }
  let(:default_lang) { 'en_US' }
  let(:supported_locales) { %w[en_US en_GB es_ES] }

  before do
    # set defaults
    FFI::Hunspell.directories = search_paths.flat_map { |d| Dir["#{d}/*/"] }
    FFI::Hunspell.lang = default_lang
    Locale
      .set_app_language_tags(*FFI::Hunspell.directories.map { |d| File.basename(d) })
      .set_default(default_lang)
      .set_current(*supported_locales)

    # setup dictionary items' root
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
        ctx.create_item('content', { kind: 'extra-dictionary' }, '/dicts/fr_FR/fr_FR.dic')
      end

      let(:supported_locales) { %w[en_US en_GB fr_FR] }
      let(:lang) { 'fr_FR' }

      it 'does not accept an extra dictionary as a base dictionary' do
        expect { subject }.to raise_error(RuntimeError)
      end
    end

    context 'with dependencies' do
      context 'on a personal en_US dictionary' do
        let(:lang) { 'en-US' }

        before do
          item_attrs = {
            kind: 'personal-dictionary',
            entries: ['figgy/piggy', '*word', 'Nanoc'],
          }
          ctx.create_item('content', item_attrs, '/dicts/en_US/personal.dic')
        end

        it 'adds the personal dictionary to the list of dependencies' do
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

      context 'on an extra en_GB dictionary' do
        include_context 'with tmp dir'

        let(:lang) { 'en_GB' }

        before do
          dic_path = File.join(tmp_dir, 'bar.dic')
          File.write(dic_path, "1\nPentandra/M")
          dic_content = Nanoc::Core::Content.create(dic_path, binary: true)
          ctx.create_item(dic_content, { kind: 'extra-dictionary' }, '/dicts/en_GB/extra.dic')
        end

        it 'adds the extra dictionary to the list of dependencies' do
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
    subject { helper.find_simple_locale(arg) }

    context 'using a nil parameter' do
      let(:arg) { nil }

      it 'will return the default locale' do
        expect(subject.to_s).to eq(default_lang)
      end
    end

    context 'using an empty string' do
      let(:arg) { '' }

      it 'will return the default locale' do
        expect(subject.to_s).to eq(default_lang)
      end
    end

    context 'passing a language-only BCP47 language tag' do
      let(:arg) { 'es' }

      it 'finds the matching language_region tag' do
        expect(subject.to_s).to eq('es_ES')
      end
    end

    context 'passing a full BCP47 tag' do
      let(:arg) { 'en-GB' }

      it 'finds a matching tag' do
        expect(subject.to_s).to eq('en_GB')
      end
    end

    context 'passing an extended BCP47 tag' do
      let(:arg) { 'en-US-x-twain' }

      it 'resolves to the simple tag' do
        expect(subject.to_s).to eq('en_US')
      end
    end

    context 'supporting an unavailable language' do
      let(:supported_locales) { %w[en_US en_GB zz_YY] }
      let(:arg) { 'zz_YY' }

      it 'does not include that language in candidates' do
        expect(Locale.candidates(type: :simple).map(&:to_s)).not_to include(arg)
      end

      it 'does not return a matching tag' do
        expect(subject).to be_nil
      end
    end

    context 'passing an available but not supported language' do
      let(:arg) { 'it_IT' }

      it 'arg should exist in app_language_tags' do
        expect(Locale.app_language_tags.map(&:to_s)).to include(arg)
      end

      it 'but arg should not appear in candidates' do
        expect(Locale.candidates(type: :simple).map(&:to_s)).not_to include(arg)
      end

      it 'and should return nil' do
        expect(subject).to be_nil
      end
    end
  end
end
