# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from https://pentandra.com/blog#
require 'rdf'
module LifePreserver::Vocab
  PentandraBlog = Class.new(RDF::Vocabulary("https://pentandra.com/blog#")) do

    # Ontology definition
    ontology :"https://pentandra.com/blog#",
      "http://creativecommons.org/ns#attributionName": "Pentandra Research Solutions, Inc.".freeze,
      "http://creativecommons.org/ns#attributionURL": "https://pentandra.com".freeze,
      "http://creativecommons.org/ns#license": "http://creativecommons.org/licenses/by/4.0/".freeze,
      "http://creativecommons.org/ns#useGuidelines": "https://pentandra.com/policy/".freeze,
      "http://ogp.me/ns#description": "A collection of our thoughts about Pentandra and the future of research.".freeze,
      "http://ogp.me/ns#locale": "en".freeze,
      "http://ogp.me/ns#site_name": "Pentandra".freeze,
      "http://ogp.me/ns#title": "Blog".freeze,
      "http://ogp.me/ns#type": "website".freeze,
      "http://ogp.me/ns#url": "https://pentandra.com/blog/".freeze,
      "http://schema.org/copyrightHolder": "https://pentandra.com/company#company".freeze,
      "http://schema.org/copyrightYear": "2011".freeze,
      "http://schema.org/hasPart": "pentandra-blog:latest-articles".freeze,
      "http://schema.org/isPartOf": "pentandra-website:website".freeze,
      "http://schema.org/publisher": "https://pentandra.com/company#company".freeze,
      type: ["http://creativecommons.org/ns#Work".freeze, "http://schema.org/WebPage".freeze, "http://www.w3.org/ns/prov#Entity".freeze]
  end
end
