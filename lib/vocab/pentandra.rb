# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from https://pentandra.com/company#
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <https://pentandra.com/company#>
  #   class PENTANDRA < RDF::Vocabulary
  #   end
  class PENTANDRA < RDF::Vocabulary("https://pentandra.com/company#")

    # Extra definitions
    term :banner,
      label: "banner".freeze,
      :"xhv:role" => []
    term :"chris-chapman",
      :"foaf:img" => [],
      :"foaf:isPrimaryTopicOf" => [],
      :"foaf:mbox" => [],
      :"foaf:name" => [],
      label: "chris-chapman".freeze,
      :"schema:description" => [],
      :"schema:email" => [],
      :"schema:image" => [],
      :"schema:jobTitle" => [],
      :"schema:name" => [],
      :"schema:worksFor" => [],
      type: ["foaf:Person".freeze, "schema:Person".freeze]
    term :company,
      :"foaf:homepage" => [],
      :"http://purl.org/essglobal/vocab/economicSector" => [],
      :"http://purl.org/essglobal/vocab/legalForm" => [],
      :"http://purl.org/essglobal/vocab/mission" => [],
      :"http://purl.org/essglobal/vocab/objective" => [],
      :"http://purl.org/essglobal/vocab/qualifier" => [],
      :"http://vocab.data.gov/def/fea#description" => [],
      :"http://vocab.data.gov/def/fea#hasIntent" => [],
      label: "company".freeze,
      :"schema:description" => [],
      :"schema:email" => [],
      :"schema:employee" => [],
      :"schema:legalName" => [],
      :"schema:logo" => [],
      :"schema:name" => [],
      :"schema:potentialAction" => [],
      :"schema:telephone" => [],
      :"schema:url" => [],
      type: ["foaf:Organization".freeze, "http://purl.org/essglobal/vocab/SSEInitiative".freeze, "http://vocab.data.gov/def/fea#Company".freeze, "schema:Corporation".freeze]
    term :contact,
      label: "contact".freeze,
      type: "schema:ContactPage".freeze
    term :contentinfo,
      label: "contentinfo".freeze,
      :"xhv:role" => []
    term :coreteam,
      :"foaf:member" => [],
      :"foaf:name" => [],
      label: "coreteam".freeze,
      type: "foaf:Group".freeze
    term :donate,
      label: "donate".freeze,
      :"schema:description" => [],
      :"schema:name" => [],
      :"schema:recipient" => [],
      :"schema:target" => [],
      type: "schema:DonateAction".freeze
    term :"katie-chapman",
      :"foaf:img" => [],
      :"foaf:isPrimaryTopicOf" => [],
      :"foaf:mbox" => [],
      :"foaf:name" => [],
      label: "katie-chapman".freeze,
      :"schema:description" => [],
      :"schema:email" => [],
      :"schema:image" => [],
      :"schema:jobTitle" => [],
      :"schema:name" => [],
      :"schema:worksFor" => [],
      type: ["foaf:Person".freeze, "schema:Person".freeze]
    term :mission,
      :"http://vocab.data.gov/def/fea#description" => [],
      label: "mission".freeze,
      type: "http://vocab.data.gov/def/fea#Mission".freeze
  end
end
