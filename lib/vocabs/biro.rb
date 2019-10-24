# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/spar/biro/
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/spar/biro/>
  #   class BIRO < RDF::StrictVocabulary
  #   end
  class BIRO < RDF::StrictVocabulary("http://purl.org/spar/biro/")

    # Ontology definition
    ontology :"http://purl.org/spar/biro/",
      comment: [%(The Bibliographic Reference Ontology \(BiRO\) is an ontology meant to define bibliographic records, bibliographic references, and their compilation into bibliographic collections and bibliographic lists, respectively.

**URL:** http://purl.org/spar/biro

**Creators**: [David Shotton]\(http://orcid.org/0000-0001-5506-523X\), [Silvio Peroni]\(http://orcid.org/0000-0003-0530-4305\)

**License:** [Creative Commons Attribution 4.0 International]\(https://creativecommons.org/licenses/by/4.0/legalcode\)

**Website:** http://www.sparontologies.net/ontologies/biro

**Cite as:** Di Iorio, A., Nuzzolese, A. G., Peroni, S., Shotton, D., Vitali, F. \(2014\). Describing bibliographic references in RDF. In Proceedings of 4th Workshop on Semantic Publishing \(SePublica 2014\). http://ceur-ws.org/Vol-1155/paper-05.pdf).freeze, %(This ontology is available at http://purl.org/spar/biro, and uses the namespace prefix biro.).freeze],
      "dc11:creator": ["David Shotton".freeze, "Silvio Peroni".freeze],
      "dc11:date": "2013-05-11".freeze,
      "dc11:description": ["BiRO, the Bibliographic Reference Ontology, is an ontology structured according to the FRBR model to define bibliographic records (as subclasses of frbr:Work) and bibliographic references (as subclasses of frbr:Expression), and their compilations into bibliographic collections such as library catalogues, and into bibliographic lists such as reference lists in journal articles, respectively.\n\nIt provides a logical system for relating an individual bibliographic reference, such as appears in the reference list of a published article (which may lack the title of the cited article, the full names of the listed authors, or indeed the full list of authors):\n- to the full bibliographic record for that cited article, which in addition to missing reference fields may also include the name of the publisher, and the ISSN or ISBN of the publication;\n- to collections of bibliographic records such as library catatlogues; and\n- to bibliographic lists, such as reference lists.".freeze, "biro:biro.png".freeze],
      "dc11:rights": "This work is distributed under a Creative Commons Attribution License (http://creativecommons.org/licenses/by/3.0/).".freeze,
      "dc11:title": "BiRO, the Bibliographic Reference Ontology".freeze,
      "owl:imports": ["http://purl.org/co".freeze, "http://purl.org/spar/frbr".freeze],
      "owl:priorVersion": "https://svn.code.sf.net/p/sempublishing/code/BiRO/2012-07-03-biro-1_1.owl".freeze,
      "owl:versionIRI": "biro:2013-05-11".freeze,
      "owl:versionInfo": "1.1.1".freeze,
      type: "owl:Ontology".freeze

    # Class definitions
    term :BibliographicCollection,
      comment: %(A collection of bibliographic records, each of which references a publication \(or a work in preparation for publication\). Examples of bibliographic collections include a collection of the bibliographic records of all the publications that a single individual has authored, or a collection of those bibliographic records to be included in a research paper, where they are expressed as a reference list.).freeze,
      "dc11:description": "A bibliographic collection is composed only of items containing bibliographic records.  Moreover, it cannot be part of other bibliographic collections, and it is realized only by bibliographic lists. ".freeze,
      label: "bibliographic collection".freeze,
      subClassOf: ["http://purl.org/co/Set".freeze, "http://purl.org/vocab/frbr/core#Work".freeze, term(
          allValuesFrom: "biro:BibliographicList".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#realization".freeze,
          type: "owl:Restriction".freeze
        ), term(
          allValuesFrom: "biro:BibliographicRecord".freeze,
          onProperty: "http://purl.org/co/element".freeze,
          type: "owl:Restriction".freeze
        ), term(
          allValuesFrom: term(
            "owl:complementOf": "biro:BibliographicCollection".freeze,
            type: "owl:Class".freeze
          ),
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :BibliographicList,
      comment: %(An ordered list of bibliographic items, each of which contains a bibliographic reference.).freeze,
      "dc11:description": "A bibliographic list is composed only of items containing bibliographic references.  Moreover, it is always a realization of a bibliographic collection.".freeze,
      label: "bibliographic list".freeze,
      subClassOf: ["http://purl.org/co/List".freeze, "http://purl.org/vocab/frbr/core#Expression".freeze, term(
          allValuesFrom: "biro:BibliographicCollection".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          type: "owl:Restriction".freeze
        ), term(
          allValuesFrom: "biro:BibliographicReference".freeze,
          onProperty: "http://purl.org/co/element".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :BibliographicRecord,
      comment: %(A record that uniquely describes a particular textual or data publication \(or a work in preparation for publication\). Each bibliographic record is a set of entities describing aspects of the referenced work, including, for example, but not restricted to: authors, title, journal, publication year, DOI, ISSN, publisher and copyright information, or, in the case of a data publication: creators, title, version, archive, publication year, DOI or other identifier\). The FRBR expression of a bibliographic record is a bibliographic reference, which usually contains only a sub-set of these entities, ordered in a particular way that corresponds to the house style of the publication in which it occurs.).freeze,
      "dc11:description": "A bibliographic record is realized only through bibliographic references.".freeze,
      label: "bibliographic record".freeze,
      subClassOf: ["http://purl.org/co/Set".freeze, "http://purl.org/vocab/frbr/core#Work".freeze, term(
          allValuesFrom: "biro:BibliographicReference".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#realization".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :BibliographicReference,
      comment: %(An expression of a bibliographic record in a specific format, that references a particular textual or data publication \(or a work in preparation for publication\). Each bibliographic reference is a list of items containing entities that describe aspects of the referenced work - for example authors, title, journal, publication year - selected from the bibliographic record.  Note that because different journal styles may require omission of elements of the bibliographic record in references included in a paper's reference list \(e.g. the title, the identifier, the names of the eighth and subsequent authors\), and because errors can be introduced when an author creates a bibliographic reference, the bibliographic reference to a published work may not be a complete or fully accurate expression of the information contained within the authoritative bibliographic record for that work.).freeze,
      "dc11:description": "A bibliographic reference is a realization of a bibliographic record. Moreover, it can contain only items referring to elements contained by the bibliographic record it realizes.".freeze,
      label: "bibliographic reference".freeze,
      subClassOf: ["http://purl.org/co/List".freeze, "http://purl.org/vocab/frbr/core#Expression".freeze, term(
          allValuesFrom: "biro:BibliographicRecord".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          type: "owl:Restriction".freeze
        ), term(
          allValuesFrom: term(
            allValuesFrom: "biro:BibliographicRecord".freeze,
            onProperty: "http://purl.org/co/elementOf".freeze,
            type: "owl:Restriction".freeze
          ),
          onProperty: "http://purl.org/co/element".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :LibraryCatalogue,
      comment: %(A catalogue of the bibliographic holdings of a library.).freeze,
      label: "library catalogue".freeze,
      subClassOf: "biro:BibliographicCollection".freeze,
      type: "owl:Class".freeze
    term :ReferenceList,
      comment: %(A list used to describe the bibliography of a research paper, a journal article, a book, a book chapter or similar publication.).freeze,
      label: "reference list".freeze,
      subClassOf: "biro:BibliographicList".freeze,
      type: "owl:Class".freeze

    # Property definitions
    property :isReferencedBy,
      comment: %(The relation between a publication and the bibliographic record or bibliographic reference describing it.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "is referenced by".freeze,
      range: term(
          type: "owl:Class".freeze,
          unionOf: list("biro:BibliographicRecord".freeze, "biro:BibliographicReference".freeze)
        ),
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :references,
      comment: %(The relation between a bibliographic record or a bibliographic reference and the publication being referenced.).freeze,
      domain: term(
          type: "owl:Class".freeze,
          unionOf: list("biro:BibliographicRecord".freeze, "biro:BibliographicReference".freeze)
        ),
      inverseOf: "biro:isReferencedBy".freeze,
      label: "references".freeze,
      range: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
  end
end
