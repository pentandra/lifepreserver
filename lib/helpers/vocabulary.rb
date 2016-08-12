require "rdf"
require "rdf/vocab"

module Vocabulary

  STANDARD_VOCABULARIES = [ :cc, :ctag, :dc, :foaf, :owl, :prov, :rdf, :rdfa, :rdfs, :schema, :sioc, :skos, :xhv, :xsd ].freeze unless defined?(STANDARD_VOCABULARIES)

  COMPANY_VOCABULARIES = [ :essglobal, :pentandra, :"pentandra-blog", :"pentandra-website", :rov ].freeze unless defined?(COMPANY_VOCABULARIES)

  OPEN_GRAPH_VOCABULARIES = [ :article, :og, :profile ].freeze unless defined?(OPEN_GRAPH_VOCABULARIES)

  DOCUMENT_VOCABULARIES = [ :c4o, :deo, :doco, :fabio ].freeze unless defined?(DOCUMENT_VOCABULARIES)

  INSTANCE_VOCABULARIES = [ :dbo, :dbr, :yago ].freeze unless defined?(INSTANCE_VOCABULARIES)

  # Returns the pname for a prefix and reference
  def v(prefix, reference)
    find_by_prefix(prefix.to_sym)[reference.to_sym].pname
  end

  def curie(uri)
    RDF::Vocabulary.expand_pname(uri).pname
  end

  def prefix_mappings_for(*prefixes)
    prefixes.map { |prefix| "#{prefix}: #{RDF::Vocabulary.find_by_prefix(prefix).to_uri}" }.join(" ")
  end
end
