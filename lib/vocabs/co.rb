# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/co/
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/co/>
  #   class CO < RDF::StrictVocabulary
  #   end
  class CO < RDF::StrictVocabulary("http://purl.org/co/")

    # Ontology definition
    ontology :"http://purl.org/co/",
      "dc11:contributor": ["Marco Ocana".freeze, "Paolo Ciccarese".freeze, "Silvio Peroni".freeze],
      "dc11:creator": "http://www.paolociccarese.info".freeze,
      "dc11:date": "March 19, 2012".freeze,
      "dc11:format": "application/rdf+xml".freeze,
      "dc11:language": "en".freeze,
      "dc11:title": "The Collections Ontology\n(CO)".freeze,
      "owl:imports": "http://www.essepuntato.it/2009/10/error".freeze,
      "owl:versionInfo": "2.0".freeze,
      type: "owl:Ontology".freeze

    # Class definitions
    term :Bag,
      comment: %(Collection that can have a number of copies of each object).freeze,
      label: "bag".freeze,
      "owl:disjointWith": "co:Set".freeze,
      subClassOf: "co:Collection".freeze,
      type: "owl:Class".freeze
    term :Collection,
      comment: %(A group of objects that can be considered as a whole.).freeze,
      label: "collection".freeze,
      "owl:disjointWith": "co:Item".freeze,
      subClassOf: ["owl:Thing".freeze, term(
          allValuesFrom: "owl:Thing".freeze,
          onProperty: "co:element".freeze,
          type: "owl:Restriction".freeze
        ), term(
          cardinality: "1".freeze,
          onProperty: "co:size".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Item,
      comment: %(Element belonging to a bag).freeze,
      label: "item".freeze,
      subClassOf: ["owl:Thing".freeze, term(
          onProperty: term(
            inverseOf: "co:item".freeze
          ),
          someValuesFrom: "co:Bag".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :List,
      comment: %(An ordered array of items, that can be present in multiple copies).freeze,
      label: "list".freeze,
      subClassOf: [term(
          intersectionOf: list("co:Bag".freeze, term(
            allValuesFrom: "co:ListItem".freeze,
            onProperty: "co:item".freeze,
            type: "owl:Restriction".freeze
          )),
          type: "owl:Class".freeze
        ), term(
          maxCardinality: "1".freeze,
          onProperty: "co:firstItem".freeze,
          type: "owl:Restriction".freeze
        ), term(
          maxCardinality: "1".freeze,
          onProperty: "co:lastItem".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :ListItem,
      comment: %(element belonging to a list).freeze,
      label: "list item".freeze,
      subClassOf: ["co:Item".freeze, term(
          cardinality: "1".freeze,
          onProperty: "co:index".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Set,
      comment: %(A collection that cannot contain duplicate elements.).freeze,
      label: "set".freeze,
      subClassOf: "co:Collection".freeze,
      type: "owl:Class".freeze

    # Property definitions
    property :element,
      comment: %(The link to the members of a collection).freeze,
      domain: "co:Collection".freeze,
      label: "has element".freeze,
      "owl:propertyChainAxiom": list("co:item".freeze, "co:itemContent".freeze),
      type: "owl:ObjectProperty".freeze
    property :elementOf,
      comment: %(The link to a collection in which the object is member.).freeze,
      inverseOf: "co:element".freeze,
      label: "is element of".freeze,
      type: "owl:ObjectProperty".freeze
    property :firstItem,
      comment: %(The link to the first item of the list.).freeze,
      domain: "co:List".freeze,
      label: "has first item".freeze,
      range: term(
          intersectionOf: list("co:ListItem".freeze, term(
            cardinality: "0".freeze,
            onProperty: "co:previousItem".freeze,
            type: "owl:Restriction".freeze
          ), term(
            onProperty: "co:index".freeze,
            "owl:hasValue": "1".freeze,
            type: "owl:Restriction".freeze
          )),
          type: "owl:Class".freeze
        ),
      subPropertyOf: "co:item".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :firstItemOf,
      comment: %(The link to a list in which the item is first item.).freeze,
      inverseOf: "co:firstItem".freeze,
      label: "is first item of".freeze,
      subPropertyOf: "co:itemOf".freeze,
      type: "owl:ObjectProperty".freeze
    property :followedBy,
      comment: %(The link to the following item in a list.).freeze,
      "dc11:description": "Given the list (I[1], I[2], ... , I[i-1], I[i], I[i+1], ... , I[n-1], I[n]), the item I[i] is followed by I[i+1], ... , I[n-1] and I[n].".freeze,
      domain: "co:ListItem".freeze,
      label: "is followed by".freeze,
      range: "co:ListItem".freeze,
      type: ["owl:ObjectProperty".freeze, "owl:TransitiveProperty".freeze]
    property :index,
      comment: %(A number identifying the position, starting from 1, of a particular list item within a list.).freeze,
      domain: "co:ListItem".freeze,
      label: "has index".freeze,
      range: "xsd:positiveInteger".freeze,
      type: "owl:DatatypeProperty".freeze
    property :item,
      comment: %(The link to every item of the bag).freeze,
      domain: "co:Bag".freeze,
      label: "has item".freeze,
      "owl:propertyChainAxiom": list("co:item".freeze, "co:nextItem".freeze),
      range: "co:Item".freeze,
      type: "owl:ObjectProperty".freeze
    property :itemContent,
      comment: %(The link to the actual resource to which the item refers.).freeze,
      domain: "co:Item".freeze,
      label: "has item content".freeze,
      range: term(
          "owl:complementOf": "co:Item".freeze,
          type: "owl:Class".freeze
        ),
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :itemContentOf,
      comment: %(The link to the item that refers to the resource.).freeze,
      inverseOf: "co:itemContent".freeze,
      label: "is item content of".freeze,
      type: "owl:ObjectProperty".freeze
    property :itemOf,
      comment: %(The link to a bag in which the item is member.).freeze,
      inverseOf: "co:item".freeze,
      label: "is item of".freeze,
      type: "owl:ObjectProperty".freeze
    property :lastItem,
      comment: %(The link to the last item of the list.).freeze,
      domain: "co:List".freeze,
      label: "has last item".freeze,
      range: term(
          intersectionOf: list("co:ListItem".freeze, term(
            cardinality: "0".freeze,
            onProperty: "co:nextItem".freeze,
            type: "owl:Restriction".freeze
          )),
          type: "owl:Class".freeze
        ),
      subPropertyOf: "co:item".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :lastItemOf,
      comment: %(The link to a list in which the item is last item.).freeze,
      inverseOf: "co:lastItem".freeze,
      label: "is last item of".freeze,
      subPropertyOf: "co:itemOf".freeze,
      type: "owl:ObjectProperty".freeze
    property :nextItem,
      comment: %(The link to the next item in a list.).freeze,
      "dc11:description": "Given the list (I[1], I[2], ... , I[i-1], I[i], I[i+1], ... , I[n-1], I[n]), the next item of I[i] is I[i+1].".freeze,
      label: "has next item".freeze,
      subPropertyOf: "co:followedBy".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :precededBy,
      comment: %(The link to the preceding item in a list.).freeze,
      "dc11:description": "Given the list (I[1], I[2], ... , I[i-1], I[i], I[i+1], ... , I[n-1], I[n]), the item I[i] is preceded by I[i-1], ... , I[2] and I[1].".freeze,
      inverseOf: "co:followedBy".freeze,
      label: "is preceded by".freeze,
      type: ["owl:ObjectProperty".freeze, "owl:TransitiveProperty".freeze]
    property :previousItem,
      comment: %(The link to the previous item in a list.).freeze,
      "dc11:description": "Given the list (I[1], I[2], ... , I[i-1], I[i], I[i+1], ... , I[n-1], I[n]), the previous item of I[i] is I[i-1].".freeze,
      inverseOf: "co:nextItem".freeze,
      label: "has previous item".freeze,
      subPropertyOf: "co:precededBy".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :size,
      comment: %(The number of item belonging to a collection.).freeze,
      "dc11:description": "CO defines the size of a collection as the sum of the number of times entities that are part of the collection appear in it. This means that co:size considers how much each entity is involved by a particular collection, i.e.:\n- the size of the set {a, b, c} is three\n- the size of the bag [a, a, b, b, b, c] is five\n- the size of the list (a, b, c, b, a, b, c, c) is seven".freeze,
      domain: "co:Collection".freeze,
      label: "has size".freeze,
      range: "xsd:nonNegativeInteger".freeze,
      type: "owl:DatatypeProperty".freeze
  end
end
