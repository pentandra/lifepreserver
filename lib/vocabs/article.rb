# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://ogp.me/ns/article#
require 'rdf'
module LifePreserver::Vocab
  ARTICLE = Class.new(RDF::Vocabulary("http://ogp.me/ns/article#")) do

    # Property definitions
    property :author,
      comment: "Writers of the article.".freeze,
      isDefinedBy: "http://ogp.me/ns/article#".freeze,
      label: "author".freeze,
      range: "http://ogp.me/ns/class#url".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :expiration_time,
      comment: "When the article is out of date after.".freeze,
      isDefinedBy: "http://ogp.me/ns/article#".freeze,
      label: "expiration time".freeze,
      range: "http://ogp.me/ns/class#date_time_str".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :modified_time,
      comment: "When the article was last changed.".freeze,
      isDefinedBy: "http://ogp.me/ns/article#".freeze,
      label: "modified time".freeze,
      range: "http://ogp.me/ns/class#date_time_str".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :published_time,
      comment: "When the article was first published.".freeze,
      isDefinedBy: "http://ogp.me/ns/article#".freeze,
      label: "published time".freeze,
      range: "http://ogp.me/ns/class#date_time_str".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :section,
      comment: "A high-level section name. E.g. Technology".freeze,
      isDefinedBy: "http://ogp.me/ns/article#".freeze,
      label: "section".freeze,
      range: "http://ogp.me/ns/class#string".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :tag,
      comment: "Tag words associated with this article.".freeze,
      isDefinedBy: "http://ogp.me/ns/article#".freeze,
      label: "tag".freeze,
      range: "http://ogp.me/ns/class#string".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
  end
end
