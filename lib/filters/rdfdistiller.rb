require 'linkeddata'

module Nanoc::Filters

  class RdfDistiller < Nanoc::Filter

    identifiers :rdf_distiller

    def run(content, params={})

      in_format = params[:in] || "turtle"
      out_format = params[:out] || "turtle"
      base_uri = params[:base_uri] || @item[:base_uri] || @site.config[:base_url] + @item.path

      options = {
        standard_prefixes: true,
        prefixes: {},
        base_uri: base_uri,
        validate: true,
      }

      graph = RDF::Repository.new
      
      reader = RDF::Reader.for(in_format.to_sym) {content}
      reader.new(content, options) {|r| graph << r}

      format = RDF::Format.for(out_format.to_sym).to_sym

      case format
      when :jsonld
        if @item[:context] then
          options.merge!({ :context => @item[:context] })
        end

        jsonld = JSON.parse graph.dump(format, options)

        if jsonld['@graph'] then

          # Restructure ontology meta to the top level
          meta = jsonld['@graph'].select { |statement| statement['@type'] == 'owl:Ontology' }.first
          unless meta.nil? then
            jsonld['@graph'].delete(meta)
            jsonld.merge!(meta)
          end

          # Pull out ontology definitions into an array
          defines = jsonld['@graph'].select { |statement| statement.has_key?('rdfs:isDefinedBy') }
          defines.each do |defined|
            if defined['rdfs:isDefinedBy'] == base_uri
              jsonld['@graph'].delete(defined)
              defined.delete('rdfs:isDefinedBy')
            end
          end

          jsonld['defines'] = defines unless defines.empty?

          jsonld.delete('@graph') if jsonld['@graph'].empty?

          JSON.pretty_generate jsonld
        else 
          graph.dump(format, options)
        end
        
      when :rdfxml
        graph.dump(format, options)
      else
        graph.dump(format, options)

      end

    end

  end

end

