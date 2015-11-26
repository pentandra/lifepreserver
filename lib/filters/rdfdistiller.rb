require 'linkeddata'

module Nanoc::Filters

  class RdfDistiller < Nanoc::Filter

    identifiers :rdf_distiller

    def run(content, params={})

      input = params[:in] || "turtle"
      output = params[:out] || "turtle"

      base_uri = params[:base_uri] || @item[:base_uri] || @config[:base_url] + @item.path

      options = {
        standard_prefixes: true,
        prefixes: {},
        base_uri: base_uri,
        validate: true,
        simple_compact_iris: true,
      }

      repository = RDF::Repository.new
      
      RDF::Reader.for(input.to_sym).new(content, options) { |reader| repository << reader }

      output_format = RDF::Format.for(output.to_sym).to_sym

      case output_format
      when :jsonld
        if @item[:context] then
          options.merge!({ :context => @item[:context] })
        end

        jsonld = JSON.parse repository.dump(output_format, options)

        # Pull out statements about the default repository if any exist
        if jsonld['@graph'] then
          meta = jsonld['@graph'].select { |node| node['@id'] == base_uri or node['@id'] == "" }.first
          unless meta.nil? then
            jsonld['@graph'].delete(meta)
            jsonld.merge!(meta)
          end
        end

        JSON.pretty_generate jsonld
      else
        repository.dump(output_format, options)
      end

    end

  end

end

