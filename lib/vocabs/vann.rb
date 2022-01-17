# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/vocab/vann/
require 'rdf'
module LifePreserver::Vocab
  VANN = Class.new(RDF::StrictVocabulary("http://purl.org/vocab/vann/")) do

    # Ontology definition
    ontology :"http://purl.org/vocab/vann/",
      "http://purl.org/dc/terms/creator": "http://iandavis.com/id/me".freeze,
      "http://purl.org/dc/terms/date": "2010-06-07".freeze,
      "http://purl.org/dc/terms/description": "This document describes a vocabulary for annotating descriptions of vocabularies with examples and usage notes.".freeze,
      "http://purl.org/dc/terms/identifier": "http://purl.org/vocab/vann/vann-vocab-20050401".freeze,
      "http://purl.org/dc/terms/isVersionOf": "http://purl.org/vocab/vann/".freeze,
      "http://purl.org/dc/terms/replaces": "http://purl.org/vocab/vann/vann-vocab-20040305".freeze,
      "http://purl.org/dc/terms/rights": "Copyright © 2005 Ian Davis".freeze,
      "http://purl.org/dc/terms/title": "VANN: A vocabulary for annotating vocabulary descriptions".freeze,
      "http://purl.org/vocab/vann/preferredNamespacePrefix": "vann".freeze,
      "http://purl.org/vocab/vann/preferredNamespaceUri": "http://purl.org/vocab/vann/".freeze,
      type: "http://www.w3.org/2002/07/owl#Ontology".freeze

    # Property definitions
    property :changes,
      comment: "A reference to a resource that describes changes between this version of a vocabulary and the previous.".freeze,
      isDefinedBy: "http://purl.org/vocab/vann/".freeze,
      label: "Changes".freeze,
      subPropertyOf: "http://www.w3.org/2000/01/rdf-schema#seeAlso".freeze,
      type: "http://www.w3.org/2002/07/owl#AnnotationProperty".freeze
    property :example,
      comment: "A reference to a resource that provides an example of how this resource can be used.".freeze,
      isDefinedBy: "http://purl.org/vocab/vann/".freeze,
      label: "Example".freeze,
      subPropertyOf: "http://www.w3.org/2000/01/rdf-schema#seeAlso".freeze,
      type: "http://www.w3.org/2002/07/owl#AnnotationProperty".freeze
    property :preferredNamespacePrefix,
      comment: "The preferred namespace prefix to use when using terms from this vocabulary in an XML document.".freeze,
      isDefinedBy: "http://purl.org/vocab/vann/".freeze,
      label: "Preferred Namespace Prefix".freeze,
      type: "http://www.w3.org/2002/07/owl#AnnotationProperty".freeze
    property :preferredNamespaceUri,
      comment: "The preferred namespace URI to use when using terms from this vocabulary in an XML document.".freeze,
      isDefinedBy: "http://purl.org/vocab/vann/".freeze,
      label: "Preferred Namespace Uri".freeze,
      type: "http://www.w3.org/2002/07/owl#AnnotationProperty".freeze
    property :termGroup,
      comment: "A group of related terms in a vocabulary.".freeze,
      isDefinedBy: "http://purl.org/vocab/vann/".freeze,
      label: "Term Group".freeze,
      type: "http://www.w3.org/2002/07/owl#AnnotationProperty".freeze
    property :usageNote,
      comment: "A reference to a resource that provides information on how this resource is to be used.".freeze,
      isDefinedBy: "http://purl.org/vocab/vann/".freeze,
      label: "Usage Note".freeze,
      subPropertyOf: "http://www.w3.org/2000/01/rdf-schema#seeAlso".freeze,
      type: "http://www.w3.org/2002/07/owl#AnnotationProperty".freeze
  end
end
