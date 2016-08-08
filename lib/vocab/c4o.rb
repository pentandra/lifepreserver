# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/spar/c4o/
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/spar/c4o/>
  #   class C4O < RDF::StrictVocabulary
  #   end
  class C4O < RDF::StrictVocabulary("http://purl.org/spar/c4o/")

    # Class definitions
    term :BibliographicInformationSource,
      comment: %(A source of information about bibliographic citations, such as Google Scholar, Web of Science or Scopus.).freeze,
      label: "bibliographic information source".freeze,
      :"owl:disjointWith" => [],
      type: "owl:Class".freeze
    term :GlobalCitationCount,
      comment: %(The number of times a work has been cited globally, as determined from a particular bibliographic information source on a particular date.).freeze,
      label: "global citation count".freeze,
      :"owl:disjointWith" => [],
      type: "owl:Class".freeze
    term :InTextReferencePointer,
      comment: %(The in-text reference pointer is a textual element, usually embedded at the end of a phrase or sentence within the text of a document, that denotes a specific bibliographic reference present in the reference list of that document. For example, if the item in the reference list is: 

4.  Ko AI, Reis MG, Ribeiro Dourado CM, Johnson WD Jr, Riley LW \(1999\). Urban epidemic of severe leptospirosis in Brazil. Salvador Leptospirosis Study Group. Lancet 354: 820-825.

the in-text reference pointer to this paper in a journal article may be manifested in a number of ways:	

Numerically, for example by using the numeral 4 in superscript or between square brackets, thus: [4].  Such numerical in-text 
reference pointers are frequently aggregated, e.g. [4, 5, 6-9].  In such cases, the missing pointers to references 7 and 8 are inferred \(and should be added explicitly to the XML mark-up at this point in the text!\). 

Or by use of the author names \(or the first author's name plus et al.\) and the publication year in parentheses, thus: \(Ko et al., 1999\). 

Or, less commonly, by the use of a code, e.g. by specifying the first surname letter of the first three author of the cited work followed by the last two digits of the year of publication, this string of characters being enclosed within square brackets, thus: [KRR99].).freeze,
      :"dc11:description" => [],
      label: "in-text reference pointer".freeze,
      subClassOf: "http://purl.org/vocab/frbr/core#Expression".freeze,
      type: "owl:Class".freeze
    term :InTextReferencePointerList,
      comment: %(A list containing only in-text reference pointers denoting the specific bibliographic references to which the list pertains.).freeze,
      :"dc11:description" => [],
      label: "in-text reference pointer list".freeze,
      subClassOf: "http://purl.org/co/List".freeze,
      type: "owl:Class".freeze
    term :InTextReferencePointerListItem,
      comment: %(This class describes all the list items that must be used in the context of an in-text reference pointer list.).freeze,
      :"dc11:description" => [],
      label: "in-text reference pointer list item".freeze,
      subClassOf: "http://purl.org/co/ListItem".freeze,
      type: "owl:Class".freeze
    term :SingleReferencePointerList,
      comment: %(An in-text reference pointer list that pertains to exactly one bibliographic reference.).freeze,
      :"dc11:description" => [],
      label: "single reference pointer list".freeze,
      subClassOf: "c4o:InTextReferencePointerList".freeze,
      type: "owl:Class".freeze

    # Property definitions
    property :denotes,
      comment: %(A property used to assert the connection between an in-text reference pointer and the bibliographic reference it points to.).freeze,
      domain: "c4o:InTextReferencePointer".freeze,
      label: "denotes".freeze,
      range: "http://purl.org/spar/biro/BibliographicReference".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasContent,
      comment: %(It is used to specify the textual content of a particular FRBR expression.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Expression".freeze,
      label: "has content".freeze,
      range: "rdfs:Literal".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasContext,
      comment: %(This property is used to indicate the textual context \(e.g. a sentence or a paragraph\) of a particular in-text reference pointer, this context providing the rhetorical motivation for the existence of that citation.).freeze,
      :"dc11:description" => [],
      domain: "c4o:InTextReferencePointer".freeze,
      label: "has context".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasGlobalCitationFrequency,
      comment: %(A property linking a publication entity to the property c40:GlobalCitationCount that specify how many times a work has been cited by others, according to a particular information source on a particular date.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has global citation frequency".freeze,
      range: "c4o:GlobalCitationCount".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasGlobalCountDate,
      comment: %(The date on which the global citation count of the cited entity was recorded from a named bibliographic information source.).freeze,
      domain: "c4o:GlobalCitationCount".freeze,
      label: "has global count date".freeze,
      range: "xsd:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasGlobalCountSource,
      comment: %(A property linking the property c40:GlobalCitationCount to the bibliographic information source providing the global citation count information for a particular publication on a particular date.).freeze,
      domain: "c4o:GlobalCitationCount".freeze,
      label: "has global count source".freeze,
      range: "c4o:BibliographicInformationSource".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasGlobalCountValue,
      comment: %(An integer defining the value of the global citation count of a cited entity recorded from a named bibliographic information source on a particular date.).freeze,
      domain: "c4o:GlobalCitationCount".freeze,
      label: "has global count value".freeze,
      range: "xsd:nonNegativeInteger".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasInTextCitationFrequency,
      comment: %(This property allows one to specify how many separate in-text reference pointers exist within the text of a citing document that all denote the same single bibliographic reference to a cited document \(i.e how many distinct textual contexts exist within the citing document from which a citation is made to a particular document\). ).freeze,
      domain: "http://purl.org/spar/biro/BibliographicReference".freeze,
      label: "has in text citation frequency".freeze,
      range: "xsd:nonNegativeInteger".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :isDenotedBy,
      comment: %(A property used to assert the connection between a bibliographic reference and the in-text reference pointer that points to it.).freeze,
      domain: "http://purl.org/spar/biro/BibliographicReference".freeze,
      label: "is denoted by".freeze,
      :"owl:inverseOf" => [],
      range: "c4o:InTextReferencePointer".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :isRelevantTo,
      comment: %(A property allowing one FRBR expression to be declared to be of rhetorical relevance to another, for instance that the textual context of a particular in-text reference pointer in one document is relevant to a section of text within the published document that is referenced by the bibliographic reference denoted by the in-text reference pointer, and vice versa that the converse relevance also exists.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Expression".freeze,
      label: "is relevant to".freeze,
      range: "http://purl.org/vocab/frbr/core#Expression".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: ["owl:ObjectProperty".freeze, "owl:SymmetricProperty".freeze]
    property :pertainsTo,
      comment: %(The property linking an in-text reference pointer list to the bibliographic reference or references denoted by the in-text reference pointers within that list.).freeze,
      domain: "c4o:InTextReferencePointerList".freeze,
      label: "pertains to".freeze,
      range: "http://purl.org/spar/biro/BibliographicReference".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
  end
end
