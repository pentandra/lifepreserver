# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://ogp.me/ns/article#
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://ogp.me/ns/article#>
  #   class ARTICLE < RDF::Vocabulary
  #   end
  class ARTICLE < RDF::Vocabulary("http://ogp.me/ns/article#")

    # Property definitions
    property :author,
      comment: %(Writers of the article.).freeze,
      isDefinedBy: "article:".freeze,
      label: "author".freeze,
      range: "ogc:url".freeze,
      type: "rdf:Property".freeze
    property :expiration_time,
      comment: %(When the article is out of date after.).freeze,
      isDefinedBy: "article:".freeze,
      label: "expiration time".freeze,
      range: "ogc:date_time_str".freeze,
      type: "rdf:Property".freeze
    property :modified_time,
      comment: %(When the article was last changed.).freeze,
      isDefinedBy: "article:".freeze,
      label: "modified time".freeze,
      range: "ogc:date_time_str".freeze,
      type: "rdf:Property".freeze
    property :published_time,
      comment: %(When the article was first published.).freeze,
      isDefinedBy: "article:".freeze,
      label: "published time".freeze,
      range: "ogc:date_time_str".freeze,
      type: "rdf:Property".freeze
    property :section,
      comment: %(A high-level section name. E.g. Technology).freeze,
      isDefinedBy: "article:".freeze,
      label: "section".freeze,
      range: "ogc:string".freeze,
      type: "rdf:Property".freeze
    property :tag,
      comment: %(Tag words associated with this article.).freeze,
      isDefinedBy: "article:".freeze,
      label: "tag".freeze,
      range: "ogc:string".freeze,
      type: "rdf:Property".freeze
  end
end
