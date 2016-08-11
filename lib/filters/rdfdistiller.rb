require 'linkeddata'

module Nanoc::Filters

  class RdfDistiller < Nanoc::Filter

    identifiers :rdf_distiller

    def run(content, params={})

      input = params.fetch(:in, @item.identifier.ext)
      output = params.fetch(:out, "turtle")

      base_uri = params[:base_uri] || @item[:base_uri] || @config[:base_url] + @item.path
      prefix = params[:prefix] || @item[:prefix] || camelize(File.basename(@item.identifier.without_exts))
      prefixes = params.fetch(:prefixes, {})
      template = params[:template] || File.expand_path("../../../etc/vocabulary.haml", __FILE__)

      output_format = RDF::Format.for(output.to_sym).to_sym

      options = {
        prefixes: prefixes,
        base_uri: base_uri,
        validate: true
      }

      repository = RDF::Repository.new
      
      RDF::Reader.for(input.to_sym).new(content, options) { |reader| repository << reader }
      
      if repository.query(predicate: RDF.type).map(&:object).include?(RDF::OWL.Ontology)
        vocab = RDF::Vocabulary.find(base_uri) || RDF::Vocabulary.from_graph(repository, url: base_uri, class_name: prefix.to_s.upcase)
      
        case output_format
        when :turtle
          vocab.to_ttl(graph: repository, prefixes: prefixes)
        when :jsonld 
          vocab.to_jsonld(graph: repository, prefixes: prefixes)
        when :rdfa
          vocab.to_html(graph: repository, prefixes: prefixes, template: template)
        else
          repository.dump(output_format, options)
        end
      else
        repository.dump(output_format, options)
      end

    end

  end

end
