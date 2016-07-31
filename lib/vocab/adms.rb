# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://www.w3.org/ns/adms#
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://www.w3.org/ns/adms#>
  #   class ADMS < RDF::StrictVocabulary
  #   end
  class ADMS < RDF::StrictVocabulary("http://www.w3.org/ns/adms#")

    # Class definitions
    term :Asset,
      comment: %(An Asset is an abstract entity that reflects the intellectual content of the asset and represents those characteristics of the asset that are independent of its physical embodiment. This abstract entity combines the FRBR entities work \(a distinct intellectual or artistic creation\) and expression \(the intellectual or artistic realization of a work\). Assets can be versioned. Every time the intellectual content of an asset changes, the result is considered to be a new asset that can be linked to previous and next versions of the Asset. The physical embodiment of an Asset is called an Asset Distribution. A particular Asset may have zero or more Asset Distributions..).freeze,
      :"dc:identifier" => [],
      label: "Asset".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "dcat:Dataset".freeze,
      type: "rdfs:Class".freeze
    term :AssetDistribution,
      comment: %(An Asset Distribution represents a particular physical embodiment of an Asset, which is an example of the FRBR entity manifestation \(the physical embodiment of an expression of a work\). An Asset Distribution is typically a downloadable computer file \(but in principle it could also be a paper document\) that implements the intellectual content of an Asset. A particular Asset Distribution is associated with one and only one Asset, while all Distributions of an Asset share the same intellectual content in different physical formats. Asset Distributions themselves are not versioned.).freeze,
      :"dc:identifier" => [],
      label: "Asset Distribution".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "dcat:Distribution".freeze,
      type: "rdfs:Class".freeze
    term :AssetRepository,
      comment: %(An Asset Repository is a system or service that provides facilities for storage and maintenance of descriptions of Assets and Asset Distributions, and functionality that allows users to search and access these descriptions. An Asset Repository will typically contain descriptions of several Assets and related Asset Distributions.).freeze,
      :"dc:identifier" => [],
      label: "Asset Repository".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "dcat:Catalog".freeze,
      type: "rdfs:Class".freeze
    term :Identifier,
      comment: %(This class is based on the UN/CEFACT Identifier complex type defined in See Section 5.8 of Core Components Data Type Catalogue Version 3.1 \(http://www.unece.org/fileadmin/DAM/cefact/codesfortrade/CCTS/CCTS-DTCatalogueVersion3p1.pdf\) In RDF this is expressed using the following properties: - the content string should be provided using skos:notation, datatyped with the identifier scheme \(inclduing the version number if appropriate\); - use dcterms:creator to link to a class describing the agency that manages the identifier scheme or adms:schemaAgency to provide the name as a literal. Although not part of the ADMS conceptual model, it may be useful to provide further properties to the Identifier class such as dcterms:created to provide the date on which the identifier was issued.).freeze,
      :"dc:identifier" => [],
      label: "Identifier".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdfs:Class".freeze

    # Property definitions
    property :identifier,
      comment: %(adms:identifier is used to link any resource to an instance of adms:Identifier which is its range. N.B. it is not appropriate to use dcterms:identifer to link to the Identifier class as its range is rdfs:Literal. ADMS uses this to provide any identifier for the Asset.).freeze,
      :"dc:identifier" => [],
      label: "identifier".freeze,
      range: "adms:Identifier".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :includedAsset,
      comment: %(Links to an Asset that is contained in the Asset being described, e.g. when there are several vocabularies defined in a single document.).freeze,
      :"dc:identifier" => [],
      domain: "adms:Asset".freeze,
      label: "included asset".freeze,
      range: "adms:Asset".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :interoperabilityLevel,
      comment: %(Links an Asset to its adms:InteroperabilityLevel. Since this is encoded using skos:Concept, that is the defined range for this property.).freeze,
      :"dc:identifier" => [],
      domain: "adms:Asset".freeze,
      label: "interoperability level".freeze,
      range: "skos:Concept".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :last,
      comment: %(A link to the current or latest version of the Asset.).freeze,
      :"dc:identifier" => [],
      label: "last".freeze,
      :"rdfs:isDefinedBy" => [],
      subPropertyOf: "xhv:last".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :next,
      comment: %(A link to the next version of the Asset.).freeze,
      :"dc:identifier" => [],
      label: "next".freeze,
      :"rdfs:isDefinedBy" => [],
      subPropertyOf: "xhv:next".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :prev,
      comment: %(A link to the previous version of the Asset.).freeze,
      :"dc:identifier" => [],
      label: "prev".freeze,
      :"rdfs:isDefinedBy" => [],
      subPropertyOf: "xhv:prev".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :representationTechnique,
      comment: %(Links an adms:AssetDistribution to a skos:Concept that is its adms:RepresentationTechnique.).freeze,
      :"dc:identifier" => [],
      label: "representation technique".freeze,
      range: "skos:Concept".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :sample,
      comment: %(Links to a sample of an Asset \(which is itself an Asset\).).freeze,
      :"dc:identifier" => [],
      domain: "adms:Asset".freeze,
      label: "sample".freeze,
      range: "adms:Asset".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :schemeAgency,
      comment: %(The name of the agency responsible for issuing the identifier).freeze,
      :"dc:identifier" => [],
      domain: "adms:Identifier".freeze,
      label: "scheme agency".freeze,
      range: "rdfs:Literal".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:DatatypeProperty".freeze, "rdf:Property".freeze]
    property :status,
      comment: %(Links to the status of the Asset or Asset Distribution in the context of a particular workflow process. Since Status is defined using a skos:Concept, that is the defined range for this property.).freeze,
      :"dc:identifier" => [],
      label: "status".freeze,
      range: "skos:Concept".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :supportedSchema,
      comment: %(A schema according to which the Asset Repository can provide data about its content, e.g. ADMS).freeze,
      :"dc:identifier" => [],
      label: "supported schema".freeze,
      range: "adms:Asset".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :translation,
      comment: %(Links Assets that are translations of each other.).freeze,
      :"dc:identifier" => [],
      label: "translation".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :versionNotes,
      comment: %(A description of changes between this version and the previous version of the Asset.).freeze,
      :"dc:identifier" => [],
      label: "version info".freeze,
      range: "rdfs:Literal".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:DatatypeProperty".freeze, "rdf:Property".freeze]
  end
end
