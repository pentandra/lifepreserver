# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://commontag.org/ns#
require 'rdf'
module LifePreserver::Vocab
  CTAG = Class.new(RDF::StrictVocabulary("http://commontag.org/ns#")) do

    # Ontology definition
    ontology :"http://commontag.org/ns#",
      "http://purl.org/dc/elements/1.1/contributor": ["Alex Iskold".freeze, "Alexandre Passant".freeze, "Andraz Tori".freeze, "Jamie Taylor".freeze, "Peter Mika".freeze, "Scott Montgomerie".freeze, "Vuk Milicic".freeze],
      "http://purl.org/dc/elements/1.1/description": "Common Tag RDF vocabulary, described using W3C RDF Schema. Common Tags allows documents and document fragments (any resource which can be identified by a URI) to be labeled with keywords and URIs, unambigiously idenfying the concepts covered by the resource.".freeze,
      "http://purl.org/dc/elements/1.1/title": "Common Tag vocabulary".freeze,
      "http://purl.org/dc/terms/issued": "2009-06-08".freeze,
      "http://www.w3.org/2000/01/rdf-schema#seeAlso": "http://commontag.org/mappings".freeze,
      label: "Common Tag vocabulary".freeze,
      type: "http://www.w3.org/2002/07/owl#Ontology".freeze

    # Class definitions
    term :AuthorTag,
      comment: "A Tag asserted by the author of a content resource.".freeze,
      label: "Author Tag".freeze,
      subClassOf: "http://commontag.org/ns#Tag".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze
    term :AutoTag,
      comment: "A Tag asserted by an automated tool on a content resource.".freeze,
      label: "Auto Tag".freeze,
      subClassOf: "http://commontag.org/ns#Tag".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze
    term :ReaderTag,
      comment: "A Tag asserted by the reader (consumer) of a content resource.".freeze,
      label: "Reader Tag".freeze,
      subClassOf: "http://commontag.org/ns#Tag".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze
    term :Tag,
      comment: "A Common Tag associating a URI and a keyword to annotate a resource.".freeze,
      label: "Tag".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze
    term :TaggedContent,
      comment: "Content which has one or more Common Tag.".freeze,
      label: "Tagged Content".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze

    # Property definitions
    property :isAbout,
      comment: "A resource (URI) representing the concepts described by the content.".freeze,
      domain: "http://commontag.org/ns#TaggedContent".freeze,
      label: "is about".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :label,
      comment: "A local, human-readable name for a Tag.".freeze,
      domain: "http://commontag.org/ns#Tag".freeze,
      label: "tag label".freeze,
      subPropertyOf: "http://www.w3.org/2000/01/rdf-schema#label".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :means,
      comment: "A a resource (URI) representing the conceptual meaning of a Tag.".freeze,
      domain: "http://commontag.org/ns#Tag".freeze,
      label: "means".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :tagged,
      comment: "Links a resource to a Common Tag.".freeze,
      domain: "http://commontag.org/ns#TaggedContent".freeze,
      label: "tagged".freeze,
      range: "http://commontag.org/ns#Tag".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :taggingDate,
      comment: "The date the Tag was assigned.".freeze,
      domain: "http://commontag.org/ns#Tag".freeze,
      label: "tagging date".freeze,
      subPropertyOf: "http://purl.org/dc/terms/created".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
  end
end
