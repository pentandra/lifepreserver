# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://ogp.me/ns/profile#
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://ogp.me/ns/profile#>
  #   class PROFILE < RDF::Vocabulary
  #   end
  class PROFILE < RDF::Vocabulary("http://ogp.me/ns/profile#")

    # Property definitions
    property :first_name,
      comment: %(A name normally given to an individual by a parent or self-chosen.).freeze,
      label: "first name".freeze,
      range: "ogc:string".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :gender,
      comment: %(Their gender.).freeze,
      label: "gender".freeze,
      range: "ogc:gender_str".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :last_name,
      comment: %(A name inherited from a family or marriage and by which the individual is commonly known.).freeze,
      label: "last name".freeze,
      range: "ogc:string".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :username,
      comment: %(A short unique string to identify them.).freeze,
      label: "username".freeze,
      range: "ogc:string".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
  end
end
