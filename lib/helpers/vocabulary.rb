require "rdf"
require "rdf/vocab"
require "yaml"

module Vocabulary

  STANDARD_PREFIXES   ||= [ :cc, :ctag, :dc, :foaf, :owl, :prov, :rdf, :rdfs, :schema, :sioc, :skos, :xhv ].freeze
  COMPANY_PREFIXES    ||= [ :essglobal, :rov ].freeze
  OPEN_GRAPH_PREFIXES ||= [ :article, :og, :profile ].freeze
  DOCUMENT_PREFIXES   ||= [ :deo, :doco, :fabio ].freeze
  INSTANCE_PREFIXES   ||= [ :dbo, :dbr, :yago ].freeze
  EXTRA_PREFIXES      ||= [ :pentandra, :"pentandra-blog", :"pentandra-website", :xsd ].freeze

  VOAF_METADATA ||= YAML.load_file("var/voaf_metadata.yaml").freeze

  private_constant :VOAF_METADATA

  def curie(uri)
    RDF::Vocabulary.expand_pname(uri).pname
  end

  def prefix_mappings_for(*prefixes)
    prefixes.map { |prefix| "#{prefix}: #{RDF::Vocabulary.find_by_prefix(prefix).to_uri}" }.join(" ")
  end

  def ontology(vocab)
    uri = vocab.ontology ? vocab.ontology.value : vocab.to_uri.value
    VOAF_METADATA[uri.to_sym]
  end

end
