module RDF

  class Vocabulary

    class << self

      include Text

      # Override __prefix__ class method to have better prefixes for some of
      # these longer vocabulary names.
      def __prefix__
        hyphenate(__name__.split('::').last).to_sym
      end

      def find_by_prefix(prefix)
        RDF::Vocabulary.detect { |v| v.__name__ && v.__prefix__ == prefix.to_sym }
      end

    end
    
  end

end
