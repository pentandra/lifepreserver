# frozen_string_literal: true

require 'rdf'
require 'active_support/core_ext/string/inflections'

module RDF
  class Vocabulary
    class << self
      # Override __prefix__ class method to have better prefixes for some of
      # these longer vocabulary names.
      def __prefix__
        __name__.demodulize.underscore.dasherize.to_sym
      end

      def find_by_prefix(prefix)
        vocab = prefix.to_sym == :rdf ? RDF::RDFV : RDF::Vocabulary.detect { |v| v.__name__ && v.__prefix__ == prefix.to_sym }
        raise "Could not find vocabulary for prefix: #{prefix}" unless vocab

        vocab
      end
    end
  end
end
