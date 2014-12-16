require 'linkeddata'

module Nanoc::Filters

  class RdfDistiller < Nanoc::Filter

    identifiers :rdf_distiller

    def run(content, params={})

      in_format = params[:in] || "turtle"
      out_format = params[:out] || "turtle"
      base_uri = params[:base_uri] || @item[:base_uri] || @item.path

      options = {
        standard_prefixes: true,
        prefixes: {},
        #base_uri: base_uri,
        validate: true,
      }

      graph = RDF::Repository.new
      
      reader = RDF::Reader.for(in_format.to_sym) {content}
      reader.new(content, options) {|r| graph << r}

      format = RDF::Format.for(out_format.to_sym).to_sym

      case format
      when :jsonld
        if @item[:context] then
          context = JSON.parse(@item[:context])
          options.merge!({ :context => context['@context'] })
        end

        jsonld = JSON.parse graph.dump(format, options)

        base = jsonld['@graph'].select { |statement| statement['@id'] == base_uri }.first
        unless base.nil? then
          jsonld['@graph'].delete(base)
          jsonld.merge!(base)
        end

        defines = jsonld['@graph'].select { |statement| statement.has_key?('rdfs:isDefinedBy') }
        defines.each do |s|
          jsonld['@graph'].delete(s)
          s.delete('rdfs:isDefinedBy')
        end
        jsonld['defines'] = defines unless defines.empty?

        jsonld.delete('@graph') if jsonld['@graph'].empty?

        JSON.pretty_generate jsonld
      when :rdfxml
        graph.dump(format, options)
      else
        graph.dump(format, options)
      end

    end

  end

end

