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

    # Extra definitions
    term :banner,
      label: "banner".freeze,
      :"xhv:role" => []
    term :blog,
      :"http://commontag.org/ns#tagged" => [],
      label: "blog".freeze,
      :"schema:blogPost" => [],
      :"schema:name" => [],
      :"sioc:name" => [],
      type: ["http://rdfs.org/sioc/types#Weblog".freeze, "schema:Blog".freeze]
    term :contentinfo,
      label: "contentinfo".freeze,
      :"xhv:role" => []
  end
end
