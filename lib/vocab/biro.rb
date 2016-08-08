# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/spar/biro
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/spar/biro>
  #   class BIRO < RDF::StrictVocabulary
  #   end
  class BIRO < RDF::StrictVocabulary("http://purl.org/spar/biro")

    # Class definitions
    term :"/BibliographicCollection",
      comment: %(A collection of bibliographic records, each of which references a publication \(or a work in preparation for publication\). Examples of bibliographic collections include a collection of the bibliographic records of all the publications that a single individual has authored, or a collection of those bibliographic records to be included in a research paper, where they are expressed as a reference list.).freeze,
      :"dc11:description" => [],
      label: "bibliographic collection".freeze,
      subClassOf: ["http://purl.org/co/Set".freeze, "http://purl.org/vocab/frbr/core#Work".freeze],
      type: "owl:Class".freeze
    term :"/BibliographicList",
      comment: %(An ordered list of bibliographic items, each of which contains a bibliographic reference.).freeze,
      :"dc11:description" => [],
      label: "bibliographic list".freeze,
      subClassOf: ["http://purl.org/co/List".freeze, "http://purl.org/vocab/frbr/core#Expression".freeze],
      type: "owl:Class".freeze
    term :"/BibliographicRecord",
      comment: %(A record that uniquely describes a particular textual or data publication \(or a work in preparation for publication\). Each bibliographic record is a set of entities describing aspects of the referenced work, including, for example, but not restricted to: authors, title, journal, publication year, DOI, ISSN, publisher and copyright information, or, in the case of a data publication: creators, title, version, archive, publication year, DOI or other identifier\). The FRBR expression of a bibliographic record is a bibliographic reference, which usually contains only a sub-set of these entities, ordered in a particular way that corresponds to the house style of the publication in which it occurs.).freeze,
      :"dc11:description" => [],
      label: "bibliographic record".freeze,
      subClassOf: ["http://purl.org/co/Set".freeze, "http://purl.org/vocab/frbr/core#Work".freeze],
      type: "owl:Class".freeze
    term :"/BibliographicReference",
      comment: %(An expression of a bibliographic record in a specific format, that references a particular textual or data publication \(or a work in preparation for publication\). Each bibliographic reference is a list of items containing entities that describe aspects of the referenced work - for example authors, title, journal, publication year - selected from the bibliographic record.  Note that because different journal styles may require omission of elements of the bibliographic record in references included in a paper's reference list \(e.g. the title, the identifier, the names of the eighth and subsequent authors\), and because errors can be introduced when an author creates a bibliographic reference, the bibliographic reference to a published work may not be a complete or fully accurate expression of the information contained within the authoritative bibliographic record for that work.).freeze,
      :"dc11:description" => [],
      label: "bibliographic reference".freeze,
      subClassOf: ["http://purl.org/co/List".freeze, "http://purl.org/vocab/frbr/core#Expression".freeze],
      type: "owl:Class".freeze
    term :"/LibraryCatalogue",
      comment: %(A catalogue of the bibliographic holdings of a library.).freeze,
      label: "library catalogue".freeze,
      subClassOf: "http://purl.org/spar/biro/BibliographicCollection".freeze,
      type: "owl:Class".freeze
    term :"/ReferenceList",
      comment: %(A list used to describe the bibliography of a research paper, a journal article, a book, a book chapter or similar publication.).freeze,
      label: "reference list".freeze,
      subClassOf: "http://purl.org/spar/biro/BibliographicList".freeze,
      type: "owl:Class".freeze

    # Property definitions
    property :"/isReferencedBy",
      comment: %(The relation between a publication and the bibliographic record or bibliographic reference describing it.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "is referenced by".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :"/references",
      comment: %(The relation between a bibliographic record or a bibliographic reference and the publication being referenced.).freeze,
      label: "references".freeze,
      :"owl:inverseOf" => [],
      range: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze

    # Extra definitions
    term :"",
      comment: [%(BiRO, the Bibliographic Reference Ontology is an ontology for describing bibliographic records and references, and their compilation into bibliographic collections and reference lists. It forms part of SPAR, a suite of Semantic Publishing and Referencing Ontologies.  Other SPAR ontologies are described at http://purl.org/spar/.).freeze, %(This ontology is available at http://purl.org/spar/biro, and uses the namespace prefix biro.).freeze],
      :"dc11:creator" => [],
      :"dc11:date" => [],
      :"dc11:description" => [],
      :"dc11:rights" => [],
      :"dc11:title" => [],
      label: "".freeze,
      :"owl:imports" => [],
      :"owl:versionInfo" => [],
      type: "owl:Ontology".freeze
  end
end
