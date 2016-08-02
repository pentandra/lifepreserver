# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://dbpedia.org/ontology/
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://dbpedia.org/ontology/>
  #   class DBO < RDF::StrictVocabulary
  #   end
  class DBO < RDF::StrictVocabulary("http://dbpedia.org/ontology/")

    # Extra definitions
    term :"",
      :"cc:license" => [],
      comment: %(
              This ontology is generated from the manually created specifications in the DBpedia Mappings
              Wiki. Each release of this ontology corresponds to a new release of the DBpedia data set which
              contains instance data extracted from the different language versions of Wikipedia. For
              information regarding changes in this ontology, please refer to the DBpedia Mappings Wiki.
            ).freeze,
      :"dc:conformsTo" => [],
      :"dc:creator" => [],
      :"dc:description" => [],
      :"dc:issued" => [],
      :"dc:modified" => [],
      :"dc:publisher" => [],
      :"dc:source" => [],
      :"dc:title" => [],
      :"foaf:homepage" => [],
      :"foaf:primarytopic" => [],
      :"http://open.vocab.org/terms/defines" => [],
      :"http://purl.org/vocab/vann/preferredNamespacePrefix" => [],
      :"http://purl.org/vocab/vann/preferredNamespaceUri" => [],
      label: "".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["http://purl.org/vocommons/voaf#Vocabulary".freeze, "owl:Ontology".freeze],
      :"wdrs:describedby" => [],
      :"xhv:alternate" => [],
      :"xhv:stylesheet" => []
    term :Activity,
      label: "Activity".freeze,
      :"rdfs:isDefinedBy" => []
    term :Actor,
      label: "Actor".freeze,
      :"rdfs:isDefinedBy" => []
    term :Company,
      label: "Company".freeze,
      :"rdfs:isDefinedBy" => []
    term :Department,
      label: "Department".freeze,
      :"rdfs:isDefinedBy" => []
    term :Genre,
      label: "Genre".freeze,
      :"rdfs:isDefinedBy" => []
    term :Language,
      label: "Language".freeze,
      :"rdfs:isDefinedBy" => []
    term :Name,
      label: "Name".freeze,
      :"rdfs:isDefinedBy" => []
    term :Person,
      label: "Person".freeze,
      :"rdfs:isDefinedBy" => []
    term :Place,
      label: "Place".freeze,
      :"rdfs:isDefinedBy" => []
    term :Publisher,
      label: "Publisher".freeze,
      :"rdfs:isDefinedBy" => []
    term :School,
      label: "School".freeze,
      :"rdfs:isDefinedBy" => []
    term :Software,
      label: "Software".freeze,
      :"rdfs:isDefinedBy" => []
    term :Type,
      label: "Type".freeze,
      :"rdfs:isDefinedBy" => []
    term :birthDate,
      label: "birthDate".freeze,
      :"rdfs:isDefinedBy" => []
    term :birthPlace,
      label: "birthPlace".freeze,
      :"rdfs:isDefinedBy" => []
    term :"data/definitions.ttl",
      :"http://open.vocab.org/terms/describes" => [],
      label: "data/definitions.ttl".freeze
    term :deathDate,
      label: "deathDate".freeze,
      :"rdfs:isDefinedBy" => []
    term :deathPlace,
      label: "deathPlace".freeze,
      :"rdfs:isDefinedBy" => []
    term :thumbnail,
      label: "thumbnail".freeze,
      :"rdfs:isDefinedBy" => []
    term :wikiPageDisambiguates,
      label: "wikiPageDisambiguates".freeze,
      :"rdfs:isDefinedBy" => []
    term :wikiPageExternalLink,
      label: "wikiPageExternalLink".freeze,
      :"rdfs:isDefinedBy" => []
    term :wikiPageID,
      label: "wikiPageID".freeze,
      :"rdfs:isDefinedBy" => []
    term :wikiPageRedirects,
      label: "wikiPageRedirects".freeze,
      :"rdfs:isDefinedBy" => []
    term :wikiPageRevisionID,
      label: "wikiPageRevisionID".freeze,
      :"rdfs:isDefinedBy" => []
    term :wikiPageWikiLink,
      label: "wikiPageWikiLink".freeze,
      :"rdfs:isDefinedBy" => []
  end
end
