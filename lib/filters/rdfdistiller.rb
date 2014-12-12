require 'linkeddata'

module Nanoc::Filters

  class RdfDistiller < Nanoc::Filter

    identifiers :rdf_distiller

    def run(content, params={})

      prefixes = {}

      in_format = params[:in] || "turtle"
      out_format = params[:out] || "turtle"

      graph = RDF::Repository.new
      
      reader = RDF::Reader.for(in_format.to_sym) {content}
      reader.new(content, :prefixes => prefixes) {|r| graph << r}

      format = RDF::Format.for(out_format.to_sym)

      graph.dump(format.to_sym, :prefixes => prefixes )
    end

  end

end

