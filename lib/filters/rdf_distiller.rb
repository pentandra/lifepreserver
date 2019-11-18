# frozen_string_literal: true

class RdfDistiller < Nanoc::Filter
  require_relative '../helpers/link_to'
  include LifePreserver::LinkTo

  identifiers :rdf_distiller

  requires
    'linkeddata',
    'active_support/core_ext/string/inflections',
    'active_support/core_ext/hash/slice'

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
  #   the value of the `:content` parameter passed to the class at
  #   initialization is used as the content to distill.
  #
  # @param [Hash] params
  # @option params [String, Symbol] :input The input format. If not provided,
  #   uses the item's file extension to determine the input format.
  # @option params [String, Symbol] :output (:turtle) The output format.
  # @option params [Hash] :prefixes The URI prefixes to use when generating the output.
  # @option params [Boolean] :validate (true) Whether to validate the output for correctness.
  #
  # @return [String] The distilled content
  def run(_content, params = {})
    input = params.fetch(:input, @item.identifier.ext)
    output = params.fetch(:output, :turtle)

    base_uri = params[:base_uri] || @item[:base_uri] || path_to(@item, absolute: true)
    prefix = params[:prefix] || @item[:prefix] || File.basename(@item.identifier.without_exts).camelize
    prefixes = params.fetch(:prefixes, vocabulary_prefixes_for_item)
    validate = params.fetch(:validate, false)

    output_format = RDF::Format.for(output.to_sym).to_sym

    options = {
      prefixes: prefixes,
      base_uri: base_uri.to_s,
      validate: validate,
    }

    repository = RDF::Repository.new

    RDF::Reader.for(input.to_sym).new(+assigns[:content], options) { |reader| repository << reader }

    if repository.has_statement?(RDF::Statement(RDF::URI.new(base_uri), RDF.type, RDF::OWL.Ontology))
      vocab = RDF::Vocabulary.find(base_uri) || RDF::Vocabulary.from_graph(repository, url: base_uri, class_name: prefix.to_s.upcase)

      case output_format
      when :turtle
        vocab.to_ttl(graph: repository, prefixes: prefixes)
      when :jsonld
        vocab.to_jsonld(graph: repository, prefixes: prefixes)
      when :html, :rdfa
        unless assigns[:layout]
          raise 'The HTML/RDFa output format can only be run as a layout'
        end

        vocab.to_html(graph: repository, prefixes: prefixes, template: assigns[:layout][:filename])
      else
        repository.dump(output_format, options)
      end
    else
      repository.dump(output_format, options)
    end
  end

  protected

  # @note Uses internal apis, so potentially unstable.
  def item_dependencies
    dependency_tracker = @assigns[:item]._context.dependency_tracker
    dependency_store = dependency_tracker.dependency_store
    dependency_store.dependencies_causing_outdatedness_of(@assigns[:item])
  end

  def vocabulary_prefixes_for_item
    dependencies = item_dependencies

    res = []
    dependencies.each do |dep|
      pred = dep.from

      pred_identifier =
        case pred
        when Nanoc::Core::Item
          pred.identifier.to_s
        end

      if pred_identifier && pred_identifier =~ %r{/lifepreserver/vocabularies/}
        res << pred.attributes.slice(:prefix, :namespace_uri)
      end
    end

    res.reduce(&:merge)
  end
end
