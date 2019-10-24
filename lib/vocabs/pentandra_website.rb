# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from https://pentandra.com#
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <https://pentandra.com#>
  #   class PENTANDRAWebsite < RDF::Vocabulary
  #   end
  class PENTANDRAWebsite < RDF::Vocabulary("https://pentandra.com#")

    # Ontology definition
    ontology :"https://pentandra.com#",
      "cc:attributionName": "Pentandra Research Solutions, Inc.".freeze,
      "cc:attributionURL": "https://pentandra.com".freeze,
      "cc:license": "http://creativecommons.org/licenses/by/4.0/".freeze,
      "cc:useGuidelines": "https://pentandra.com/policy/".freeze,
      "og:description": "A high-level overview of who we are and what we do.".freeze,
      "og:image": "https://pentandra.com/images/pentandra-logo.png".freeze,
      "og:locale": "en_US".freeze,
      "og:site_name": "Pentandra".freeze,
      "og:title": "Overview".freeze,
      "og:type": "website".freeze,
      "og:url": "https://pentandra.com/".freeze,
      "schema:copyrightHolder": "https://pentandra.com/company#company".freeze,
      "schema:copyrightYear": "2011".freeze,
      "schema:hasPart": "pentandra-blog:latest-articles".freeze,
      "schema:headline": "Breaking Research Barriers".freeze,
      "schema:isPartOf": "pentandra-website:website".freeze,
      "schema:publisher": "https://pentandra.com/company#company".freeze,
      type: ["cc:Work".freeze, "prov:Entity".freeze, "schema:WebPage".freeze]
  end
end
