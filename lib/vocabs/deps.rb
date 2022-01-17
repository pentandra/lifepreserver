# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://ontologi.es/doap-deps#
require 'rdf'
module LifePreserver::Vocab
  DEPS = Class.new(RDF::StrictVocabulary("http://ontologi.es/doap-deps#")) do

    # Ontology definition
    ontology :"http://ontologi.es/doap-deps#",
      comment: "an extension to DOAP for describing a project's requirements".freeze,
      "http://purl.org/dc/terms/created": "2013-07-30".freeze,
      "http://purl.org/dc/terms/creator": ["http://tobyinkster.co.uk/#i".freeze, term(
          "http://xmlns.com/foaf/0.1/isPrimaryTopicOf": "http://toxi.co.uk/foaf.rdf".freeze,
          "http://xmlns.com/foaf/0.1/mbox_sha1sum": "e66da09c6f6f75f0d512266706ece1647279a52e".freeze,
          "http://xmlns.com/foaf/0.1/name": "Karsten Schmidt".freeze,
          "http://xmlns.com/foaf/0.1/page": "https://twitter.com/toxi".freeze,
          type: "http://xmlns.com/foaf/0.1/Person".freeze
        )],
      "http://purl.org/dc/terms/issued": "2013-07-31".freeze,
      "http://purl.org/dc/terms/modified": ["2013-07-30".freeze, "2013-07-31".freeze],
      label: "DOAP Dependencies".freeze,
      type: "http://www.w3.org/2002/07/owl#Ontology".freeze

    # Class definitions
    term :Dependency,
      comment: "A condition to be met".freeze,
      label: "Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :HistoricDependency,
      label: "Historic Dependency".freeze,
      subClassOf: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :IdentifierScheme,
      subClassOf: "http://www.w3.org/2000/01/rdf-schema#Datatype".freeze,
      type: "http://www.w3.org/2000/01/rdf-schema#Class".freeze
    term :Level,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Phase,
      type: "http://www.w3.org/2002/07/owl#Class".freeze

    # Property definitions
    property :"build-recommendation",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Recommended".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#BuildPhase".freeze,
      label: "build recommendation".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"build-requirement",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Required".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#BuildPhase".freeze,
      label: "build requirement".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"build-suggestion",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Suggested".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#BuildPhase".freeze,
      label: "build suggestion".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"configure-recommendation",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Recommended".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#ConfigurePhase".freeze,
      label: "configure recommendation".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"configure-requirement",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Required".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#ConfigurePhase".freeze,
      label: "configure requirement".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"configure-suggestion",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Suggested".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#ConfigurePhase".freeze,
      label: "configure suggestion".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"develop-recommendation",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Recommended".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#DevelopmentPhase".freeze,
      label: "development recommendation".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"develop-requirement",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Required".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#DevelopmentPhase".freeze,
      label: "development requirement".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"develop-suggestion",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Suggested".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#DevelopmentPhase".freeze,
      label: "development suggestion".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :level,
      domain: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze,
      range: "http://ontologi.es/doap-deps#Level".freeze,
      type: "http://www.w3.org/2002/07/owl#AnnotationProperty".freeze
    property :on,
      comment: "the range of this property is a little woolly; a doap:Project is certainly fine, as is a literal which acts as an identifier, provided it's qualified with a datatype indicating what scheme it's an identifier in".freeze,
      domain: "http://ontologi.es/doap-deps#Dependency".freeze,
      label: "on".freeze,
      type: "http://www.w3.org/1999/02/22-rdf-syntax-ns#Property".freeze
    property :phase,
      domain: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze,
      range: "http://ontologi.es/doap-deps#Phase".freeze,
      type: "http://www.w3.org/2002/07/owl#AnnotationProperty".freeze
    property :"runtime-recommendation",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Recommended".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#RuntimePhase".freeze,
      label: "runtime recommendation".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"runtime-requirement",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Required".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#RuntimePhase".freeze,
      label: "runtime requirement".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"runtime-suggestion",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Suggested".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#RuntimePhase".freeze,
      label: "runtime suggestion".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :since,
      domain: "http://ontologi.es/doap-deps#Dependency".freeze,
      label: "since".freeze,
      range: "http://usefulinc.com/ns/doap#Version".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"test-recommendation",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Recommended".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#TestPhase".freeze,
      label: "test recommendation".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"test-requirement",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Required".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#TestPhase".freeze,
      label: "test requirement".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :"test-suggestion",
      domain: "http://usefulinc.com/ns/doap#Project".freeze,
      "http://ontologi.es/doap-deps#level": "http://ontologi.es/doap-deps#Suggested".freeze,
      "http://ontologi.es/doap-deps#phase": "http://ontologi.es/doap-deps#TestPhase".freeze,
      label: "test suggestion".freeze,
      range: "http://ontologi.es/doap-deps#Dependency".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :until,
      domain: "http://ontologi.es/doap-deps#HistoricDependency".freeze,
      label: "until".freeze,
      range: "http://usefulinc.com/ns/doap#Version".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze

    # Extra definitions
    term :BuildPhase,
      type: "http://ontologi.es/doap-deps#Phase".freeze
    term :ConfigurePhase,
      type: "http://ontologi.es/doap-deps#Phase".freeze
    term :CpanId,
      comment: ["A module name, optionally followed by a space character and a version.".freeze, "Examples: `Moose::Role` or `Moose::Role 2.0600`".freeze],
      label: "CPAN Identifier".freeze,
      type: "http://ontologi.es/doap-deps#IdentifierScheme".freeze
    term :DebianId,
      comment: ["Examples: `libmoose-perl` or `libmoose-perl (>= 2.0600-1)`".freeze, "Note that architecture-specific modifiers (in square brackets) are not supported yet.".freeze],
      "http://www.w3.org/2000/01/rdf-schema#seeAlso": "http://www.debian.org/doc/debian-policy/ch-relationships.html".freeze,
      label: "Debian Package Identifier".freeze,
      type: "http://ontologi.es/doap-deps#IdentifierScheme".freeze
    term :DevelopmentPhase,
      type: "http://ontologi.es/doap-deps#Phase".freeze
    term :GemId,
      comment: ["A module name, optionally followed by one or more operator, version number pairs.".freeze, "Examples: `log4r` or `log4r >= 1.0.5` or `log4r >= 1.0.5, < 2.0.0`".freeze],
      label: "Gem Identifier".freeze,
      type: "http://ontologi.es/doap-deps#IdentifierScheme".freeze
    term :MvnId,
      comment: ["A fully qualified Maven artefact name: 'groupID/artefactID version[-classifier]'".freeze, "Example 'org.clojure/clojure 1.5.1-SNAPSHOT'".freeze],
      label: "Maven Identifier".freeze,
      type: "http://ontologi.es/doap-deps#IdentifierScheme".freeze
    term :PipId,
      comment: ["A single line from a requirements.txt file, minus the line break.".freeze, "Example: `html5lib==0.95`".freeze],
      label: "Pip Identifier".freeze,
      type: "http://ontologi.es/doap-deps#IdentifierScheme".freeze
    term :Recommended,
      type: "http://ontologi.es/doap-deps#Level".freeze
    term :Required,
      type: "http://ontologi.es/doap-deps#Level".freeze
    term :RpmId,
      comment: "Examples: `perl-Moose` or `perl-Moose >= 2.0600-1`".freeze,
      label: "RPM Package Identifier".freeze,
      type: "http://ontologi.es/doap-deps#IdentifierScheme".freeze
    term :RuntimePhase,
      type: "http://ontologi.es/doap-deps#Phase".freeze
    term :Suggested,
      type: "http://ontologi.es/doap-deps#Level".freeze
    term :TestPhase,
      type: "http://ontologi.es/doap-deps#Phase".freeze
  end
end
