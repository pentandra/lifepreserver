class RdfDistiller < Nanoc::Filter

  identifiers :rdf_distiller

  requires 'linkeddata', 'active_support/core_ext/string/inflections'

  # Distill the item into different
  # [RDF](https://www.w3.org/TR/rdf11-concepts/) representations.
  #
  # This filter can be run as a filter and as a layout. This idea is borrowed
  # from the Nanoc::Filters::XSL filter. The HTML/RDFa output format can only
  # be run as a layout, since a template is needed by the RDF::Vocab
  # extension `:to_html`.
  #
  # @example Invoking the filter as a layout
  #
  #     compile '/spec/**/*.ttl' do
  #       layout '/template.*'
  #     end
  #
  #     layout '/template.*', :rdf_distiller, format: :html
  #
  # @param [String] _content Ignored. As the filter can be run as a layout,
  # the value of the `:content` parameter passed to the class at
  # initialization is used as the content to distill.
  #
  # @param [Hash] params
  #
  # @return [String] The distilled content
  def run(_content, params={})

    input = params.fetch(:input_format, @item.identifier.ext)
    output = params.fetch(:format, "turtle")

    base_uri = params[:base_uri] || @item[:base_uri] || @config[:base_url] + @item.path
    prefix = params[:prefix] || @item[:prefix] || File.basename(@item.identifier.without_exts).camelize
    prefixes = params.fetch(:prefixes, {})

    output_format = RDF::Format.for(output.to_sym).to_sym

    options = {
      prefixes: prefixes,
      base_uri: base_uri,
      validate: true
    }

    repository = RDF::Repository.new
    
    RDF::Reader.for(input.to_sym).new(assigns[:content], options) { |reader| repository << reader }
    
    if repository.has_statement?(RDF::Statement(RDF::URI.new(base_uri), RDF.type, RDF::OWL.Ontology))
      vocab = RDF::Vocabulary.find(base_uri) || RDF::Vocabulary.from_graph(repository, url: base_uri, class_name: prefix.to_s.upcase)
    
      case output_format
      when :turtle
        vocab.to_ttl(graph: repository, prefixes: prefixes)
      when :jsonld 
        vocab.to_jsonld(graph: repository, prefixes: prefixes)
      when :rdfa
        raise 'The HTML/RDFa output format can only be run as a layout' unless assigns[:layout]
        vocab.to_html(graph: repository, prefixes: prefixes, template: assigns[:layout][:filename])
      else
        repository.dump(output_format, options)
      end
    else
      repository.dump(output_format, options)
    end

  end

end
