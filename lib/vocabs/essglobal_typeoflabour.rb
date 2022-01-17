# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/essglobal/standard/type-of-labour/
require 'rdf'
module LifePreserver::Vocab
  ESSGlobalTypeoflabour = Class.new(RDF::Vocabulary("http://purl.org/essglobal/standard/type-of-labour/")) do

    # Ontology definition
    ontology :"http://purl.org/essglobal/standard/type-of-labour/",
      "http://purl.org/dc/elements/1.1/contributor": ["Alan Tygel (alantygel@gmail.com)".freeze, "Ana Alice Baptista (analice@dsi.uminho.pt)".freeze, "Craig Borowiak (cborowiakhaverford.edu)".freeze, "Daniel Tygel (dtygel@gmail.com)".freeze, "Jason Nardi (jason.nardi@gmail.com)".freeze],
      "http://purl.org/dc/elements/1.1/creator": "Mariana Malta (mariana@iscap.ipp.pt)".freeze,
      "http://purl.org/dc/elements/1.1/description": "SSE Initiative or SSE Network Legal form controlled vocabulary for SSE".freeze,
      "http://purl.org/dc/elements/1.1/language": "en-en".freeze,
      "http://purl.org/dc/elements/1.1/publisher": "http://www.ripess.org/".freeze,
      "http://purl.org/dc/elements/1.1/relation": "http://www.dsi.uminho.pt/".freeze,
      "http://purl.org/dc/elements/1.1/title": "Legal Form".freeze,
      "http://purl.org/dc/terms/created": "2014-02-06".freeze,
      "http://purl.org/dc/terms/publisher": "RIPESS-ESSGlobal".freeze,
      type: "http://www.w3.org/2004/02/skos/core#ConceptScheme".freeze

    # Extra definitions
    term :"#T1",
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/type-of-labour/".freeze,
      prefLabel: ["".freeze, "Associative".freeze],
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#T2",
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/type-of-labour/".freeze,
      prefLabel: ["".freeze, "Subordinate".freeze],
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#T3",
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/type-of-labour/".freeze,
      prefLabel: ["".freeze, "Voluntary Work".freeze],
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#T4",
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/type-of-labour/".freeze,
      prefLabel: ["".freeze, "Reproductive Labour/Care Work".freeze],
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#T5",
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/type-of-labour/".freeze,
      prefLabel: ["".freeze, "Externally hired ".freeze],
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
  end
end
