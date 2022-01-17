# frozen_string_literal: true

require 'rdf'
require 'rdf/vocabulary'
require 'rdf/vocab'
require 'rdf/vocab/extensions'
require 'active_support/core_ext/string/inflections'

module RDF
  class Vocabulary
    class << self
      ##
      # Return the vocabulary based on it's class_name symbol
      #
      # @param sym [Symbol]
      # @return [RDF::Vocabulary]
      alias_method :_orig_orig_from_sym, :from_sym
      def from_sym(sym)
        LifePreserver::Vocab.const_defined?(sym.to_sym) ?
          LifePreserver::Vocab.const_get(sym.to_sym) : _orig_orig_from_sym(sym)
      end

      ##
      # Limits iteration over vocabularies to just those selected
      #
      # @example limit to set of vocabularies by symbol
      #     RDF::Vocabulary.limit_vocabs(:rdf, :rdfs, :schema)
      #     RDF::Vocabulary.find_term('http://schema.org/CreativeWork').pname
      #     # => 'schema:CreativeWork'
      #
      # @example limit to set of vocabularies by class name
      #     RDF::Vocabulary.limit_vocabs(RDF::RDFV, RDF::RDFS, RDF::Vocab::SCHEMA)
      #     RDF::Vocabulary.find_term('http://schema.org/CreativeWork').pname
      #     # => 'schema:CreativeWork'
      #
      # @param [Array<symbol, RDF::Vocabulary>] vocabs
      #   A list of vocabularies (symbols or classes) which may
      #   be returned by {Vocabulary.each}. Also limits
      #   vocabularies that will be inspeced for other methods.
      #   Set to nil, or an empty array to reset.
      # @return [Array<RDF::Vocabulary>]
      def limit_vocabs(*vocabs)
        @vocabs = if Array(vocabs).empty?
          nil
        else
          @classes_loaded = true
          vocabs.map do |vocab|
            case vocab
            when :rdf, :rdfv
              RDF::RDFV
            when Symbol
              if RDF::VOCABS.key?(vocab)
                RDF.const_get(RDF::VOCABS[vocab][:class_name].to_sym)
              elsif RDF::Vocab::VOCABS.key?(vocab)
                RDF::Vocab.const_get(RDF::Vocab::VOCABS[vocab][:class_name].to_sym)
              else
                @vocab_map.dig(vocab, :class) || LifePreserver::Vocab.const_get(@vocab_map.dig(vocab, :class_name).to_sym)
              end
            when Class
              vocab
            end
          end.compact
        end
      end
    end
  end
end
