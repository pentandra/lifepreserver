require 'rdf/turtle'
require 'json/ld'

module Nanoc::Filters

  class ConvertTurtleToJsonLD < Nanoc::Filter

    identifiers :turtle2jsonld

    def run(content, params={})

      context = JSON.parse params[:context]

      graph = RDF::Graph.new << RDF::Turtle::Reader.new(content)

      compacted = nil
      JSON::LD::API::fromRdf(graph) do |expanded|
        compacted = JSON::LD::API.compact(expanded, context['@context'])
      end

      compacted
    end

  end

end

