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

  def prefix_mappings_for(*prefixes)
    prefixes.map { |prefix| "#{prefix}: #{RDF::Vocabulary.find_by_prefix(prefix).to_uri}" }.join(" ")
  end

  def vocabularies_for(group)
    @items.find_all("/project/vocabularies/#{group}/*")
  end

end
