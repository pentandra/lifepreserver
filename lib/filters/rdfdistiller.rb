require 'linkeddata'

module Nanoc::Filters

  class RdfDistiller < Nanoc::Filter

    identifiers :rdf_distiller

    def run(content, params={})

      in_format = params[:in] || "turtle"
      out_format = params[:out] || "turtle"
      base_uri = params[:base_uri] || @item[:base_uri] || @config[:base_url] + @item.path

      options = {
        standard_prefixes: true,
        prefixes: {},
        base_uri: base_uri,
        validate: true,
        simple_compact_iris: true,
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

        # Pull out statements about the default graph if any exist
        if jsonld['@graph'] then
          meta = jsonld['@graph'].select { |node| node['@id'] == base_uri }.first
          unless meta.nil? then
            jsonld['@graph'].delete(meta)
            jsonld.merge!(meta)
          end
        end

        JSON.pretty_generate jsonld
      when :rdfxml
        graph.dump(format, options)
      else
        graph.dump(format, options)
      end

    end

  end

end

