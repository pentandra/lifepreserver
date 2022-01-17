# frozen_string_literal: true

require 'rdf'
require 'data_sources/vocabularies'

module LifePreserver
  module DataSources
    class Vocabularies
      public :register_vocabularies,
             :find_vocab_metadata,
             :load_extra_metadata,
             :cleanup
    end
  end
end

RSpec.describe LifePreserver::DataSources::Vocabularies, site: true do
  let(:data_source) { described_class.new(site.config, nil, nil, params) }
  let(:params) { {} }
  let(:site) { Nanoc::Core::SiteLoader.new.new_from_cwd }

  describe '#register_vocabularies' do
    subject! { data_source.register_vocabularies(vocabs, prefix_overrides) }

    let(:example_uri) { 'https://example/ns#' }
    let(:vocabs) { [EXAMPLE = Class.new(RDF::Vocabulary(example_uri))] }
    let(:prefix_overrides) { {} }

    context 'with local vocabularies' do
      it 'will register local vocabularies' do
        expect(RDF::Vocabulary.find(example_uri)).not_to be_nil
      end

      it 'will register with the default prefix' do
        expect(RDF::Vocabulary.find_term(example_uri).pname).to start_with('example:')
      end

      it 'will expand the pname to the original uri' do
        expect(RDF::Vocabulary.expand_pname('example:')).to eql(RDF::URI.new(example_uri))
      end
    end

    context 'with prefix overrides' do
      let(:prefix_overrides) { { EXAMPLE: 'ex' } }

      it 'will register local vocabularies' do
        expect(RDF::Vocabulary.find_term(example_uri)).not_to be_nil
      end

      it 'will register the overridden prefix in the vocab map' do
        expect(RDF::Vocabulary.vocab_map.key?(:ex)).to be true
      end

      xit 'will register the overridden prefix as the vocab default' do
        expect(RDF::Vocabulary.find_term(example_uri).pname).to start_with('ex:')
      end
    end

    context 'with vocab that defines a `name` property' do
      let(:vocabs) do
        [
          TEST = Class.new(RDF::Vocabulary('https://test/ns#')) do
            property :name,
              comment: 'This is a data property',
              label: 'name',
              range: 'http://www.w3.org/2001/XMLSchema#string',
              type: 'http://www.w3.org/2002/07/owl#DatatypeProperty'
          end,
        ]
      end

      it 'will register the correct prefix in the vocab map' do
        expect(RDF::Vocabulary.vocab_map.key?(:test)).to be true
      end

      it 'will register the correct prefix as the vocab default' do
        expect(RDF::Vocabulary.find_term('https://test/ns#name').pname).to eq('test:name')
      end
    end
  end

  describe '#find_vocab_metadata' do
    subject(:metadata) { data_source.find_vocab_metadata(vocab, extra_metadata) }

    let(:example_uri) { 'https://example/ns#' }
    let(:vocab) { EXAMPLE = Class.new(RDF::Vocabulary(example_uri)) }
    let(:extra_metadata) { {} }

    context 'without extra metadata' do
      it 'will contain only one item' do
        expect(metadata.length).to eq(1)
      end

      it 'will return the vocabulary uri' do
        expect(metadata).to include(vocab_uri: example_uri)
      end
    end

    context 'with extra metadata' do
      before { data_source.load_extra_metadata(extra_metadata) }

      let(:extra_metadata) do
        {
          'https://example/ns#': {
            title: 'The Example Vocab',
            description: 'The Example Vocab description',
          },
        }
      end

      it 'will return the correct title metadata' do
        expect(metadata[:title]).to start_with('The Example Vocab')
      end

      it 'will return the correct description metadata' do
        expect(metadata[:description]).to start_with('The Example Vocab description')
      end
    end
  end

  describe '#cleanup' do
    subject(:cleaned) { data_source.cleanup(text) }

    context 'without terminal punctuation' do
      let(:text) { 'This is a sentence' }

      it 'will end with a full stop' do
        expect(cleaned).to end_with('.')
      end
    end

    context 'with preexisting starting captial letter and terminal punctuation' do
      let(:text) { 'This is a sentence.' }

      it 'will not be changed' do
        expect(cleaned).to eql(text)
      end
    end

    context 'without capitalized first letter' do
      let(:text) { 'this is a sentence' }

      it 'will end with a full stop' do
        expect(cleaned).to start_with('T')
      end
    end
  end
end
