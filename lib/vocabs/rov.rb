# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://www.w3.org/ns/regorg#
require 'rdf'
module LifePreserver::Vocab
  ROV = Class.new(RDF::StrictVocabulary("http://www.w3.org/ns/regorg#")) do

    # Ontology definition
    ontology :"http://www.w3.org/ns/regorg#",
      comment: "This file specifies the set of RDF classes and properties used in the Registered Organization Vocabulary vocabulary".freeze,
      "http://purl.org/dc/terms/abstract": "The Registered Organization Vocabulary is a profile of the Organization Ontology for describing organizations that have gained legal entity status through a formal registration process, typically in a national or regional register.".freeze,
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
      "http://purl.org/dc/terms/description": "This is the RDF encoding of the Legal Entity vocabulary, originally developed under the European Commission's ISA Programme.".freeze,
      "http://purl.org/dc/terms/modified": ["2013-05-24".freeze, "2013-12-21".freeze],
      "http://purl.org/dc/terms/title": "Registered Organization Vocabulary".freeze,
      "http://purl.org/vocab/vann/preferredNamespacePrefix": "rov".freeze,
      "http://purl.org/vocab/vann/preferredNamespaceUri": "http://www.w3.org/ns/regorg#".freeze,
      "http://purl.org/vocommons/voaf#specializes": "http://www.w3.org/ns/org".freeze,
      "http://www.w3.org/2002/07/owl#versionInfo": "Second version in w3.org/ns".freeze,
      "http://www.w3.org/2007/05/powder-s#describedby": "http://www.w3.org/TR/vocab-regorg/".freeze,
      "http://xmlns.com/foaf/0.1/maker": term(
          "http://xmlns.com/foaf/0.1/homepage": "http://www.w3.org/2011/gld/".freeze,
          "http://xmlns.com/foaf/0.1/name": "Government Linked Data WG, based on output from the ADMS Working Group".freeze
        ),
      label: "Registered Organization Vocabulary".freeze,
      type: ["http://purl.org/vocommons/voaf#Vocabulary".freeze, "http://www.w3.org/2002/07/owl#Ontology".freeze]

    # Class definitions
    term :RegisteredOrganization,
      comment: "rov:RegisteredOrganization is the key class for the Registered Organization vocabulary and represents \n    an organization that is legally registered. In many countries there is a single registry although in others, such \n    as Spain and Germany, multiple registries exist. A Registered Organization is able to trade, is legally liable for \n    its actions, accounts, tax affairs etc. Legal entity status is conferred by the act of registration cf. \n    org:FormalOrganization that applies to any legal entity, including those created by other legal means.\n    This makes registered organizations distinct from the broader concept of organizations, groups or, in \n    some jurisdictions, sole traders. Many organizations exist that are not legal entities yet to the outside world \n    they have staff, hierarchies, locations etc. Other organizations exist that are an umbrella for several legal entities \n    (universities are often good examples of this). This vocabulary is concerned solely with registered organizations.\n    In RDF, Registered Organization is a sub class of the Organization Ontology's org:FormalOrganization which is itself a \n    sub class of the more general 'Agent' class found in FOAF and Dublin Core that does encompass organizations, \n    natural persons, groups etc. - i.e. an Agent is any entity that is able to carry out actions.</p>".freeze,
      "http://purl.org/dc/terms/identifier": "rov:RegisteredOrganization".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-regorg/".freeze,
      label: "Registered Organization".freeze,
      subClassOf: "http://www.w3.org/ns/org#FormalOrganization".freeze,
      type: ["http://www.w3.org/2000/01/rdf-schema#Class".freeze, "http://www.w3.org/2002/07/owl#Class".freeze]

    # Property definitions
    property :hasRegisteredOrganization,
      comment: "The has registered organization relationship can be used to link any dcterms:Agent (equivalent class foaf:Agent) to a Registered Organization that in some way acts as a registered legal entity for it. This is useful, for example, where an organization includes one or more legal entities, or where a natural person is also registered as a legal entity. rov:hasRegisteredOrganization has a range of rov:RegisteredOrganization.".freeze,
      domain: "http://purl.org/dc/terms/Agent".freeze,
      "http://purl.org/dc/terms/identifier": "rov:hasRegisteredOrganization".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-regorg/".freeze,
      label: "registered organization".freeze,
      range: "http://www.w3.org/ns/regorg#RegisteredOrganization".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :legalName,
      comment: "The legal name of the business. A business might have more than one legal name, particularly in countries with more than one official language. In such cases the language of the string should be identified.".freeze,
      "http://purl.org/dc/terms/identifier": "rov:legalName".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-regorg/".freeze,
      label: "legal name".freeze,
      range: "http://www.w3.org/2000/01/rdf-schema#Literal".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze]
    property :orgActivity,
      comment: "The activity of a company should be recorded using a controlled vocabulary expressed as a SKOS concept scheme. Several such vocabularies exist, many of which map to the UN's ISIC codes. Where a particular controlled vocabulary is in use within a given context, such as SIC codes in the UK, it is acceptable to use these, however, the preferred choice for European interoperability is NACE. rov:orgActivity is a sub class of org:classification which has a range of skos:Concept.".freeze,
      "http://purl.org/dc/terms/identifier": "rov:orgActivity".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-regorg/".freeze,
      label: "company activity".freeze,
      subPropertyOf: "http://www.w3.org/ns/org#classification".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :orgStatus,
      comment: "Terms like insolvent, bankrupt and in receivership are likely to have different legal implications in different jurisdictions. Best Practice for recording various other status levels is to use the relevant jurisdiction's terms and to do so in a consistent manner using a SKOS Concept Scheme. rov:orgStatus is a sub class of org:classification which has a range of skos:Concept.".freeze,
      "http://purl.org/dc/terms/identifier": "rov:orgStatus".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-regorg/".freeze,
      label: "company status".freeze,
      subPropertyOf: "http://www.w3.org/ns/org#classification".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :orgType,
      comment: "This property records the type of organization. Familiar types are SA, PLC, LLC, GmbH etc. Each jurisdiction will have a limited set of recognized company types and these should be used in a consistent manner using a SKOS Concept Scheme. rov:orgType is a sub class of org:classification which has a range of skos:Concept.".freeze,
      "http://purl.org/dc/terms/identifier": "rov:orgType".freeze,
      isDefinedBy: "http://www.w3.org/TR/vocab-regorg/".freeze,
      label: "company type".freeze,
      subPropertyOf: "http://www.w3.org/ns/org#classification".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :registration,
      comment: "The registration is a fundamental relationship between a legal entity and the authority with which it is registered and that confers legal status upon it. rov:registration is a sub property of adms:identifier which has a range of adms:Identifier. rov:registration has a domain of rov:RegisteredOrganization.".freeze,
      domain: "http://www.w3.org/ns/regorg#RegisteredOrganization".freeze,
      "http://purl.org/dc/terms/identifier": "rov:registration".freeze,
      isDefinedBy: "http://www.w3.org/ns/regorg#".freeze,
      label: "registration".freeze,
      subPropertyOf: "http://www.w3.org/ns/adms#identifier".freeze,
      type: ["http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
  end
end
