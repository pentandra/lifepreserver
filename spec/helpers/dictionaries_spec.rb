require 'helpers/dictionaries'
require 'ffi/hunspell'

RSpec.describe LifePreserver::Dictionaries, helper: true, chdir: false do
  let(:directories) { ['etc/dictionaries'] }
  let(:default_lang) { 'en_US' }

  before do
    # set defaults
    FFI::Hunspell.directories = directories.flat_map { |d| Dir["#{d}/*/"] }
    FFI::Hunspell.lang = default_lang
    Locale.default = default_lang
    Locale.set_app_language_tags('en_US', 'en_GB', 'es_ES')

    # create some dictionaries
    ctx.create_item('content', { kind: 'base-dictionary' }, '/dir1/en_US.dic')
    ctx.create_item('content', { kind: 'base-dictionary' }, '/dir1/en_GB.dic')
    ctx.create_item('content', { kind: 'base-dictionary' }, '/dir2/es_ES.dic')
  end

  after do
    # clear out dictionary cache
    LifePreserver::Dictionaries.class_variable_set(:@@dictionaries, {})
  end

  describe '.dictionary' do
    subject { helper.dictionary(lang) }

    context 'with default parameters' do
      let(:lang) { nil }

      it 'returns a dictionary instance' do
        expect(subject).not_to be_nil
      end

      it 'returns the same object when called again' do
        dic2 = helper.dictionary
        expect(subject).to be(dic2)
      end
    end

    context 'with a hunspell language code' do
      subject { helper.dictionary(lang).lang }

      context 'with a supported language value' do
        let(:lang) { 'en_US' }

        it 'selects the given language' do
          expect(subject).to eq(lang)
        end
      end

      context 'with an unsupported language value' do
        let(:lang) { 'zz_YY' }

        it 'raises an exception' do
          expect { subject }.to raise_error(RuntimeError)
        end
      end

      context 'with a nil value' do
        let(:lang) { nil }

        it 'selects the default dictionary language' do
          expect(subject).to eq(FFI::Hunspell.lang)
        end
      end

      context 'with a BCP 47 language tag' do
        let(:lang) { 'en-Latn-US-x-twain' }

        it 'maps to the hunspell value' do
          expect(subject).to eq('en_US')
        end
      end
    end

    context 'with a non-existent base dictionary' do
      let(:lang) { 'en_UK' }

      before do
        ctx.create_item('content', { kind: 'extra-dictionary' }, '/dir1/en_UK.dic')
      end

      it 'does not accept an extra dictionary as a base dictionary' do
        expect { subject }.to raise_error(RuntimeError)
      end
    end

    context 'with dependencies' do
      before do
        ctx.create_item('content', { kind: 'personal-dictionary', entries: ['figgy/piggy', '*word', 'Nanoc'] }, '/dir1/personal.dic')
        ctx.create_item('work on this', { kind: 'extra-dictionary' }, '/dir2/extra.dic')
      end

      context 'with a personal dictionary in dir1' do
        let(:lang) { 'en-US' }

        it 'adds the personal dictionary to the dictionary dependencies' do
          expect(subject.dependencies).to include(ctx.items['/dir1/personal.dic'])
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

      context 'with an extra dictionary in dir2' do
        let(:lang) { 'es_ES' }
=begin to work on this at some point
        it 'adds the extra dictionary to the dictionary dependencies' do
          expect(subject.dependencies).to include(ctx.items['/dir2/extra.dic'])
        end
=end
      end
    end
  end

  describe '.find_closest_lang' do
    subject { helper.find_closest_lang(arg).to_s }

    context 'using a nil parameter' do
      let(:arg) { nil }
      it { is_expected.to eq(default_lang) }
    end

    context 'using an empty string' do
      let(:arg) { '' }
      it { is_expected.to eq(default_lang) }
    end

    context 'passing a simple BCP 47 language tag' do
      let(:arg) { 'es' }
      it { is_expected.to eq('es_ES') }
    end

    context 'passing a full BCP 47 tag' do
      let(:arg) { 'en-GB' }
      it { is_expected.to eq('en_GB') }
    end

    context 'passing an extended BCP 47 tag' do
      let(:arg) { 'en-US-x-twain' }
      it { is_expected.to eq('en_US') }
    end
  end
end
