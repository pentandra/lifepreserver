# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://www.w3.org/ns/adms#
require 'rdf'
module LifePreserver::Vocab
  ADMS = Class.new(RDF::StrictVocabulary("http://www.w3.org/ns/adms#")) do

    # Ontology definition
    ontology :"http://www.w3.org/ns/adms#",
      comment: "This file specifies the set of RDF classes and properties used in ADMS".freeze,
      "http://purl.org/dc/terms/abstract": "ADMS is a profile of DCAT, used to describe semantic assets (or just 'Assets'), defined as highly reusable metadata (e.g. xml schemata, generic data models) and reference data (e.g. code lists, taxonomies, dictionaries, vocabularies) that are used for eGovernment system development.".freeze,
      "http://purl.org/dc/terms/creator": [term(
          "http://schema.org/affiliation": "http://www.w3.org/data#W3C".freeze,
          "http://www.w3.org/2000/01/rdf-schema#seeAlso": "http://philarcher.org/foaf.rdf#me".freeze,
          "http://xmlns.com/foaf/0.1/homepage": "http://www.w3.org/People/all#phila".freeze,
          "http://xmlns.com/foaf/0.1/name": "Phil Archer".freeze
        ), term(
          "http://schema.org/affiliation": term(
            "http://xmlns.com/foaf/0.1/homepage": "http://ies.jrc.ec.europa.eu/DE".freeze,
            "http://xmlns.com/foaf/0.1/name": "European Commission, Joint Research Centre ".freeze
          ).freeze,
          "http://www.w3.org/2000/01/rdf-schema#seeAlso": "http://andrea-perego.name/foaf/#me".freeze,
          "http://xmlns.com/foaf/0.1/homepage": "http://andrea-perego.name/".freeze,
          "http://xmlns.com/foaf/0.1/name": "Andrea Perego".freeze
        ), term(
          "http://www.w3.org/2000/01/rdf-schema#seeAlso": "http://makxdekkers.com/makxdekkers.rdf#me".freeze,
          "http://xmlns.com/foaf/0.1/homepage": "http://makxdekkers.com/".freeze,
          "http://xmlns.com/foaf/0.1/name": "Makx Dekkers".freeze
        )],
      "http://purl.org/dc/terms/description": "This is the RDF encoding of the Asset Description Metadata Schema, originally \n    developed under the European Union's ISA Programme and further developed by the W3C Government Linked Data Working Group.\n    It re-uses terms from several other vocabularies, notably Dublin Core, with elements of SKOS, FOAF and more. ".freeze,
      "http://purl.org/dc/terms/modified": ["2013-05-24".freeze, "2013-09-16".freeze, "2013-12-21".freeze, "2015-07-22".freeze],
      "http://purl.org/dc/terms/title": "Asset Description Metadata Schema (ADMS)".freeze,
      "http://purl.org/vocab/vann/preferredNamespacePrefix": "adms".freeze,
      "http://purl.org/vocab/vann/preferredNamespaceUri": "http://www.w3.org/ns/adms#".freeze,
      "http://purl.org/vocommons/voaf#specializes": "http://www.w3.org/ns/dcat#".freeze,
      "http://www.w3.org/2007/05/powder-s#describedby": "http://www.w3.org/TR/vocab-adms".freeze,
      "http://xmlns.com/foaf/0.1/maker": term(
          "http://xmlns.com/foaf/0.1/homepage": "http://www.w3.org/2011/gld/".freeze,
          "http://xmlns.com/foaf/0.1/name": "Government Linked Data WG, based on output from the ADMS Working Group".freeze
        ),
      label: "Asset Description Metadata Schema (ADMS)".freeze,
      type: ["http://purl.org/vocommons/voaf#Vocabulary".freeze, "http://www.w3.org/2002/07/owl#Ontology".freeze]

    # Class definitions
    term :Asset,
      comment: "An Asset is an abstract entity that reflects the intellectual content of the asset and represents those characteristics of the asset that are independent of its physical embodiment. This abstract entity combines the FRBR entities work (a distinct intellectual or artistic creation) and expression (the intellectual or artistic realization of a work). Assets can be versioned. Every time the intellectual content of an asset changes, the result is considered to be a new asset that can be linked to previous and next versions of the Asset. The physical embodiment of an Asset is called an Asset Distribution. A particular Asset may have zero or more Asset Distributions..".freeze,
      "http://purl.org/dc/terms/identifier": "adms:Asset".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "Asset".freeze,
      subClassOf: "http://www.w3.org/ns/dcat#Dataset".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze
    term :AssetDistribution,
      comment: "An Asset Distribution represents a particular physical embodiment of an Asset, which is an example of the FRBR entity manifestation (the physical embodiment of an expression of a work). An Asset Distribution is typically a downloadable computer file (but in principle it could also be a paper document) that implements the intellectual content of an Asset. A particular Asset Distribution is associated with one and only one Asset, while all Distributions of an Asset share the same intellectual content in different physical formats. Asset Distributions themselves are not versioned.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:AssetDistribution".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "Asset Distribution".freeze,
      subClassOf: "http://www.w3.org/ns/dcat#Distribution".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze
    term :AssetRepository,
      comment: "An Asset Repository is a system or service that provides facilities for storage and maintenance of descriptions of Assets and Asset Distributions, and functionality that allows users to search and access these descriptions. An Asset Repository will typically contain descriptions of several Assets and related Asset Distributions.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:AssetRepository".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "Asset Repository".freeze,
      subClassOf: "http://www.w3.org/ns/dcat#Catalog".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze
    term :Identifier,
      comment: "This class is based on the UN/CEFACT Identifier complex type defined in See Section 5.8 of Core Components Data Type Catalogue Version 3.1 (http://www.unece.org/fileadmin/DAM/cefact/codesfortrade/CCTS/CCTS-DTCatalogueVersion3p1.pdf) In RDF this is expressed using the following properties: - the content string should be provided using skos:notation, datatyped with the identifier scheme (inclduing the version number if appropriate); - use dcterms:creator to link to a class describing the agency that manages the identifier scheme or adms:schemaAgency to provide the name as a literal. Although not part of the ADMS conceptual model, it may be useful to provide further properties to the Identifier class such as dcterms:created to provide the date on which the identifier was issued.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:Identifier".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "Identifier".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze

    # Property definitions
    property :identifier,
      comment: "adms:identifier is used to link any resource to an instance of adms:Identifier which is its range. N.B. it is not appropriate to use dcterms:identifer to link to the Identifier class as its range is rdfs:Literal. ADMS uses this to provide any identifier for the Asset.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:identifier".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "identifier".freeze,
      range: "http://www.w3.org/ns/adms#Identifier".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :includedAsset,
      comment: "Links to an Asset that is contained in the Asset being described, e.g. when there are several vocabularies defined in a single document.".freeze,
      domain: "http://www.w3.org/ns/adms#Asset".freeze,
      "http://purl.org/dc/terms/identifier": "adms:includedAsset".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "included asset".freeze,
      range: "http://www.w3.org/ns/adms#Asset".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :interoperabilityLevel,
      comment: "Links an Asset to its adms:InteroperabilityLevel. Since this is encoded using skos:Concept, that is the defined range for this property.".freeze,
      domain: "http://www.w3.org/ns/adms#Asset".freeze,
      "http://purl.org/dc/terms/identifier": "adms:interoperabilityLevel".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "interoperability level".freeze,
      range: "http://www.w3.org/2004/02/skos/core#Concept".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :last,
      comment: "A link to the current or latest version of the Asset.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:last".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "last".freeze,
      subPropertyOf: "http://www.w3.org/1999/xhtml/vocab#last".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :next,
      comment: "A link to the next version of the Asset.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:next".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "next".freeze,
      subPropertyOf: "http://www.w3.org/1999/xhtml/vocab#next".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :prev,
      comment: "A link to the previous version of the Asset.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:prev".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "prev".freeze,
      subPropertyOf: "http://www.w3.org/1999/xhtml/vocab#prev".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :representationTechnique,
      comment: "Links an adms:AssetDistribution to a skos:Concept that is its adms:RepresentationTechnique.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:representationTechnique".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "representation technique".freeze,
      range: "http://www.w3.org/2004/02/skos/core#Concept".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :sample,
      comment: "Links to a sample of an Asset (which is itself an Asset).".freeze,
      domain: "http://www.w3.org/ns/adms#Asset".freeze,
      "http://purl.org/dc/terms/identifier": "adms:sample".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "sample".freeze,
      range: "http://www.w3.org/ns/adms#Asset".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :schemeAgency,
      comment: "The name of the agency responsible for issuing the identifier".freeze,
      domain: "http://www.w3.org/ns/adms#Identifier".freeze,
      "http://purl.org/dc/terms/identifier": "adms:schemeAgency".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "scheme agency".freeze,
      range: "http://www.w3.org/2000/01/rdf-schema#Literal".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze]
    property :status,
      comment: "Links to the status of the Asset or Asset Distribution in the context of a particular workflow process. Since Status is defined using a skos:Concept, that is the defined range for this property.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:status".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "status".freeze,
      range: "http://www.w3.org/2004/02/skos/core#Concept".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :supportedSchema,
      comment: "A schema according to which the Asset Repository can provide data about its content, e.g. ADMS".freeze,
      "http://purl.org/dc/terms/identifier": "adms:supportedSchema".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "supported schema".freeze,
      range: "http://www.w3.org/ns/adms#Asset".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :translation,
      comment: "Links Assets that are translations of each other.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:translation".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "translation".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :versionNotes,
      comment: "A description of changes between this version and the previous version of the Asset.".freeze,
      "http://purl.org/dc/terms/identifier": "adms:versionNotes".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-adms".freeze,
      label: "version info".freeze,
      range: "http://www.w3.org/2000/01/rdf-schema#Literal".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze]
  end
end
