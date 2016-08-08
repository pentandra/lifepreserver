# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/co/
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/co/>
  #   class CO < RDF::StrictVocabulary
  #   end
  class CO < RDF::StrictVocabulary("http://purl.org/co/")

    # Class definitions
    term :Bag,
      comment: %(Collection that can have a number of copies of each object).freeze,
      label: "bag".freeze,
      :"owl:disjointWith" => [],
      subClassOf: "co:Collection".freeze,
      type: "owl:Class".freeze
    term :Collection,
      comment: %(A group of objects that can be considered as a whole.).freeze,
      label: "collection".freeze,
      :"owl:disjointWith" => [],
      subClassOf: "owl:Thing".freeze,
      type: "owl:Class".freeze
    term :Item,
      comment: %(Element belonging to a bag).freeze,
      label: "item".freeze,
      subClassOf: "owl:Thing".freeze,
      type: "owl:Class".freeze
    term :List,
      comment: %(An ordered array of items, that can be present in multiple copies).freeze,
      label: "list".freeze,
      type: "owl:Class".freeze
    term :ListItem,
      comment: %(element belonging to a list).freeze,
      label: "list item".freeze,
      subClassOf: "co:Item".freeze,
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
      type: "owl:ObjectProperty".freeze
    property :elementOf,
      comment: %(The link to a collection in which the object is member.).freeze,
      label: "is element of".freeze,
      :"owl:inverseOf" => [],
      type: "owl:ObjectProperty".freeze
    property :firstItem,
      comment: %(The link to the first item of the list.).freeze,
      domain: "co:List".freeze,
      label: "has first item".freeze,
      subPropertyOf: "co:item".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :firstItemOf,
      comment: %(The link to a list in which the item is first item.).freeze,
      label: "is first item of".freeze,
      :"owl:inverseOf" => [],
      subPropertyOf: "co:itemOf".freeze,
      type: "owl:ObjectProperty".freeze
    property :followedBy,
      comment: %(The link to the following item in a list.).freeze,
      :"dc11:description" => [],
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
      range: "co:Item".freeze,
      type: "owl:ObjectProperty".freeze
    property :itemContent,
      comment: %(The link to the actual resource to which the item refers.).freeze,
      domain: "co:Item".freeze,
      label: "has item content".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :itemContentOf,
      comment: %(The link to the item that refers to the resource.).freeze,
      label: "is item content of".freeze,
      :"owl:inverseOf" => [],
      type: "owl:ObjectProperty".freeze
    property :itemOf,
      comment: %(The link to a bag in which the item is member.).freeze,
      label: "is item of".freeze,
      :"owl:inverseOf" => [],
      type: "owl:ObjectProperty".freeze
    property :lastItem,
      comment: %(The link to the last item of the list.).freeze,
      domain: "co:List".freeze,
      label: "has last item".freeze,
      subPropertyOf: "co:item".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :lastItemOf,
      comment: %(The link to a list in which the item is last item.).freeze,
      label: "is last item of".freeze,
      :"owl:inverseOf" => [],
      subPropertyOf: "co:itemOf".freeze,
      type: "owl:ObjectProperty".freeze
    property :nextItem,
      comment: %(The link to the next item in a list.).freeze,
      :"dc11:description" => [],
      label: "has next item".freeze,
      subPropertyOf: "co:followedBy".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :precededBy,
      comment: %(The link to the preceding item in a list.).freeze,
      :"dc11:description" => [],
      label: "is preceded by".freeze,
      :"owl:inverseOf" => [],
      type: ["owl:ObjectProperty".freeze, "owl:TransitiveProperty".freeze]
    property :previousItem,
      comment: %(The link to the previous item in a list.).freeze,
      :"dc11:description" => [],
      label: "has previous item".freeze,
      :"owl:inverseOf" => [],
      subPropertyOf: "co:precededBy".freeze,
      type: ["owl:FunctionalProperty".freeze, "owl:ObjectProperty".freeze]
    property :size,
      comment: %(The number of item belonging to a collection.).freeze,
      :"dc11:description" => [],
      domain: "co:Collection".freeze,
      label: "has size".freeze,
      range: "xsd:nonNegativeInteger".freeze,
      type: "owl:DatatypeProperty".freeze
  end
end
