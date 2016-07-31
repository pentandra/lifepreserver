# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://vocab.data.gov/def/fea#
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://vocab.data.gov/def/fea#>
  #   class FEA < RDF::StrictVocabulary
  #   end
  class FEA < RDF::StrictVocabulary("http://vocab.data.gov/def/fea#")

    # Class definitions
    term :Agency,
      comment: %(An agency of the US government).freeze,
      label: "Agency".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: ["fea:GovernmentBody".freeze, "fea:ValuePoint".freeze],
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Board,
      comment: %(US government board).freeze,
      label: "Board".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:GovernmentBody".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Budget,
      label: "Budget".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_EnterpriseConcept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Citizen,
      comment: %(Citizen of the United States of Americe).freeze,
      label: "Citizen".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:Party".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :CivilServant,
      comment: %(An employee of the US Government).freeze,
      label: "Civil Servant".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:Party".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Commission,
      comment: %(Us government commission).freeze,
      label: "Commission".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:GovernmentBody".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Company,
      comment: %(A commercial organization).freeze,
      label: "Company".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:IndustryBody".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Council,
      comment: %(US Government council).freeze,
      label: "Council".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:GovernmentBody".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Customer,
      comment: %(The diverse nature of federal programs means that there are many customers spanning the citizen, business, other government, and internal categories.  Some customers
receive direct government services, such as veterans receiving health care from the Veterans Health Administration. Other â€œcustomersâ€ are those subject to regulatory activities, such as large businesses conforming to safety regulations administered by the Occupational Safety and Health Administration. Importantly, the citizen is generally considered to be the ultimate â€œcustomerâ€ of government activities regardless of the nature of the customer relationship.
PRM volume 1, p.14).freeze,
      label: "Customer".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:ValuePoint".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :ExecutiveAgency,
      comment: %(Executive Agency of the US government).freeze,
      label: "Executive Agency".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:Agency".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :FEA_ArchitectureConcept,
      label: "FEA Architecture Concept".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_Concept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :FEA_Concept,
      label: "FEA Concept".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :FEA_EnterpriseConcept,
      label: "FEA Enterprise Concept".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_Concept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :FEA_Model,
      comment: %(1, the FEA is being constructed through a collection of interrelated
â€œreference modelsâ€ designed to facilitate cross-agency analysis and the identification of duplicative investments, gaps, and opportunities for collaboration within and across Federal Agencies.).freeze,
      label: "FEA Model".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_ArchitectureConcept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :FEA_TechnologyConcept,
      label: "FEA Technology Concept".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_Concept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :FederalEnterpriseArchitecture,
      comment: %(To facilitate efforts to transform the Federal Government to one that is citizen-centered, results-oriented, and market-based, the Office of Management and Budget \(OMB\) is developing the Federal Enterprise Architecture \(FEA\), a business-based framework for Governmentwide improvement.).freeze,
      label: "Federal Enterprise Architecture".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_ArchitectureConcept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :GovernmentBody,
      comment: %(Any US government organization).freeze,
      label: "Government Body".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:OrganizationEntity".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :HumanResource,
      comment: %(This class refers to the workforce).freeze,
      label: "Human Resource".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:Resource".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :IT_Initiative,
      comment: %(A program of work that implements information technology based capabilities.).freeze,
      label: "IT Initiative".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_EnterpriseConcept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :IndependentAgency,
      comment: %(Independent Agency of the US government).freeze,
      label: "Independent Agency".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:Agency".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :IndustryBody,
      comment: %(Any non government organization).freeze,
      label: "Industry Body".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:OrganizationEntity".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Mission,
      comment: %(Missions are carried out by the organizational entities).freeze,
      label: "Mission".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_EnterpriseConcept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Office,
      comment: %(US government office).freeze,
      label: "Office".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:GovernmentBody".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :OrganizationEntity,
      label: "Organization Entity".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:Party".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :OtherFixedAsset,
      comment: %(This class includes any fixed assets such as vehicle fleets, facilities and other equipment.).freeze,
      label: "Other Fixed Asset".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:Resource".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Partition,
      comment: %(Each reference model has an extensional  property based on partitioning. This reveals implicit semantics in each reference model.
).freeze,
      label: "Partition".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_ArchitectureConcept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Party,
      label: "Party".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: ["fea:Customer".freeze, "fea:FEA_EnterpriseConcept".freeze],
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Process,
      comment: %(The BRM includes a Mode of Delivery Business Area that is designed to identify at a very high level the process that is being used to achieve an intended purpose.
PRM volume 1, p.16).freeze,
      label: "Process".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:ValuePoint".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :QuasiOfficialAgency,
      comment: %(Quasi Official Agency of the US government).freeze,
      label: "Quasi Official Agency".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:Agency".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Resource,
      label: "Resource".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:ValuePoint".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Standard,
      comment: %(Technology standard).freeze,
      label: "Standard".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_TechnologyConcept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :StrategicOutcome,
      comment: %(Strategic Outcomes represent broad, policy priorities that drive the direction of government \(such as to Secure the Homeland or Expand E-Government\).
PRM volume 1, p.13).freeze,
      label: "Strategic Outcome".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:ValuePoint".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :Technology,
      comment: %(Technology means Information Technology).freeze,
      label: "Technology".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: ["fea:FEA_TechnologyConcept".freeze, "fea:ValuePoint".freeze],
      type: ["owl:Class".freeze, "rdfs:Class".freeze]
    term :ValuePoint,
      comment: %(The point at which value is measured.).freeze,
      label: "ValuePoint".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "fea:FEA_EnterpriseConcept".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]

    # Property definitions
    property :allignedWith,
      label: "allignedWith".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :buildsOn,
      domain: "fea:Partition".freeze,
      label: "buildsOn".freeze,
      range: "fea:Partition".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :comprises,
      label: "comprises".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :date,
      label: "date".freeze,
      range: "xsd:date".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze, "rdf:Property".freeze]
    property :dependsOn,
      domain: "fea:Partition".freeze,
      label: "dependsOn".freeze,
      range: "fea:Partition".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :description,
      domain: "fea:FEA_Concept".freeze,
      label: "description".freeze,
      range: "xsd:string".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze, "rdf:Property".freeze]
    property :drawsUpon,
      domain: "fea:FEA_Model".freeze,
      label: "drawsUpon".freeze,
      range: "fea:FEA_Model".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :hasIntent,
      domain: "fea:OrganizationEntity".freeze,
      label: "hasIntent".freeze,
      range: "fea:Mission".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:FunctionalProperty".freeze, "rdf:Property".freeze]
    property :intentOf,
      domain: "fea:Mission".freeze,
      label: "intentOf".freeze,
      range: "fea:OrganizationEntity".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:InverseFunctionalProperty".freeze, "rdf:Property".freeze]
    property :isComprisedOf,
      label: "isComprisedOf".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :isPartOf,
      comment: %(used to describe part of relationships, such as, for example, the fact that one organization is part of another \(departmental hierarchy\).).freeze,
      label: "is part of".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :mnemonic,
      domain: "fea:FEA_Concept".freeze,
      label: "mnemonic".freeze,
      range: "xsd:string".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:DatatypeProperty".freeze, "rdf:Property".freeze]
    property :supportedBy,
      label: "supportedBy".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :undertakenBy,
      domain: "fea:IT_Initiative".freeze,
      label: "undertakenBy".freeze,
      range: "fea:Agency".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze
    property :undertakes,
      domain: "fea:Agency".freeze,
      label: "undertakes".freeze,
      range: "fea:IT_Initiative".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "rdf:Property".freeze

    # Extra definitions
    term :"",
      :"dc11:modified" => [],
      :"dc11:title" => [],
      :"foaf:page" => [],
      :"http://purl.org/vocab/vann/preferredNamespacePrefix" => [],
      :"http://purl.org/vocab/vann/preferredNamespaceUri" => [],
      label: "".freeze,
      type: "owl:Ontology".freeze
  end
end
