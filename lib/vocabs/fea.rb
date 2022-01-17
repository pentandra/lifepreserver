# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://vocab.data.gov/def/fea#
require 'rdf'
module LifePreserver::Vocab
  FEA = Class.new(RDF::StrictVocabulary("http://vocab.data.gov/def/fea#")) do

    # Ontology definition
    ontology :"http://vocab.data.gov/def/fea#",
      "http://purl.org/dc/elements/1.1/modified": "2015-06-26".freeze,
      "http://purl.org/dc/elements/1.1/title": "FEA Vocabulary".freeze,
      "http://purl.org/vocab/vann/preferredNamespacePrefix": "fea".freeze,
      "http://purl.org/vocab/vann/preferredNamespaceUri": "http://vocab.data.gov/def/fea#".freeze,
      "http://xmlns.com/foaf/0.1/page": "http://vocab.data.gov/def/fea.html".freeze,
      type: "http://www.w3.org/2002/07/owl#Ontology".freeze

    # Class definitions
    term :Agency,
      comment: "An agency of the US government".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Agency".freeze,
      subClassOf: ["http://vocab.data.gov/def/fea#GovernmentBody".freeze, "http://vocab.data.gov/def/fea#ValuePoint".freeze],
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Board,
      comment: "US government board".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Board".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#GovernmentBody".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Budget,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Budget".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_EnterpriseConcept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Citizen,
      comment: "Citizen of the United States of Americe".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Citizen".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#Party".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :CivilServant,
      comment: "An employee of the US Government".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Civil Servant".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#Party".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Commission,
      comment: "Us government commission".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Commission".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#GovernmentBody".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Company,
      comment: "A commercial organization".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Company".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#IndustryBody".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Council,
      comment: "US Government council".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Council".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#GovernmentBody".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Customer,
      comment: "The diverse nature of federal programs means that there are many customers spanning the citizen, business, other government, and internal categories.  Some customers\nreceive direct government services, such as veterans receiving health care from the Veterans Health Administration. Other â€œcustomersâ€\u009D are those subject to regulatory activities, such as large businesses conforming to safety regulations administered by the Occupational Safety and Health Administration. Importantly, the citizen is generally considered to be the ultimate â€œcustomerâ€\u009D of government activities regardless of the nature of the customer relationship.\nPRM volume 1, p.14".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Customer".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#ValuePoint".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :ExecutiveAgency,
      comment: "Executive Agency of the US government".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Executive Agency".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#Agency".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :FEA_ArchitectureConcept,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "FEA Architecture Concept".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_Concept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :FEA_Concept,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "FEA Concept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :FEA_EnterpriseConcept,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "FEA Enterprise Concept".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_Concept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :FEA_Model,
      comment: "1, the FEA is being constructed through a collection of interrelated\nâ€œreference modelsâ€\u009D designed to facilitate cross-agency analysis and the identification of duplicative investments, gaps, and opportunities for collaboration within and across Federal Agencies.".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "FEA Model".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_ArchitectureConcept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :FEA_TechnologyConcept,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "FEA Technology Concept".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_Concept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :FederalEnterpriseArchitecture,
      comment: "To facilitate efforts to transform the Federal Government to one that is citizen-centered, results-oriented, and market-based, the Office of Management and Budget (OMB) is developing the Federal Enterprise Architecture (FEA), a business-based framework for Governmentwide improvement.".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Federal Enterprise Architecture".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_ArchitectureConcept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :GovernmentBody,
      comment: "Any US government organization".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Government Body".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#OrganizationEntity".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :HumanResource,
      comment: "This class refers to the workforce".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Human Resource".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#Resource".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :IT_Initiative,
      comment: "A program of work that implements information technology based capabilities.".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "IT Initiative".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_EnterpriseConcept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :IndependentAgency,
      comment: "Independent Agency of the US government".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Independent Agency".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#Agency".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :IndustryBody,
      comment: "Any non government organization".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Industry Body".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#OrganizationEntity".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Mission,
      comment: "Missions are carried out by the organizational entities".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Mission".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_EnterpriseConcept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Office,
      comment: "US government office".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Office".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#GovernmentBody".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :OrganizationEntity,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Organization Entity".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#Party".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :OtherFixedAsset,
      comment: "This class includes any fixed assets such as vehicle fleets, facilities and other equipment.".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Other Fixed Asset".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#Resource".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Partition,
      comment: "Each reference model has an extensional  property based on partitioning. This reveals implicit semantics in each reference model.\n".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Partition".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_ArchitectureConcept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Party,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Party".freeze,
      subClassOf: ["http://vocab.data.gov/def/fea#Customer".freeze, "http://vocab.data.gov/def/fea#FEA_EnterpriseConcept".freeze],
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Process,
      comment: "The BRM includes a Mode of Delivery Business Area that is designed to identify at a very high level the process that is being used to achieve an intended purpose.\nPRM volume 1, p.16".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Process".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#ValuePoint".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :QuasiOfficialAgency,
      comment: "Quasi Official Agency of the US government".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Quasi Official Agency".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#Agency".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Resource,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Resource".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#ValuePoint".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Standard,
      comment: "Technology standard".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Standard".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_TechnologyConcept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :StrategicOutcome,
      comment: "Strategic Outcomes represent broad, policy priorities that drive the direction of government (such as to Secure the Homeland or Expand E-Government).\nPRM volume 1, p.13".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Strategic Outcome".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#ValuePoint".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :Technology,
      comment: "Technology means Information Technology".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "Technology".freeze,
      subClassOf: ["http://vocab.data.gov/def/fea#FEA_TechnologyConcept".freeze, "http://vocab.data.gov/def/fea#ValuePoint".freeze],
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]
    term :ValuePoint,
      comment: "The point at which value is measured.".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "ValuePoint".freeze,
      subClassOf: "http://vocab.data.gov/def/fea#FEA_EnterpriseConcept".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]

    # Property definitions
    property :allignedWith,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "allignedWith".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :buildsOn,
      domain: "http://vocab.data.gov/def/fea#Partition".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "buildsOn".freeze,
      range: "http://vocab.data.gov/def/fea#Partition".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :comprises,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "comprises".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :date,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "date".freeze,
      range: "http://www.w3.org/2001/XMLSchema#date".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze, "http://www.w3.org/2002/07/owl#FunctionalProperty".freeze]
    property :dependsOn,
      domain: "http://vocab.data.gov/def/fea#Partition".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "dependsOn".freeze,
      range: "http://vocab.data.gov/def/fea#Partition".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :description,
      domain: "http://vocab.data.gov/def/fea#FEA_Concept".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "description".freeze,
      range: "http://www.w3.org/2001/XMLSchema#string".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze, "http://www.w3.org/2002/07/owl#FunctionalProperty".freeze]
    property :drawsUpon,
      domain: "http://vocab.data.gov/def/fea#FEA_Model".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "drawsUpon".freeze,
      range: "http://vocab.data.gov/def/fea#FEA_Model".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :hasIntent,
      domain: "http://vocab.data.gov/def/fea#OrganizationEntity".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "hasIntent".freeze,
      range: "http://vocab.data.gov/def/fea#Mission".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#FunctionalProperty".freeze]
    property :intentOf,
      domain: "http://vocab.data.gov/def/fea#Mission".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "intentOf".freeze,
      range: "http://vocab.data.gov/def/fea#OrganizationEntity".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#InverseFunctionalProperty".freeze]
    property :isComprisedOf,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "isComprisedOf".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :isPartOf,
      comment: "used to describe part of relationships, such as, for example, the fact that one organization is part of another (departmental hierarchy).".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "is part of".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :mnemonic,
      domain: "http://vocab.data.gov/def/fea#FEA_Concept".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "mnemonic".freeze,
      range: "http://www.w3.org/2001/XMLSchema#string".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze]
    property :supportedBy,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "supportedBy".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :undertakenBy,
      domain: "http://vocab.data.gov/def/fea#IT_Initiative".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "undertakenBy".freeze,
      range: "http://vocab.data.gov/def/fea#Agency".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :undertakes,
      domain: "http://vocab.data.gov/def/fea#Agency".freeze,
      isDefinedBy: "http://vocab.data.gov/def/fea#".freeze,
      label: "undertakes".freeze,
      range: "http://vocab.data.gov/def/fea#IT_Initiative".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
  end
end
