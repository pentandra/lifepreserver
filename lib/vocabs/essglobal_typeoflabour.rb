# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/essglobal/standard/type-of-labour/
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/essglobal/standard/type-of-labour/>
  #   class ESSGLOBALTypeoflabour < RDF::Vocabulary
  #   end
  class ESSGLOBALTypeoflabour < RDF::Vocabulary("http://purl.org/essglobal/standard/type-of-labour/")

    # Ontology definition
    ontology :"http://purl.org/essglobal/standard/type-of-labour/",
      "dc11:contributor": ["Alan Tygel (alantygel@gmail.com)".freeze, "Ana Alice Baptista (analice@dsi.uminho.pt)".freeze, "Craig Borowiak (cborowiakhaverford.edu)".freeze, "Daniel Tygel (dtygel@gmail.com)".freeze, "Jason Nardi (jason.nardi@gmail.com)".freeze],
      "dc11:creator": "Mariana Malta (mariana@iscap.ipp.pt)".freeze,
      "dc11:description": "SSE Initiative or SSE Network Legal form controlled vocabulary for SSE".freeze,
      "dc11:language": "en-en".freeze,
      "dc11:publisher": "http://www.ripess.org/".freeze,
      "dc11:relation": "http://www.dsi.uminho.pt/".freeze,
      "dc11:title": "Legal Form".freeze,
      "dc:created": "2014-02-06".freeze,
      "dc:publisher": "RIPESS-ESSGlobal".freeze,
      type: "skos:ConceptScheme".freeze

    # Extra definitions
    term :"#T1",
      inScheme: "essglobaltypeoflabour:".freeze,
      prefLabel: ["".freeze, "Associative".freeze],
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#T2",
      inScheme: "essglobaltypeoflabour:".freeze,
      prefLabel: ["".freeze, "Subordinate".freeze],
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#T3",
      inScheme: "essglobaltypeoflabour:".freeze,
      prefLabel: ["".freeze, "Voluntary Work".freeze],
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#T4",
      inScheme: "essglobaltypeoflabour:".freeze,
      prefLabel: ["".freeze, "Reproductive Labour/Care Work".freeze],
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#T5",
      inScheme: "essglobaltypeoflabour:".freeze,
      prefLabel: ["".freeze, "Externally hired ".freeze],
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
  end
end
