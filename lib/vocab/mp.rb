# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/mp/
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/mp/>
  #   class MP < RDF::StrictVocabulary
  #   end
  class MP < RDF::StrictVocabulary("http://purl.org/mp/")

    # Class definitions
    term :ArticleText,
      label: "ArticleText".freeze,
      subClassOf: "mp:Representation".freeze,
      type: "owl:Class".freeze
    term :Artifact,
      label: "Artifact".freeze,
      subClassOf: "prov:Entity".freeze,
      type: "owl:Class".freeze
    term :Attribution,
      label: "Attribution".freeze,
      subClassOf: "mp:Representation".freeze,
      type: "owl:Class".freeze
    term :Claim,
      label: "Claim".freeze,
      subClassOf: "mp:Statement".freeze,
      type: "owl:Class".freeze
    term :Data,
      label: "Data".freeze,
      subClassOf: "mp:Representation".freeze,
      type: "owl:Class".freeze
    term :Holotype,
      label: "Holotype".freeze,
      subClassOf: "mp:Statement".freeze,
      type: "owl:Class".freeze
    term :Material,
      label: "Material".freeze,
      subClassOf: "mp:Method".freeze,
      type: "owl:Class".freeze
    term :Method,
      label: "Method".freeze,
      subClassOf: "mp:Representation".freeze,
      type: "owl:Class".freeze
    term :Micropublication,
      label: "Micropublication".freeze,
      subClassOf: "mp:Representation".freeze,
      type: "owl:Class".freeze
    term :Procedure,
      label: "Procedure".freeze,
      subClassOf: "mp:Method".freeze,
      type: "owl:Class".freeze
    term :QualifiedStatement,
      label: "QualifiedStatement".freeze,
      subClassOf: "mp:Statement".freeze,
      type: "owl:Class".freeze
    term :Qualifier,
      label: "Qualifier".freeze,
      subClassOf: "mp:Sentence".freeze,
      type: "owl:Class".freeze
    term :Reference,
      label: "Reference".freeze,
      subClassOf: "mp:Qualifier".freeze,
      type: "owl:Class".freeze
    term :ReferencedStatement,
      label: "ReferencedStatement".freeze,
      subClassOf: "mp:QualifiedStatement".freeze,
      type: "owl:Class".freeze
    term :Representation,
      label: "Representation".freeze,
      subClassOf: "mp:Artifact".freeze,
      type: "owl:Class".freeze
    term :SemanticQualifier,
      label: "SemanticQualifier".freeze,
      subClassOf: "mp:Qualifier".freeze,
      type: "owl:Class".freeze
    term :Sentence,
      label: "Sentence".freeze,
      subClassOf: "mp:Representation".freeze,
      type: "owl:Class".freeze
    term :Statement,
      label: "Statement".freeze,
      subClassOf: "mp:Sentence".freeze,
      type: "owl:Class".freeze
    term :TaggedStatement,
      label: "TaggedStatement".freeze,
      subClassOf: "mp:QualifiedStatement".freeze,
      type: "owl:Class".freeze

    # Property definitions
    property :arguedBy,
      label: "arguedBy".freeze,
      subPropertyOf: "mp:supports".freeze,
      type: "owl:ObjectProperty".freeze
    property :argues,
      domain: "mp:Micropublication".freeze,
      label: "argues".freeze,
      :"owl:inverseOf" => %(mp:arguedBy).freeze,
      range: "mp:Claim".freeze,
      subPropertyOf: "mp:supportedBy".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :assertedBy,
      domain: "mp:Representation".freeze,
      label: "assertedBy".freeze,
      :"owl:inverseOf" => %(mp:asserts).freeze,
      :"owl:propertyDisjointWith" => %(mp:quotedBy).freeze,
      range: "mp:Micropublication".freeze,
      subPropertyOf: "mp:elementOf".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :asserts,
      domain: "mp:Micropublication".freeze,
      label: "asserts".freeze,
      :"owl:propertyDisjointWith" => %(mp:quotes).freeze,
      range: "mp:Representation".freeze,
      subPropertyOf: "mp:hasElement".freeze,
      type: ["owl:InverseFunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :atTime,
      domain: "mp:Attribution".freeze,
      label: "atTime".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: "owl:DatatypeProperty".freeze
    property :attributedTo,
      domain: "mp:Artifact".freeze,
      label: "attributedTo".freeze,
      range: "prov:Agent".freeze,
      subPropertyOf: ["owl:topObjectProperty".freeze, "prov:wasAttributedTo".freeze],
      type: "owl:ObjectProperty".freeze
    property :attributionAsAuthor,
      label: "attributionAsAuthor".freeze,
      subPropertyOf: "prov:hasAttribution".freeze,
      type: "owl:ObjectProperty".freeze
    property :attributionAsCurator,
      label: "attributionAsCurator".freeze,
      subPropertyOf: "prov:hasAttribution".freeze,
      type: "owl:ObjectProperty".freeze
    property :attributionAsEditor,
      label: "attributionAsEditor".freeze,
      subPropertyOf: "prov:hasAttribution".freeze,
      type: "owl:ObjectProperty".freeze
    property :attributionAsPublisher,
      label: "attributionAsPublisher".freeze,
      subPropertyOf: "prov:hasAttribution".freeze,
      type: "owl:ObjectProperty".freeze
    property :attributionOfAgent,
      domain: "mp:Attribution".freeze,
      label: "attributionOfAgent".freeze,
      range: "prov:Agent".freeze,
      subPropertyOf: "prov:agent".freeze,
      type: "owl:ObjectProperty".freeze
    property :authoredBy,
      label: "authoredBy".freeze,
      subPropertyOf: "mp:attributedTo".freeze,
      type: "owl:ObjectProperty".freeze
    property :authoredOn,
      domain: "mp:Artifact".freeze,
      label: "authoredOn".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: "owl:DatatypeProperty".freeze
    property :challengeGraphElementOf,
      domain: "mp:Micropublication".freeze,
      label: "challengeGraphElementOf".freeze,
      :"owl:inverseOf" => %(mp:hasChallengeGraphElement).freeze,
      range: "mp:Representation".freeze,
      type: "owl:ObjectProperty".freeze
    property :challengedBy,
      domain: "mp:Representation".freeze,
      label: "challengedBy".freeze,
      :"owl:inverseOf" => %(mp:challenges).freeze,
      range: "mp:Representation".freeze,
      type: "owl:ObjectProperty".freeze
    property :challenges,
      label: "challenges".freeze,
      type: "owl:ObjectProperty".freeze
    property :citation,
      domain: "mp:Reference".freeze,
      label: "citation".freeze,
      range: "xsd:string".freeze,
      subPropertyOf: ["http://dublincore.org/documents/2012/06/14/dcmi-terms/bibliographicCitation".freeze, "mp:value".freeze],
      type: "owl:DatatypeProperty".freeze
    property :curatedBy,
      label: "curatedBy".freeze,
      subPropertyOf: "mp:attributedTo".freeze,
      type: "owl:ObjectProperty".freeze
    property :curatedOn,
      label: "curatedOn".freeze,
      type: "owl:DatatypeProperty".freeze
    property :dataSupports,
      domain: "mp:Data".freeze,
      label: "dataSupports".freeze,
      :"owl:inverseOf" => %(mp:supportedByData).freeze,
      range: "mp:Representation".freeze,
      subPropertyOf: "mp:evidenceSupports".freeze,
      type: "owl:ObjectProperty".freeze
    property :directlyChallengedBy,
      label: "directlyChallengedBy".freeze,
      :"owl:inverseOf" => %(mp:directlyChallenges).freeze,
      subPropertyOf: "mp:challengedBy".freeze,
      type: "owl:ObjectProperty".freeze
    property :directlyChallenges,
      label: "directlyChallenges".freeze,
      subPropertyOf: "mp:challenges".freeze,
      type: "owl:ObjectProperty".freeze
    property :editedBy,
      label: "editedBy".freeze,
      subPropertyOf: "mp:attributedTo".freeze,
      type: "owl:ObjectProperty".freeze
    property :editedOn,
      label: "editedOn".freeze,
      type: "owl:DatatypeProperty".freeze
    property :elementOf,
      domain: "mp:Representation".freeze,
      label: "elementOf".freeze,
      range: "mp:Micropublication".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :evidenceSupports,
      label: "evidenceSupports".freeze,
      :"owl:inverseOf" => %(mp:supportedByEvidence).freeze,
      subPropertyOf: "mp:supports".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasAttribution,
      domain: "mp:Artifact".freeze,
      label: "hasAttribution".freeze,
      range: "mp:Attribution".freeze,
      subPropertyOf: ["mp:supportedBy".freeze, "prov:qualifiedAttribution".freeze],
      type: "owl:ObjectProperty".freeze
    property :hasChallengeGraphElement,
      domain: "mp:Micropublication".freeze,
      label: "hasChallengeGraphElement".freeze,
      range: "mp:Representation".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasElement,
      domain: "mp:Micropublication".freeze,
      label: "hasElement".freeze,
      range: "mp:Representation".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasHolotype,
      domain: "mp:Statement".freeze,
      label: "hasHolotype".freeze,
      :"owl:inverseOf" => %(mp:holotypeFor).freeze,
      range: "mp:Statement".freeze,
      subPropertyOf: "mp:representedBy".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasSupportGraphElement,
      domain: "mp:Micropublication".freeze,
      label: "hasSupportGraphElement".freeze,
      :"owl:inverseOf" => %(mp:supportGraphElementOf).freeze,
      range: "mp:Representation".freeze,
      type: "owl:ObjectProperty".freeze
    property :holotypeFor,
      label: "holotypeFor".freeze,
      subPropertyOf: "mp:represents".freeze,
      type: "owl:ObjectProperty".freeze
    property :indirectlyChallengedBy,
      label: "indirectlyChallengedBy".freeze,
      :"owl:inverseOf" => %(mp:indirectlyChallenges).freeze,
      subPropertyOf: "mp:challengedBy".freeze,
      type: "owl:ObjectProperty".freeze
    property :indirectlyChallenges,
      label: "indirectlyChallenges".freeze,
      subPropertyOf: "mp:challenges".freeze,
      type: "owl:ObjectProperty".freeze
    property :methodSupports,
      domain: "mp:Method".freeze,
      label: "methodSupports".freeze,
      :"owl:inverseOf" => %(mp:supportedByMethod).freeze,
      range: "mp:Representation".freeze,
      subPropertyOf: "mp:evidenceSupports".freeze,
      type: "owl:ObjectProperty".freeze
    property :publishedBy,
      label: "publishedBy".freeze,
      subPropertyOf: "mp:attributedTo".freeze,
      type: "owl:ObjectProperty".freeze
    property :publishedOn,
      domain: "mp:Attribution".freeze,
      label: "publishedOn".freeze,
      type: "owl:DatatypeProperty".freeze
    property :qualifiedBy,
      domain: "prov:Entity".freeze,
      label: "qualifiedBy".freeze,
      :"owl:inverseOf" => %(mp:qualifies).freeze,
      range: "mp:Sentence".freeze,
      type: "owl:ObjectProperty".freeze
    property :qualifies,
      label: "qualifies".freeze,
      range: "prov:Entity".freeze,
      type: "owl:ObjectProperty".freeze
    property :quotedBy,
      domain: "mp:Claim".freeze,
      label: "quotedBy".freeze,
      :"owl:inverseOf" => %(mp:quotes).freeze,
      range: "mp:Representation".freeze,
      subPropertyOf: "mp:elementOf".freeze,
      type: "owl:ObjectProperty".freeze
    property :quotes,
      label: "quotes".freeze,
      subPropertyOf: "mp:hasElement".freeze,
      type: "owl:ObjectProperty".freeze
    property :referencedBy,
      label: "referencedBy".freeze,
      range: "mp:Reference".freeze,
      subPropertyOf: "mp:qualifiedBy".freeze,
      type: "owl:ObjectProperty".freeze
    property :references,
      label: "references".freeze,
      :"owl:inverseOf" => %(mp:referencedBy).freeze,
      subPropertyOf: "mp:qualifies".freeze,
      type: "owl:ObjectProperty".freeze
    property :representedBy,
      label: "representedBy".freeze,
      :"owl:inverseOf" => %(mp:represents).freeze,
      type: "owl:ObjectProperty".freeze
    property :represents,
      domain: "mp:Representation".freeze,
      label: "represents".freeze,
      range: "prov:Entity".freeze,
      type: "owl:ObjectProperty".freeze
    property :semtaggedBy,
      label: "semtaggedBy".freeze,
      range: "mp:SemanticQualifier".freeze,
      subPropertyOf: "mp:qualifiedBy".freeze,
      type: "owl:ObjectProperty".freeze
    property :semtags,
      label: "semtags".freeze,
      :"owl:inverseOf" => %(mp:semtaggedBy).freeze,
      subPropertyOf: "mp:qualifies".freeze,
      type: "owl:ObjectProperty".freeze
    property :statement,
      domain: "mp:Sentence".freeze,
      label: "statement".freeze,
      range: "xsd:string".freeze,
      subPropertyOf: "mp:value".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :supportGraphElementOf,
      domain: "mp:Representation".freeze,
      label: "supportGraphElementOf".freeze,
      range: "mp:Micropublication".freeze,
      type: "owl:ObjectProperty".freeze
    property :supportedBy,
      domain: "mp:Representation".freeze,
      label: "supportedBy".freeze,
      :"owl:inverseOf" => %(mp:supports).freeze,
      range: "mp:Representation".freeze,
      type: ["owl:ObjectProperty".freeze, "owl:TransitiveProperty".freeze]
    property :supportedByData,
      label: "supportedByData".freeze,
      subPropertyOf: "mp:supportedByEvidence".freeze,
      type: "owl:ObjectProperty".freeze
    property :supportedByEvidence,
      label: "supportedByEvidence".freeze,
      subPropertyOf: "mp:supportedBy".freeze,
      type: ["owl:ObjectProperty".freeze, "owl:TransitiveProperty".freeze]
    property :supportedByMethod,
      label: "supportedByMethod".freeze,
      subPropertyOf: "mp:supportedByEvidence".freeze,
      type: "owl:ObjectProperty".freeze
    property :supports,
      label: "supports".freeze,
      type: ["owl:ObjectProperty".freeze, "owl:TransitiveProperty".freeze]
    property :value,
      label: "value".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]

    # Extra definitions
    term :"",
      comment: %(Micropublications: a Semantic Model for Claims, Evidence, Arguments and Annotations in Biomedical Communications.

Author:         	Tim Clark \(1,2,3\)
Contributors:   	Paolo Ciccarese \(1,2\), Carole Goble \(3\)

Version 1.17, May 12, 2016.

\(1\) Massachusetts General Hospital, Dept. of Neurology
\(2\) Harvard Medical School
\(3\) University of Manchester, School of Computer Science 

).freeze,
      label: "".freeze,
      :"owl:priorVersion" => %(1.17).freeze,
      :"owl:versionInfo" => %(1.18).freeze,
      type: "owl:Ontology".freeze
  end
end
