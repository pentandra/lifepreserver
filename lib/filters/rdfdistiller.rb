require 'linkeddata'

module Nanoc::Filters

  class RdfDistiller < Nanoc::Filter

    identifiers :rdf_distiller

    def run(content, params={})

      options = {
        standard_prefixes: true,
        prefixes: {},
        base_uri: params[:base_uri] || @item.path,
        validate: true,
      }

      in_format = params[:in] || "turtle"
      out_format = params[:out] || "turtle"

      graph = RDF::Repository.new
      
      reader = RDF::Reader.for(in_format.to_sym) {content}
      reader.new(content, options) {|r| graph << r}

      format = RDF::Format.for(out_format.to_sym).to_sym

      graph.dump(format, options)
    end

  end

end

