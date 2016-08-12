require "rdf"
require "rdf/vocab"

module Vocabulary

  STANDARD_PREFIXES = [ :cc, :ctag, :dc, :foaf, :owl, :prov, :rdf, :rdfs, :schema, :sioc, :skos, :xhv, :xsd ].freeze unless defined?(STANDARD_PREFIXES)

  COMPANY_PREFIXES = [ :essglobal, :pentandra, :"pentandra-blog", :"pentandra-website", :rov ].freeze unless defined?(COMPANY_PREFIXES)

  OPEN_GRAPH_PREFIXES = [ :article, :og, :profile ].freeze unless defined?(OPEN_GRAPH_PREFIXES)

  DOCUMENT_PREFIXES = [ :c4o, :deo, :doco, :fabio ].freeze unless defined?(DOCUMENT_PREFIXES)

  INSTANCE_PREFIXES = [ :dbo, :dbr, :yago ].freeze unless defined?(INSTANCE_PREFIXES)

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
