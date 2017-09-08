# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from https://pentandra.com/blog#
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <https://pentandra.com/blog#>
  #   class PENTANDRABlog < RDF::Vocabulary
  #   end
  class PENTANDRABlog < RDF::Vocabulary("https://pentandra.com/blog#")

    # Ontology definition
    ontology :"https://pentandra.com/blog",
      :"cc:attributionName" => %(Pentandra Research Solutions, Inc.).freeze,
      :"cc:attributionURL" => %(https://pentandra.com).freeze,
      :"cc:license" => %(http://creativecommons.org/licenses/by/4.0/).freeze,
      :"cc:useGuidelines" => %(https://pentandra.com/policy/).freeze,
      :"og:description" => %(A collection of our thoughts about Pentandra and the future of research.).freeze,
      :"og:locale" => %(en_US).freeze,
      :"og:site_name" => %(Pentandra).freeze,
      :"og:title" => %(Blog).freeze,
      :"og:type" => %(website).freeze,
      :"og:url" => %(https://pentandra.com/blog/).freeze,
      :"schema:copyrightHolder" => %(https://pentandra.com/company#company).freeze,
      :"schema:copyrightYear" => %(2011).freeze,
      :"schema:hasPart" => [%(pentandra-blog:latest-articles).freeze, %(pentandra-blog:posts).freeze],
      :"schema:isPartOf" => %(pentandra-website:website).freeze,
      :"schema:publisher" => %(https://pentandra.com/company#company).freeze,
      type: ["cc:Work".freeze, "prov:Entity".freeze, "schema:WebPage".freeze]
  end
end
