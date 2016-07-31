# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://www.w3.org/ns/regorg#
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://www.w3.org/ns/regorg#>
  #   class ROV < RDF::StrictVocabulary
  #   end
  class ROV < RDF::StrictVocabulary("http://www.w3.org/ns/regorg#")

    # Class definitions
    term :RegisteredOrganization,
      comment: %(rov:RegisteredOrganization is the key class for the Registered Organization vocabulary and represents 
    an organization that is legally registered. In many countries there is a single registry although in others, such 
    as Spain and Germany, multiple registries exist. A Registered Organization is able to trade, is legally liable for 
    its actions, accounts, tax affairs etc. Legal entity status is conferred by the act of registration cf. 
    org:FormalOrganization that applies to any legal entity, including those created by other legal means.
    This makes registered organizations distinct from the broader concept of organizations, groups or, in 
    some jurisdictions, sole traders. Many organizations exist that are not legal entities yet to the outside world 
    they have staff, hierarchies, locations etc. Other organizations exist that are an umbrella for several legal entities 
    \(universities are often good examples of this\). This vocabulary is concerned solely with registered organizations.
    In RDF, Registered Organization is a sub class of the Organization Ontology's org:FormalOrganization which is itself a 
    sub class of the more general 'Agent' class found in FOAF and Dublin Core that does encompass organizations, 
    natural persons, groups etc. - i.e. an Agent is any entity that is able to carry out actions.</p>).freeze,
      :"dc:identifier" => [],
      label: "Registered Organization".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "org:FormalOrganization".freeze,
      type: ["owl:Class".freeze, "rdfs:Class".freeze]

    # Property definitions
    property :hasRegisteredOrganization,
      comment: %(The has registered organization relationship can be used to link any dcterms:Agent \(equivalent class foaf:Agent\) to a Registered Organization that in some way acts as a registered legal entity for it. This is useful, for example, where an organization includes one or more legal entities, or where a natural person is also registered as a legal entity. rov:hasRegisteredOrganization has a range of rov:RegisteredOrganization.).freeze,
      :"dc:identifier" => [],
      domain: "dc:Agent".freeze,
      label: "registered organization".freeze,
      range: "rov:RegisteredOrganization".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :legalName,
      comment: %(The legal name of the business. A business might have more than one legal name, particularly in countries with more than one official language. In such cases the language of the string should be identified.).freeze,
      :"dc:identifier" => [],
      label: "legal name".freeze,
      range: "rdfs:Literal".freeze,
      :"rdfs:isDefinedBy" => [],
      type: ["owl:DatatypeProperty".freeze, "rdf:Property".freeze]
    property :orgActivity,
      comment: %(The activity of a company should be recorded using a controlled vocabulary expressed as a SKOS concept scheme. Several such vocabularies exist, many of which map to the UN's ISIC codes. Where a particular controlled vocabulary is in use within a given context, such as SIC codes in the UK, it is acceptable to use these, however, the preferred choice for European interoperability is NACE. rov:orgActivity is a sub class of org:classification which has a range of skos:Concept.).freeze,
      :"dc:identifier" => [],
      label: "company activity".freeze,
      :"rdfs:isDefinedBy" => [],
      subPropertyOf: "org:classification".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :orgStatus,
      comment: %(Terms like insolvent, bankrupt and in receivership are likely to have different legal implications in different jurisdictions. Best Practice for recording various other status levels is to use the relevant jurisdiction's terms and to do so in a consistent manner using a SKOS Concept Scheme. rov:orgStatus is a sub class of org:classification which has a range of skos:Concept.).freeze,
      :"dc:identifier" => [],
      label: "company status".freeze,
      :"rdfs:isDefinedBy" => [],
      subPropertyOf: "org:classification".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :orgType,
      comment: %(This property records the type of organization. Familiar types are SA, PLC, LLC, GmbH etc. Each jurisdiction will have a limited set of recognized company types and these should be used in a consistent manner using a SKOS Concept Scheme. rov:orgType is a sub class of org:classification which has a range of skos:Concept.).freeze,
      :"dc:identifier" => [],
      label: "company type".freeze,
      :"rdfs:isDefinedBy" => [],
      subPropertyOf: "org:classification".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
    property :registration,
      comment: %(The registration is a fundamental relationship between a legal entity and the authority with which it is registered and that confers legal status upon it. rov:registration is a sub property of adms:identifier which has a range of adms:Identifier. rov:registration has a domain of rov:RegisteredOrganization.).freeze,
      :"dc:identifier" => [],
      domain: "rov:RegisteredOrganization".freeze,
      label: "registration".freeze,
      :"rdfs:isDefinedBy" => [],
      subPropertyOf: "http://www.w3.org/ns/adms#identifier".freeze,
      type: ["owl:ObjectProperty".freeze, "rdf:Property".freeze]
  end
end
