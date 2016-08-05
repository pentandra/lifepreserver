require "rdf"
require "rdf/vocab"
require_relative 'text'

module Vocabulary

  # Returns the pname for a prefix and reference
  def v(prefix, reference)
    find_by_prefix(prefix.to_sym)[reference.to_sym].pname
  end

  def curie(uri)
    RDF::Vocabulary.expand_pname(uri).pname
  end

  def prefixes_for(*prefixes)
    prefixes.map { |prefix| "#{prefix}: #{find_by_prefix(prefix).to_uri}" }.join(" ")
  end

  def find_by_prefix(prefix)
    vocab = RDF::Vocabulary.detect { |v| v.__prefix__ == prefix.to_sym }

    if vocab.nil?
      # FIXME find better exception
      raise Nanoc::Int::Errors::GenericTrivial.new("Cannot find vocabulary for prefix: #{prefix}")
    end

    vocab
  end

  def standard_vocabularies
    [ :cc, :ctag, :dc, :foaf, :owl, :prov, :rdf, :rdfa, :rdfs, :schema, :sioc, :skos, :xhv, :xsd ]
  end

  def company_vocabularies
    [ :essglobal, :pentandra, :"pentandra-blog", :"pentandra-website", :rov ]
  end

  def open_graph_vocabularies
    [ :article, :og, :profile ]
  end

  def document_vocabularies
    [ :deo, :doco, :c4o ]
  end

  def instance_vocabularies
    [ :dbo, :dbr, :yago ]
  end

end

module RDF

  class Vocabulary

    include Text

    # Override __prefix__ class method to have better prefixes for some of
    # these longer vocabulary names.
    def self.__prefix__
      hyphenate(__name__.split('::').last).to_sym
    end
    
  end

end
