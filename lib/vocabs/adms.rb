# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://www.w3.org/ns/adms#
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://www.w3.org/ns/adms#>
  #   class ADMS < RDF::StrictVocabulary
  #   end
  class ADMS < RDF::StrictVocabulary("http://www.w3.org/ns/adms#")

    # Ontology definition
    ontology :"http://www.w3.org/ns/adms#",
      comment: %(This file specifies the set of RDF classes and properties used in ADMS).freeze,
      "dc:abstract": "ADMS is a profile of DCAT, used to describe semantic assets (or just 'Assets'), defined as highly reusable metadata (e.g. xml schemata, generic data models) and reference data (e.g. code lists, taxonomies, dictionaries, vocabularies) that are used for eGovernment system development.".freeze,
      "dc:creator": [term(
          "foaf:homepage": "http://andrea-perego.name/".freeze,
          "foaf:name": "Andrea Perego".freeze,
          "rdfs:seeAlso": "http://andrea-perego.name/foaf/#me".freeze,
          "schema:affiliation": term(
            "foaf:homepage": "http://ies.jrc.ec.europa.eu/DE".freeze,
            "foaf:name": "European Commission, Joint Research Centre ".freeze
          )
        ), term(
          "foaf:homepage": "http://makxdekkers.com/".freeze,
          "foaf:name": "Makx Dekkers".freeze,
          "rdfs:seeAlso": "http://makxdekkers.com/makxdekkers.rdf#me".freeze
        ), term(
          "foaf:homepage": "http://www.w3.org/People/all#phila".freeze,
          "foaf:name": "Phil Archer".freeze,
          "rdfs:seeAlso": "http://philarcher.org/foaf.rdf#me".freeze,
          "schema:affiliation": "http://www.w3.org/data#W3C".freeze
        )],
      "dc:description": "This is the RDF encoding of the Asset Description Metadata Schema, originally \n    developed under the European Union's ISA Programme and further developed by the W3C Government Linked Data Working Group.\n    It re-uses terms from several other vocabularies, notably Dublin Core, with elements of SKOS, FOAF and more. ".freeze,
      "dc:modified": ["2013-05-24".freeze, "2013-09-16".freeze, "2013-12-21".freeze, "2015-07-22".freeze],
      "dc:title": "Asset Description Metadata Schema (ADMS)".freeze,
      "foaf:maker": term(
          "foaf:homepage": "http://www.w3.org/2011/gld/".freeze,
          "foaf:name": "Government Linked Data WG, based on output from the ADMS Working Group".freeze
        ),
      "http://purl.org/vocab/vann/preferredNamespacePrefix": "adms".freeze,
      "http://purl.org/vocab/vann/preferredNamespaceUri": "http://www.w3.org/ns/adms#".freeze,
      "http://purl.org/vocommons/voaf#specializes": "dcat:".freeze,
      label: "Asset Description Metadata Schema (ADMS)".freeze,
      type: ["http://purl.org/vocommons/voaf#Vocabulary".freeze, "owl:Ontology".freeze],
      "wdrs:describedby": "http://www.w3.org/TR/vocab-adms".freeze

    # Class definitions
    term :Asset,
      comment: %(An Asset is an abstract entity that reflects the intellectual content of the asset and represents those characteristics of the asset that are independent of its physical embodiment. This abstract entity combines the FRBR entities work \(a distinct intellectual or artistic creation\) and expression \(the intellectual or artistic realization of a work\). Assets can be versioned. Every time the intellectual content of an asset changes, the result is considered to be a new asset that can be linked to previous and next versions of the Asset. The physical embodiment of an Asset is called an Asset Distribution. A particular Asset may have zero or more Asset Distributions..).freeze,
      "dc:identifier": "adms:Asset".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "Asset".freeze,
      subClassOf: "dcat:Dataset".freeze,
      type: "rdfs:Class".freeze
    term :AssetDistribution,
      comment: %(An Asset Distribution represents a particular physical embodiment of an Asset, which is an example of the FRBR entity manifestation \(the physical embodiment of an expression of a work\). An Asset Distribution is typically a downloadable computer file \(but in principle it could also be a paper document\) that implements the intellectual content of an Asset. A particular Asset Distribution is associated with one and only one Asset, while all Distributions of an Asset share the same intellectual content in different physical formats. Asset Distributions themselves are not versioned.).freeze,
      "dc:identifier": "adms:AssetDistribution".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "Asset Distribution".freeze,
      subClassOf: "dcat:Distribution".freeze,
      type: "rdfs:Class".freeze
    term :AssetRepository,
      comment: %(An Asset Repository is a system or service that provides facilities for storage and maintenance of descriptions of Assets and Asset Distributions, and functionality that allows users to search and access these descriptions. An Asset Repository will typically contain descriptions of several Assets and related Asset Distributions.).freeze,
      "dc:identifier": "adms:AssetRepository".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "Asset Repository".freeze,
      subClassOf: "dcat:Catalog".freeze,
      type: "rdfs:Class".freeze
    term :Identifier,
      comment: %(This class is based on the UN/CEFACT Identifier complex type defined in See Section 5.8 of Core Components Data Type Catalogue Version 3.1 \(http://www.unece.org/fileadmin/DAM/cefact/codesfortrade/CCTS/CCTS-DTCatalogueVersion3p1.pdf\) In RDF this is expressed using the following properties: - the content string should be provided using skos:notation, datatyped with the identifier scheme \(inclduing the version number if appropriate\); - use dcterms:creator to link to a class describing the agency that manages the identifier scheme or adms:schemaAgency to provide the name as a literal. Although not part of the ADMS conceptual model, it may be useful to provide further properties to the Identifier class such as dcterms:created to provide the date on which the identifier was issued.).freeze,
      "dc:identifier": "adms:Identifier".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "Identifier".freeze,
      type: "rdfs:Class".freeze

    # Property definitions
    property :identifier,
      comment: %(adms:identifier is used to link any resource to an instance of adms:Identifier which is its range. N.B. it is not appropriate to use dcterms:identifer to link to the Identifier class as its range is rdfs:Literal. ADMS uses this to provide any identifier for the Asset.).freeze,
      "dc:identifier": "adms:identifier".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "identifier".freeze,
      range: "adms:Identifier".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :includedAsset,
      comment: %(Links to an Asset that is contained in the Asset being described, e.g. when there are several vocabularies defined in a single document.).freeze,
      "dc:identifier": "adms:includedAsset".freeze,
      domain: "adms:Asset".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "included asset".freeze,
      range: "adms:Asset".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :interoperabilityLevel,
      comment: %(Links an Asset to its adms:InteroperabilityLevel. Since this is encoded using skos:Concept, that is the defined range for this property.).freeze,
      "dc:identifier": "adms:interoperabilityLevel".freeze,
      domain: "adms:Asset".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "interoperability level".freeze,
      range: "skos:Concept".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :last,
      comment: %(A link to the current or latest version of the Asset.).freeze,
      "dc:identifier": "adms:last".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "last".freeze,
      subPropertyOf: "xhv:last".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :next,
      comment: %(A link to the next version of the Asset.).freeze,
      "dc:identifier": "adms:next".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "next".freeze,
      subPropertyOf: "xhv:next".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :prev,
      comment: %(A link to the previous version of the Asset.).freeze,
      "dc:identifier": "adms:prev".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "prev".freeze,
      subPropertyOf: "xhv:prev".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :representationTechnique,
      comment: %(Links an adms:AssetDistribution to a skos:Concept that is its adms:RepresentationTechnique.).freeze,
      "dc:identifier": "adms:representationTechnique".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "representation technique".freeze,
      range: "skos:Concept".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :sample,
      comment: %(Links to a sample of an Asset \(which is itself an Asset\).).freeze,
      "dc:identifier": "adms:sample".freeze,
      domain: "adms:Asset".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "sample".freeze,
      range: "adms:Asset".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :schemeAgency,
      comment: %(The name of the agency responsible for issuing the identifier).freeze,
      "dc:identifier": "adms:schemeAgency".freeze,
      domain: "adms:Identifier".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "scheme agency".freeze,
      range: "rdfs:Literal".freeze,
      type: ["owl:DatatypeProperty".freeze, "rdf:Property".freeze]
    property :status,
      comment: %(Links to the status of the Asset or Asset Distribution in the context of a particular workflow process. Since Status is defined using a skos:Concept, that is the defined range for this property.).freeze,
      "dc:identifier": "adms:status".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "status".freeze,
      range: "skos:Concept".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :supportedSchema,
      comment: %(A schema according to which the Asset Repository can provide data about its content, e.g. ADMS).freeze,
      "dc:identifier": "adms:supportedSchema".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "supported schema".freeze,
      range: "adms:Asset".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :translation,
      comment: %(Links Assets that are translations of each other.).freeze,
      "dc:identifier": "adms:translation".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "translation".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :versionNotes,
      comment: %(A description of changes between this version and the previous version of the Asset.).freeze,
      "dc:identifier": "adms:versionNotes".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "version info".freeze,
      range: "rdfs:Literal".freeze,
      type: ["owl:DatatypeProperty".freeze, "rdf:Property".freeze]
  end
end
