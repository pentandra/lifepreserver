# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'rdf'
require 'rdf/vocab'
require 'yaml'

module LifePreserver
  module DataSources
    class Vocabularies < Nanoc::DataSource
      identifier :vocabularies

      class UnknownVocabulary < ::Nanoc::Core::TrivialError
        def initialize(uri)
          super("A vocabulary with the uri “#{uri}” (specified in the site's configuration file) was not found.")
        end
      end

      class UnknownVocabularyPrefix < ::Nanoc::Core::TrivialError
        def initialize(prefix)
          super("A vocabulary with the prefix “#{prefix}” (specified in the site's configuration file) was not found.")
        end
      end

      def up
        load_extra_metadata(@config[:extra_metadata])

        local_vocabs =
          LifePreserver::Vocab.constants
                              .map(&LifePreserver::Vocab.method(:const_get))
                              .select { |constant| constant.is_a? Class }
        register_vocabularies(local_vocabs)

        register_prefixes(@config[:prefix_overrides])

        if (categories = @config[:categories])
          prefixes = categories.values.flatten
          RDF::Vocabulary.limit_vocabs(*prefixes.map(&:to_sym))
        end
      end

      # Returns the collection of Vocabulary items, one per vocabulary prefix.
      #
      # @raise [UnknownVocabularyPrefix] if a vocabulary prefix specified in site config
      #   does not have a mapping to an {RDF::Vocabulary} class.
      # @return [Enumerable] The collection of items.
      def items
        items = []

        @config.fetch(:categories, {}).each do |category, prefixes|
          prefixes.each do |prefix|
            # TODO: submit patch for RDF::Vocabulary to handle this edge case?
            vocab = RDF::Vocabulary.vocab_map[prefix == 'rdf' ? :rdfv : prefix.to_sym]
            raise UnknownVocabularyPrefix.new(prefix) unless vocab

            vocab_class = vocab.fetch(:class, RDF::Vocabulary.from_sym(vocab.fetch(:class_name).to_sym))
            items << vocabulary_to_item(prefix, vocab_class, category)
          end
        end

        items
      end

      protected

      def vocabulary_to_item(prefix, vocab, category)
        metadata = find_vocab_metadata(vocab, @extra_metadata)

        attributes = {
          kind: 'vocabulary',
          prefix: prefix,
          category: category,
          namespace_uri: vocab.to_uri.value,
          is_hidden: true,
        }

        new_item(
          '',
          attributes.merge(metadata),
          File.join(File::SEPARATOR, category.to_s.parameterize, prefix.to_s.parameterize),
        )
      end

      # Clean up punctuation of given text. Start with capital letter
      # and end with a full stop if it doesn't already end with some sort of
      # terminal punctuation.
      def cleanup(text)
        text = text.upcase_first
        text[/[.!?]$/] ? text : text << '.'
      end

      # Return the URI of the given vocabulary.
      #
      # @param vocab [RDF::Vocabulary] The vocabulary.
      # @return [String]
      def vocab_uri(vocab)
        # HACK: until we have better handling of ontology definitions at a
        # different uri than the vocabulary namespace.
        if vocab == RDF::Vocab::VOID
          'http://vocab.deri.ie/void'
        else
          vocab.ontology ? vocab.ontology.value : vocab.to_uri.value
        end
      end

      # Find the descriptive metadata of the given vocabulary, searching
      # within the given (normalized) metadata.
      #
      # Provided metadata is expected to have the following form:
      #
      # @example YAML vocabulary metadata format
      #   vocab_uri:
      #     title: Vocab title
      #     description: Vocab description
      #
      # @param vocab [RDF::Vocabulary] The vocabulary.
      # @return [Hash] Descriptive metadata for the given vocabulary, if found.
      #   Otherwise, an empty Hash.
      def find_vocab_metadata(vocab, extra_metadata = {})
        vocab_uri = vocab_uri(vocab)

        metadata = Hash(extra_metadata[vocab_uri.to_sym] || extra_metadata[vocab_uri.split(%r{[/#]$})[0].to_sym])
        metadata[:vocab_uri] = vocab_uri

        if metadata.key?(:description)
          metadata[:description] = cleanup(metadata[:description])
        end

        metadata
      end

      # Load descriptive metadata for RDF vocabularies into the class.
      #
      # @note called by {#up} when the site is loading.
      # @param metadata [Hash,String] the extra metadata. If a String, a
      #   relative path to a YAML file, which will be loaded. If Hash, is used
      #   directly as metadata.
      # @return [Hash{Symbol=>Symbol}] the extra metadata.
      def load_extra_metadata(metadata)
        return if metadata.nil? || metadata.empty?

        @extra_metadata =
          case metadata
          when String
            File.open(metadata) do |file|
              YAML.safe_load(file.read,
                             filename: file.path,
                             permitted_classes: [Symbol])
            end
          when Hash
            metadata
          end
      end

      # Register local vocabularies with the Ruby RDF framework.
      #
      # Sets the vocabulary class name if specified in the {:prefix_overrides}
      # key of the data source configuration.
      #
      # @note called by {#up} when the site is loading.
      #
      # @param vocabs [Array<RDF::Vocabulary>] Vocabulary classes to register.
      #
      # @return [void]
      def register_vocabularies(vocabs)
        Array(vocabs).each do |vocab|
          class_name = vocab.__name__.to_s.demodulize
          prefix = class_name.downcase
          RDF::Vocabulary.register(prefix.to_sym, vocab, class_name: class_name)
        end
      end

      # Register prefixes with the Ruby RDF framework.
      #
      # @note called by {#up} when the site is loading.
      #
      # @raise [UnknownVocabulary] if an {RDF::Vocabulary} with the uri specified in 
      #   site config is not found.
      # @param prefixes [Hash{String,Symbol=>String}] Mapping of URI=>prefix pairs.
      # @return [void]
      def register_prefixes(prefixes)
        Hash(prefixes).each do |uri, prefix|
          vocab = RDF::Vocabulary.find(uri.to_s)
          raise UnknownVocabulary.new(uri.to_s) unless vocab
          vocab.__prefix__ = prefix.to_sym
        end
      end
    end
  end
end
