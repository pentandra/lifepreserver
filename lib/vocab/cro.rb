# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.obolibrary.org/obo/cro.owl#
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://purl.obolibrary.org/obo/cro.owl#>
  #   class CRO < RDF::StrictVocabulary
  #   end
  class CRO < RDF::StrictVocabulary("http://purl.obolibrary.org/obo/cro.owl#")

    # Ontology definition
    ontology :"http://purl.obolibrary.org/obo/cro.owl",
      :"owl:imports" => %(http://vivoweb.org/ontology/core).freeze,
      type: "owl:Ontology".freeze

    # Class definitions
    term :CRO_0000000,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(A high-level classification of the diverse roles performed in the work leading to a published research output in the sciences. Its purpose to provide transparency in contributions to scholarly published work, to enable improved systems of attribution, credit, and accountability.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles).freeze,
      label: "Contribution Role".freeze,
      subClassOf: "http://purl.obolibrary.org/obo/BFO_0000023".freeze,
      type: "owl:Class".freeze
    term :CRO_0000001,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Contributions to the published research object).freeze,
      label: "Author Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000002,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Includes literature searches and contributions to review activities \(systematic reviews, scoping reviews, etc.\)).freeze,
      label: "Background and Literature Search Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000003,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Ideas; formulation or evolution of overarching research goals and aims.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Conceptualization).freeze,
      label: "Conceptualization Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000004,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Coordination of the deposit of the manuscript, data, and any secondary materials to appropriate repositories; ensure that outputs comply with OA mandates.).freeze,
      label: "Preservation Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000005,
      label: "Data Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000006,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Funding_acquisition).freeze,
      label: "Funding Acquisition Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000007,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Conducting a research and investigation process, specifically performing the experiments, or data/evidence collection.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Investigation).freeze,
      label: "Study Investigation Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000008,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Development or design of methodology; creation of models.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Methodology).freeze,
      label: "Methodology Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000009,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Management and coordination responsibility for the research activity planning and execution.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000118" => %(Project Administrator Role).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Project_administration).freeze,
      label: "Project Management Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000010,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Coordination of diverse team members, often across different disciplines and locations.).freeze,
      label: "Team Management Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000011,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Manage regulatory and compliance issues for the research project.).freeze,
      label: "Regulatory Administration Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000012,
      label: "Policy Development Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000013,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Provision of study materials, reagents, materials, patients, laboratory samples, animals, instrumentation, computing resources, or other analysis tools.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Resources).freeze,
      label: "Resource Provider Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000014,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Coordination of research dissemination through popular media and the press, as well as Community Outreach and liaising of project directly to the community.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000116" => %(Similar to vivo:OutreachProviderRole?).freeze,
      label: "Communication Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000015,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Programming, software development; designing computer programs; implementation of the computer code and supporting algorithms; testing of existing code components.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Software).freeze,
      label: "Software Developer Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000016,
      label: "Information Technology Systems Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000017,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Oversight and leadership responsibility for the research activity planning and execution, including mentorship external to the core team.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Supervision).freeze,
      label: "Supervision Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000018,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Verification, whether as a part of the activity or separate, of the overall replication/reproducibility of results/experiments and other research outputs.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Validation).freeze,
      label: "Validation Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000019,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Preparation, creation and/or presentation of the published work, specifically writing the initial draft.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Writing_%E2%80%93_original_draft).freeze,
      label: "Writing Original Draft Role".freeze,
      subClassOf: "cro:CRO_0000001".freeze,
      type: "owl:Class".freeze
    term :CRO_0000020,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Preparation, creation and/or presentation of the published work by those from the original research group, specifically critical review, commentary or revision – including pre- or post-publication stages.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Writing_%E2%80%93_review_%26_editing).freeze,
      label: "Editing and Proofreading Role".freeze,
      subClassOf: "cro:CRO_0000001".freeze,
      type: "owl:Class".freeze
    term :CRO_0000021,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Preparation, creation and/or presentation of the published work, specifically visualization/data presentation.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Visualization).freeze,
      label: "Figure Development Role".freeze,
      subClassOf: "cro:CRO_0000001".freeze,
      type: "owl:Class".freeze
    term :CRO_0000022,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Translating words or text from one language to another.).freeze,
      label: "Translator Role".freeze,
      subClassOf: "cro:CRO_0000001".freeze,
      type: "owl:Class".freeze
    term :CRO_0000023,
      label: "Archivist Role".freeze,
      subClassOf: "cro:CRO_0000004".freeze,
      type: "owl:Class".freeze
    term :CRO_0000024,
      label: "Digital Preservation Role".freeze,
      subClassOf: "cro:CRO_0000004".freeze,
      type: "owl:Class".freeze
    term :CRO_0000025,
      label: "Conservator Role".freeze,
      subClassOf: "cro:CRO_0000004".freeze,
      type: "owl:Class".freeze
    term :CRO_0000026,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Management activities to annotate \(produce metadata\), scrub data and maintain research data \(including software code, where it is necessary for interpreting the data itself\) for initial use and later re-use.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Data_curation).freeze,
      label: "Data Curation Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000027,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Manual entry or automated ingestion.).freeze,
      label: "Data Entry Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000028,
      label: "Data Visualization Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000029,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Preparation, creation and/or presentation of the published work, specifically visualization/data presentation.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000119" => %(http://dictionary.casrai.org/Contributor_Roles/Formal_analysis).freeze,
      label: "Data Analysis Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000030,
      label: "Data Collection Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000031,
      label: "Data Aggregation Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000032,
      label: "Data Integration Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000033,
      :"http://purl.obolibrary.org/obo/IAO_0000118" => %(Data Scrubbing Role).freeze,
      label: "Data Quality Assurance Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000034,
      label: "Data Modeling Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000035,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Development of ontology, terminology, code lists, etc.).freeze,
      label: "Data Standards Developer Role".freeze,
      subClassOf: "cro:CRO_0000005".freeze,
      type: "owl:Class".freeze
    term :CRO_0000036,
      label: "Technique Development Role".freeze,
      subClassOf: "cro:CRO_0000008".freeze,
      type: "owl:Class".freeze
    term :CRO_0000037,
      label: "Protocol Creation Role".freeze,
      subClassOf: "cro:CRO_0000008".freeze,
      type: "owl:Class".freeze
    term :CRO_0000038,
      :"http://purl.obolibrary.org/obo/IAO_0000118" => %(Best Practices Role).freeze,
      label: "Guideline Development Role".freeze,
      subClassOf: "cro:CRO_0000008".freeze,
      type: "owl:Class".freeze
    term :CRO_0000039,
      label: "Standard Operating Procedure Development Role".freeze,
      subClassOf: "cro:CRO_0000008".freeze,
      type: "owl:Class".freeze
    term :CRO_0000040,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Detailed design of study components including data collection, analysis, and dissemination.).freeze,
      label: "Study Design Role".freeze,
      subClassOf: "cro:CRO_0000008".freeze,
      type: "owl:Class".freeze
    term :CRO_0000041,
      label: "Marketing Role".freeze,
      subClassOf: "cro:CRO_0000014".freeze,
      type: "owl:Class".freeze
    term :CRO_0000042,
      label: "Networking Facilitation Role".freeze,
      subClassOf: "cro:CRO_0000014".freeze,
      type: "owl:Class".freeze
    term :CRO_0000043,
      label: "Graphic Design Role".freeze,
      subClassOf: "cro:CRO_0000014".freeze,
      type: "owl:Class".freeze
    term :CRO_0000044,
      label: "Website Development Role".freeze,
      subClassOf: "cro:CRO_0000014".freeze,
      type: "owl:Class".freeze
    term :CRO_0000045,
      label: "Documentation Role".freeze,
      subClassOf: "cro:CRO_0000014".freeze,
      type: "owl:Class".freeze
    term :CRO_0000046,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Creation of high-level structures of a software system.).freeze,
      label: "Software Architecture Role".freeze,
      subClassOf: "cro:CRO_0000015".freeze,
      type: "owl:Class".freeze
    term :CRO_0000047,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Creation of low-level software component and algorithm design.).freeze,
      label: "Software Design Role".freeze,
      subClassOf: "cro:CRO_0000015".freeze,
      type: "owl:Class".freeze
    term :CRO_0000048,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Requirements analysis, algorithm development, and implementation of software in a computer programming language.).freeze,
      label: "Computer Programming Role".freeze,
      subClassOf: "cro:CRO_0000015".freeze,
      type: "owl:Class".freeze
    term :CRO_0000049,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Systematic application of scientific and technological knowledge, methods, and experience to the design, implementation, testing, and documentation of software.).freeze,
      label: "Software Engineering Role".freeze,
      subClassOf: "cro:CRO_0000015".freeze,
      type: "owl:Class".freeze
    term :CRO_0000050,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Verification that software meets requirements; validation that software meets users' needs, identification of software bugs, assessment of software performance and usability.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000118" => %(Software Quality Assurance Role).freeze,
      label: "Software Testing Role".freeze,
      subClassOf: "cro:CRO_0000015".freeze,
      type: "owl:Class".freeze
    term :CRO_0000051,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Planning, management, and monitoring of software projects.).freeze,
      label: "Software Project Management Role".freeze,
      subClassOf: "cro:CRO_0000015".freeze,
      type: "owl:Class".freeze
    term :CRO_0000052,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Examination of software code to identify build-breaking changes prior to acceptance into a codebase.).freeze,
      label: "Code Review Role".freeze,
      subClassOf: "cro:CRO_0000015".freeze,
      type: "owl:Class".freeze
    term :CRO_0000053,
      :"http://purl.obolibrary.org/obo/IAO_0000115" => %(Creation of software documentation.).freeze,
      :"http://purl.obolibrary.org/obo/IAO_0000118" => %(Software Documentation Role).freeze,
      label: "Technical Writing Role".freeze,
      subClassOf: "cro:CRO_0000015".freeze,
      type: "owl:Class".freeze
    term :CRO_0000054,
      label: "Software Systems Role".freeze,
      subClassOf: "cro:CRO_0000016".freeze,
      type: "owl:Class".freeze
    term :CRO_0000055,
      label: "Hardware Systems Role".freeze,
      subClassOf: "cro:CRO_0000016".freeze,
      type: "owl:Class".freeze
    term :CRO_0000056,
      label: "Metadata Application Role".freeze,
      subClassOf: "cro:CRO_0000026".freeze,
      type: "owl:Class".freeze
    term :CRO_0000057,
      label: "Statistical Data Analysis Role".freeze,
      subClassOf: "cro:CRO_0000029".freeze,
      type: "owl:Class".freeze
    term :CRO_0000058,
      label: "System Administrator Role".freeze,
      subClassOf: "cro:CRO_0000054".freeze,
      type: "owl:Class".freeze
    term :CRO_0000059,
      label: "Database Administrator Role".freeze,
      subClassOf: "cro:CRO_0000054".freeze,
      type: "owl:Class".freeze
    term :CRO_0000060,
      label: "Research Instrumentation Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000061,
      label: "Educational Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000062,
      label: "Intellectual Property Advisor Role".freeze,
      subClassOf: "cro:CRO_0000000".freeze,
      type: "owl:Class".freeze
    term :CRO_0000063,
      label: "Educational Program Development Role".freeze,
      subClassOf: "cro:CRO_0000061".freeze,
      type: "owl:Class".freeze
    term :CRO_0000064,
      label: "Educational Material Development Role".freeze,
      subClassOf: "cro:CRO_0000061".freeze,
      type: "owl:Class".freeze
    term :CRO_0000065,
      :"http://purl.obolibrary.org/obo/IAO_0000116" => %(This may be equivalent to vivo:Teacher Role).freeze,
      label: "Teaching Role".freeze,
      subClassOf: "cro:CRO_0000061".freeze,
      type: "owl:Class".freeze
    term :CRO_0000066,
      label: "Device Development Role".freeze,
      subClassOf: "cro:CRO_0000060".freeze,
      type: "owl:Class".freeze
    term :CRO_0000067,
      label: "Equipment Technician Role".freeze,
      subClassOf: "cro:CRO_0000060".freeze,
      type: "owl:Class".freeze
    term :CRO_0000068,
      label: "Survey and Questionnaire Role".freeze,
      subClassOf: "cro:CRO_0000060".freeze,
      type: "owl:Class".freeze
    term :CRO_0000069,
      label: "Contributorship".freeze,
      subClassOf: "http://vivoweb.org/ontology/core#Relationship".freeze,
      type: "owl:Class".freeze
  end
end
