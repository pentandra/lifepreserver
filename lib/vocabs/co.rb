# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/co/
require 'rdf'
module LifePreserver::Vocab
  CO = Class.new(RDF::StrictVocabulary("http://purl.org/co/")) do

    # Ontology definition
    ontology :"http://purl.org/co/",
      "http://purl.org/dc/elements/1.1/contributor": ["Marco Ocana".freeze, "Paolo Ciccarese".freeze, "Silvio Peroni".freeze],
      "http://purl.org/dc/elements/1.1/creator": "http://www.paolociccarese.info".freeze,
      "http://purl.org/dc/elements/1.1/date": "March 19, 2012".freeze,
      "http://purl.org/dc/elements/1.1/format": "application/rdf+xml".freeze,
      "http://purl.org/dc/elements/1.1/language": "en".freeze,
      "http://purl.org/dc/elements/1.1/title": "The Collections Ontology\n(CO)".freeze,
      "http://www.w3.org/2002/07/owl#imports": "http://www.essepuntato.it/2009/10/error".freeze,
      "http://www.w3.org/2002/07/owl#versionInfo": "2.0".freeze,
      type: "http://www.w3.org/2002/07/owl#Ontology".freeze

    # Class definitions
    term :Bag,
      comment: "Collection that can have a number of copies of each object".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/co/Set".freeze,
      label: "bag".freeze,
      subClassOf: "http://purl.org/co/Collection".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Collection,
      comment: "A group of objects that can be considered as a whole.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/co/Item".freeze,
      label: "collection".freeze,
      subClassOf: ["http://www.w3.org/2002/07/owl#Thing".freeze, term(
          allValuesFrom: "http://www.w3.org/2002/07/owl#Thing".freeze,
          onProperty: "http://purl.org/co/element".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          cardinality: "1".freeze,
          onProperty: "http://purl.org/co/size".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Item,
      comment: "Element belonging to a bag".freeze,
      label: "item".freeze,
      subClassOf: ["http://www.w3.org/2002/07/owl#Thing".freeze, term(
          onProperty: term(
            inverseOf: "http://purl.org/co/item".freeze
          ).freeze,
          someValuesFrom: "http://purl.org/co/Bag".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :List,
      comment: "An ordered array of items, that can be present in multiple copies".freeze,
      label: "list".freeze,
      subClassOf: [term(
          intersectionOf: list("http://purl.org/co/Bag".freeze, term(
            allValuesFrom: "http://purl.org/co/ListItem".freeze,
            onProperty: "http://purl.org/co/item".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ), term(
          maxCardinality: "1".freeze,
          onProperty: "http://purl.org/co/firstItem".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          maxCardinality: "1".freeze,
          onProperty: "http://purl.org/co/lastItem".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ListItem,
      comment: "element belonging to a list".freeze,
      label: "list item".freeze,
      subClassOf: ["http://purl.org/co/Item".freeze, term(
          cardinality: "1".freeze,
          onProperty: "http://purl.org/co/index".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Set,
      comment: "A collection that cannot contain duplicate elements.".freeze,
      label: "set".freeze,
      subClassOf: "http://purl.org/co/Collection".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze

    # Property definitions
    property :element,
      comment: "The link to the members of a collection".freeze,
      domain: "http://purl.org/co/Collection".freeze,
      "http://www.w3.org/2002/07/owl#propertyChainAxiom": list("http://purl.org/co/item".freeze, "http://purl.org/co/itemContent".freeze),
      label: "has element".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :elementOf,
      comment: "The link to a collection in which the object is member.".freeze,
      inverseOf: "http://purl.org/co/element".freeze,
      label: "is element of".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :firstItem,
      comment: "The link to the first item of the list.".freeze,
      domain: "http://purl.org/co/List".freeze,
      label: "has first item".freeze,
      range: term(
          intersectionOf: list("http://purl.org/co/ListItem".freeze, term(
            cardinality: "0".freeze,
            onProperty: "http://purl.org/co/previousItem".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          ), term(
            "http://www.w3.org/2002/07/owl#hasValue": "1".freeze,
            onProperty: "http://purl.org/co/index".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      subPropertyOf: "http://purl.org/co/item".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :firstItemOf,
      comment: "The link to a list in which the item is first item.".freeze,
      inverseOf: "http://purl.org/co/firstItem".freeze,
      label: "is first item of".freeze,
      subPropertyOf: "http://purl.org/co/itemOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :followedBy,
      comment: "The link to the following item in a list.".freeze,
      domain: "http://purl.org/co/ListItem".freeze,
      "http://purl.org/dc/elements/1.1/description": "Given the list (I[1], I[2], ... , I[i-1], I[i], I[i+1], ... , I[n-1], I[n]), the item I[i] is followed by I[i+1], ... , I[n-1] and I[n].".freeze,
      label: "is followed by".freeze,
      range: "http://purl.org/co/ListItem".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :index,
      comment: "A number identifying the position, starting from 1, of a particular list item within a list.".freeze,
      domain: "http://purl.org/co/ListItem".freeze,
      label: "has index".freeze,
      range: "http://www.w3.org/2001/XMLSchema#positiveInteger".freeze,
      type: "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze
    property :item,
      comment: "The link to every item of the bag".freeze,
      domain: "http://purl.org/co/Bag".freeze,
      "http://www.w3.org/2002/07/owl#propertyChainAxiom": list("http://purl.org/co/item".freeze, "http://purl.org/co/nextItem".freeze),
      label: "has item".freeze,
      range: "http://purl.org/co/Item".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :itemContent,
      comment: "The link to the actual resource to which the item refers.".freeze,
      domain: "http://purl.org/co/Item".freeze,
      label: "has item content".freeze,
      range: term(
          "http://www.w3.org/2002/07/owl#complementOf": "http://purl.org/co/Item".freeze,
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :itemContentOf,
      comment: "The link to the item that refers to the resource.".freeze,
      inverseOf: "http://purl.org/co/itemContent".freeze,
      label: "is item content of".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :itemOf,
      comment: "The link to a bag in which the item is member.".freeze,
      inverseOf: "http://purl.org/co/item".freeze,
      label: "is item of".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :lastItem,
      comment: "The link to the last item of the list.".freeze,
      domain: "http://purl.org/co/List".freeze,
      label: "has last item".freeze,
      range: term(
          intersectionOf: list("http://purl.org/co/ListItem".freeze, term(
            cardinality: "0".freeze,
            onProperty: "http://purl.org/co/nextItem".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      subPropertyOf: "http://purl.org/co/item".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :lastItemOf,
      comment: "The link to a list in which the item is last item.".freeze,
      inverseOf: "http://purl.org/co/lastItem".freeze,
      label: "is last item of".freeze,
      subPropertyOf: "http://purl.org/co/itemOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :nextItem,
      comment: "The link to the next item in a list.".freeze,
      "http://purl.org/dc/elements/1.1/description": "Given the list (I[1], I[2], ... , I[i-1], I[i], I[i+1], ... , I[n-1], I[n]), the next item of I[i] is I[i+1].".freeze,
      label: "has next item".freeze,
      subPropertyOf: "http://purl.org/co/followedBy".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :precededBy,
      comment: "The link to the preceding item in a list.".freeze,
      "http://purl.org/dc/elements/1.1/description": "Given the list (I[1], I[2], ... , I[i-1], I[i], I[i+1], ... , I[n-1], I[n]), the item I[i] is preceded by I[i-1], ... , I[2] and I[1].".freeze,
      inverseOf: "http://purl.org/co/followedBy".freeze,
      label: "is preceded by".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :previousItem,
      comment: "The link to the previous item in a list.".freeze,
      "http://purl.org/dc/elements/1.1/description": "Given the list (I[1], I[2], ... , I[i-1], I[i], I[i+1], ... , I[n-1], I[n]), the previous item of I[i] is I[i-1].".freeze,
      inverseOf: "http://purl.org/co/nextItem".freeze,
      label: "has previous item".freeze,
      subPropertyOf: "http://purl.org/co/precededBy".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :size,
      comment: "The number of item belonging to a collection.".freeze,
      domain: "http://purl.org/co/Collection".freeze,
      "http://purl.org/dc/elements/1.1/description": "CO defines the size of a collection as the sum of the number of times entities that are part of the collection appear in it. This means that co:size considers how much each entity is involved by a particular collection, i.e.:\n- the size of the set {a, b, c} is three\n- the size of the bag [a, a, b, b, b, c] is five\n- the size of the list (a, b, c, b, a, b, c, c) is seven".freeze,
      label: "has size".freeze,
      range: "http://www.w3.org/2001/XMLSchema#nonNegativeInteger".freeze,
      type: "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze
  end
end
