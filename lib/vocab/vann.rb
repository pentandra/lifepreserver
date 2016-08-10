# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/vocab/vann/
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/vocab/vann/>
  #   class VANN < RDF::StrictVocabulary
  #   end
  class VANN < RDF::StrictVocabulary("http://purl.org/vocab/vann/")

    # Property definitions
    property :changes,
      comment: %(A reference to a resource that describes changes between this version of a vocabulary and the previous.).freeze,
      label: "Changes".freeze,
      :"rdfs:isDefinedBy" => %(vann:).freeze,
      subPropertyOf: "rdfs:seeAlso".freeze,
      type: "owl:AnnotationProperty".freeze
    property :example,
      comment: %(A reference to a resource that provides an example of how this resource can be used.).freeze,
      label: "Example".freeze,
      :"rdfs:isDefinedBy" => %(vann:).freeze,
      subPropertyOf: "rdfs:seeAlso".freeze,
      type: "owl:AnnotationProperty".freeze
    property :preferredNamespacePrefix,
      comment: %(The preferred namespace prefix to use when using terms from this vocabulary in an XML document.).freeze,
      label: "Preferred Namespace Prefix".freeze,
      :"rdfs:isDefinedBy" => %(vann:).freeze,
      type: "owl:AnnotationProperty".freeze
    property :preferredNamespaceUri,
      comment: %(The preferred namespace URI to use when using terms from this vocabulary in an XML document.).freeze,
      label: "Preferred Namespace Uri".freeze,
      :"rdfs:isDefinedBy" => %(vann:).freeze,
      type: "owl:AnnotationProperty".freeze
    property :termGroup,
      comment: %(A group of related terms in a vocabulary.).freeze,
      label: "Term Group".freeze,
      :"rdfs:isDefinedBy" => %(vann:).freeze,
      type: "owl:AnnotationProperty".freeze
    property :usageNote,
      comment: %(A reference to a resource that provides information on how this resource is to be used.).freeze,
      label: "Usage Note".freeze,
      :"rdfs:isDefinedBy" => %(vann:).freeze,
      subPropertyOf: "rdfs:seeAlso".freeze,
      type: "owl:AnnotationProperty".freeze

    # Extra definitions
    term :"",
      :"dc:creator" => %(http://iandavis.com/id/me).freeze,
      :"dc:date" => %(2010-06-07).freeze,
      :"dc:description" => %(This document describes a vocabulary for annotating descriptions of vocabularies with examples and usage notes.).freeze,
      :"dc:identifier" => %(http://purl.org/vocab/vann/vann-vocab-20050401).freeze,
      :"dc:isVersionOf" => %(vann:).freeze,
      :"dc:replaces" => %(vann:vann-vocab-20040305).freeze,
      :"dc:rights" => %(Copyright © 2005 Ian Davis).freeze,
      :"dc:title" => %(VANN: A vocabulary for annotating vocabulary descriptions).freeze,
      label: "".freeze,
      type: "owl:Ontology".freeze,
      :"vann:preferredNamespacePrefix" => %(vann).freeze,
      :"vann:preferredNamespaceUri" => %(http://purl.org/vocab/vann/).freeze
  end
end
