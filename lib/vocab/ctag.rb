# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://commontag.org/ns#
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://commontag.org/ns#>
  #   class CTAG < RDF::StrictVocabulary
  #   end
  class CTAG < RDF::StrictVocabulary("http://commontag.org/ns#")

    # Class definitions
    term :AuthorTag,
      comment: %(A Tag asserted by the author of a content resource.).freeze,
      label: "Author Tag".freeze,
      subClassOf: "ctag:Tag".freeze,
      type: "rdfs:Class".freeze
    term :AutoTag,
      comment: %(A Tag asserted by an automated tool on a content resource.).freeze,
      label: "Auto Tag".freeze,
      subClassOf: "ctag:Tag".freeze,
      type: "rdfs:Class".freeze
    term :ReaderTag,
      comment: %(A Tag asserted by the reader \(consumer\) of a content resource.).freeze,
      label: "Reader Tag".freeze,
      subClassOf: "ctag:Tag".freeze,
      type: "rdfs:Class".freeze
    term :Tag,
      comment: %(A Common Tag associating a URI and a keyword to annotate a resource.).freeze,
      label: "Tag".freeze,
      type: "rdfs:Class".freeze
    term :TaggedContent,
      comment: %(Content which has one or more Common Tag.).freeze,
      label: "Tagged Content".freeze,
      type: "rdfs:Class".freeze

    # Property definitions
    property :isAbout,
      comment: %(A resource \(URI\) representing the concepts described by the content.).freeze,
      domain: "ctag:TaggedContent".freeze,
      label: "is about".freeze,
      type: "rdf:Property".freeze
    property :label,
      comment: %(A local, human-readable name for a Tag.).freeze,
      domain: "ctag:Tag".freeze,
      label: "tag label".freeze,
      subPropertyOf: "rdfs:label".freeze,
      type: "rdf:Property".freeze
    property :means,
      comment: %(A a resource \(URI\) representing the conceptual meaning of a Tag.).freeze,
      domain: "ctag:Tag".freeze,
      label: "means".freeze,
      type: "rdf:Property".freeze
    property :tagged,
      comment: %(Links a resource to a Common Tag.).freeze,
      domain: "ctag:TaggedContent".freeze,
      label: "tagged".freeze,
      range: "ctag:Tag".freeze,
      type: "rdf:Property".freeze
    property :taggingDate,
      comment: %(The date the Tag was assigned.).freeze,
      domain: "ctag:Tag".freeze,
      label: "tagging date".freeze,
      subPropertyOf: "dc:created".freeze,
      type: "rdf:Property".freeze

    # Extra definitions
    term :"",
      :"dc11:contributor" => [%(Alex Iskold).freeze, %(Alexandre Passant).freeze, %(Andraz Tori).freeze, %(Jamie Taylor).freeze, %(Peter Mika).freeze, %(Scott Montgomerie).freeze, %(Vuk Milicic).freeze],
      :"dc11:description" => %(Common Tag RDF vocabulary, described using W3C RDF Schema. Common Tags allows documents and document fragments \(any resource which can be identified by a URI\) to be labeled with keywords and URIs, unambigiously idenfying the concepts covered by the resource.).freeze,
      :"dc11:title" => %(Common Tag vocabulary).freeze,
      :"dc:issued" => %(2009-06-08).freeze,
      label: "Common Tag vocabulary".freeze,
      :"rdfs:seeAlso" => %(http://commontag.org/mappings).freeze,
      type: "owl:Ontology".freeze
  end
end
