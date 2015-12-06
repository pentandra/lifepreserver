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
        options.merge!({ 
          :context => @item[:context] || {},
          :documentLoader => self.class.method(:load_document_local)
        })

        jsonld = ::JSON.parse repository.dump(output_format, options)

        # Pull out statements about the default graph if any exist
        if jsonld['@graph'] then
          meta = jsonld['@graph'].select { |node| node['@id'] == base_uri or node['@id'] == "" }.first
          unless meta.nil? then
            jsonld['@graph'].delete(meta)
            jsonld.merge!(meta)
          end
        end

        # Replace context with original context
        if @item[:context] then
          jsonld['@context'] = @item[:context]
        end

        ::JSON.pretty_generate jsonld
      else
        repository.dump(output_format, options)
      end

    end

    def self.load_document_local(url, options={}, &block)
      if (RDF::URI(url, canonicalize: true) == RDF::URI('http://www.w3.org/ns/anno.jsonld'))
        remote_document = JSON::LD::API::RemoteDocument.new(url, File.read('etc/contexts/anno.jsonld'))
        return block_given? ? yield(remote_document) : remote_document
      else
        JSON::LD::API.documentLoader(url, options, &block)
      end
    end

  end

end
