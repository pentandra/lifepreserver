# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://ogp.me/ns/profile#
require 'rdf'
module LifePreserver::Vocab
  PROFILE = Class.new(RDF::Vocabulary("http://ogp.me/ns/profile#")) do

    # Property definitions
    property :first_name,
      comment: "A name normally given to an individual by a parent or self-chosen.".freeze,
      isDefinedBy: "http://ogp.me/ns/profile#".freeze,
      label: "first name".freeze,
      range: "http://ogp.me/ns/class#string".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :gender,
      comment: "Their gender.".freeze,
      isDefinedBy: "http://ogp.me/ns/profile#".freeze,
      label: "gender".freeze,
      range: "http://ogp.me/ns/class#gender_str".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :last_name,
      comment: "A name inherited from a family or marriage and by which the individual is commonly known.".freeze,
      isDefinedBy: "http://ogp.me/ns/profile#".freeze,
      label: "last name".freeze,
      range: "http://ogp.me/ns/class#string".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :username,
      comment: "A short unique string to identify them.".freeze,
      isDefinedBy: "http://ogp.me/ns/profile#".freeze,
      label: "username".freeze,
      range: "http://ogp.me/ns/class#string".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
  end
end
