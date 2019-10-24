# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://ontologi.es/doap-deps#
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://ontologi.es/doap-deps#>
  #   class DEPS < RDF::StrictVocabulary
  #   end
  class DEPS < RDF::StrictVocabulary("http://ontologi.es/doap-deps#")

    # Ontology definition
    ontology :"http://ontologi.es/doap-deps#",
      comment: %(an extension to DOAP for describing a project's requirements).freeze,
      "dc:created": "2013-07-30".freeze,
      "dc:creator": ["http://tobyinkster.co.uk/#i".freeze, term(
          "foaf:isPrimaryTopicOf": "http://toxi.co.uk/foaf.rdf".freeze,
          "foaf:mbox_sha1sum": "e66da09c6f6f75f0d512266706ece1647279a52e".freeze,
          "foaf:name": "Karsten Schmidt".freeze,
          "foaf:page": "https://twitter.com/toxi".freeze,
          type: "foaf:Person".freeze
        )],
      "dc:issued": "2013-07-31".freeze,
      "dc:modified": ["2013-07-30".freeze, "2013-07-31".freeze],
      label: "DOAP Dependencies".freeze,
      type: "owl:Ontology".freeze

    # Class definitions
    term :Dependency,
      comment: %(A condition to be met).freeze,
      label: "Dependency".freeze,
      type: "owl:Class".freeze
    term :HistoricDependency,
      label: "Historic Dependency".freeze,
      subClassOf: "deps:Dependency".freeze,
      type: "owl:Class".freeze
    term :IdentifierScheme,
      subClassOf: "rdfs:Datatype".freeze,
      type: "rdfs:Class".freeze
    term :Level,
      type: "owl:Class".freeze
    term :Phase,
      type: "owl:Class".freeze

    # Property definitions
    property :"build-recommendation",
      "deps:level": "deps:Recommended".freeze,
      "deps:phase": "deps:BuildPhase".freeze,
      domain: "doap:Project".freeze,
      label: "build recommendation".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"build-requirement",
      "deps:level": "deps:Required".freeze,
      "deps:phase": "deps:BuildPhase".freeze,
      domain: "doap:Project".freeze,
      label: "build requirement".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"build-suggestion",
      "deps:level": "deps:Suggested".freeze,
      "deps:phase": "deps:BuildPhase".freeze,
      domain: "doap:Project".freeze,
      label: "build suggestion".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"configure-recommendation",
      "deps:level": "deps:Recommended".freeze,
      "deps:phase": "deps:ConfigurePhase".freeze,
      domain: "doap:Project".freeze,
      label: "configure recommendation".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"configure-requirement",
      "deps:level": "deps:Required".freeze,
      "deps:phase": "deps:ConfigurePhase".freeze,
      domain: "doap:Project".freeze,
      label: "configure requirement".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"configure-suggestion",
      "deps:level": "deps:Suggested".freeze,
      "deps:phase": "deps:ConfigurePhase".freeze,
      domain: "doap:Project".freeze,
      label: "configure suggestion".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"develop-recommendation",
      "deps:level": "deps:Recommended".freeze,
      "deps:phase": "deps:DevelopmentPhase".freeze,
      domain: "doap:Project".freeze,
      label: "development recommendation".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"develop-requirement",
      "deps:level": "deps:Required".freeze,
      "deps:phase": "deps:DevelopmentPhase".freeze,
      domain: "doap:Project".freeze,
      label: "development requirement".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"develop-suggestion",
      "deps:level": "deps:Suggested".freeze,
      "deps:phase": "deps:DevelopmentPhase".freeze,
      domain: "doap:Project".freeze,
      label: "development suggestion".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :level,
      domain: "owl:ObjectProperty".freeze,
      range: "deps:Level".freeze,
      type: "owl:AnnotationProperty".freeze
    property :on,
      comment: %(the range of this property is a little woolly; a doap:Project is certainly fine, as is a literal which acts as an identifier, provided it's qualified with a datatype indicating what scheme it's an identifier in).freeze,
      domain: "deps:Dependency".freeze,
      label: "on".freeze,
      type: "rdf:Property".freeze
    property :phase,
      domain: "owl:ObjectProperty".freeze,
      range: "deps:Phase".freeze,
      type: "owl:AnnotationProperty".freeze
    property :"runtime-recommendation",
      "deps:level": "deps:Recommended".freeze,
      "deps:phase": "deps:RuntimePhase".freeze,
      domain: "doap:Project".freeze,
      label: "runtime recommendation".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"runtime-requirement",
      "deps:level": "deps:Required".freeze,
      "deps:phase": "deps:RuntimePhase".freeze,
      domain: "doap:Project".freeze,
      label: "runtime requirement".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"runtime-suggestion",
      "deps:level": "deps:Suggested".freeze,
      "deps:phase": "deps:RuntimePhase".freeze,
      domain: "doap:Project".freeze,
      label: "runtime suggestion".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :since,
      domain: "deps:Dependency".freeze,
      label: "since".freeze,
      range: "doap:Version".freeze,
      type: "owl:ObjectProperty".freeze
    property :"test-recommendation",
      "deps:level": "deps:Recommended".freeze,
      "deps:phase": "deps:TestPhase".freeze,
      domain: "doap:Project".freeze,
      label: "test recommendation".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"test-requirement",
      "deps:level": "deps:Required".freeze,
      "deps:phase": "deps:TestPhase".freeze,
      domain: "doap:Project".freeze,
      label: "test requirement".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :"test-suggestion",
      "deps:level": "deps:Suggested".freeze,
      "deps:phase": "deps:TestPhase".freeze,
      domain: "doap:Project".freeze,
      label: "test suggestion".freeze,
      range: "deps:Dependency".freeze,
      type: "owl:ObjectProperty".freeze
    property :until,
      domain: "deps:HistoricDependency".freeze,
      label: "until".freeze,
      range: "doap:Version".freeze,
      type: "owl:ObjectProperty".freeze

    # Extra definitions
    term :BuildPhase,
      type: "deps:Phase".freeze
    term :ConfigurePhase,
      type: "deps:Phase".freeze
    term :CpanId,
      comment: [%(A module name, optionally followed by a space character and a version.).freeze, %(Examples: `Moose::Role` or `Moose::Role 2.0600`).freeze],
      label: "CPAN Identifier".freeze,
      type: "deps:IdentifierScheme".freeze
    term :DebianId,
      comment: [%(Examples: `libmoose-perl` or `libmoose-perl \(>= 2.0600-1\)`).freeze, %(Note that architecture-specific modifiers \(in square brackets\) are not supported yet.).freeze],
      label: "Debian Package Identifier".freeze,
      "rdfs:seeAlso": "http://www.debian.org/doc/debian-policy/ch-relationships.html".freeze,
      type: "deps:IdentifierScheme".freeze
    term :DevelopmentPhase,
      type: "deps:Phase".freeze
    term :GemId,
      comment: [%(A module name, optionally followed by one or more operator, version number pairs.).freeze, %(Examples: `log4r` or `log4r >= 1.0.5` or `log4r >= 1.0.5, < 2.0.0`).freeze],
      label: "Gem Identifier".freeze,
      type: "deps:IdentifierScheme".freeze
    term :MvnId,
      comment: [%(A fully qualified Maven artefact name: 'groupID/artefactID version[-classifier]').freeze, %(Example 'org.clojure/clojure 1.5.1-SNAPSHOT').freeze],
      label: "Maven Identifier".freeze,
      type: "deps:IdentifierScheme".freeze
    term :PipId,
      comment: [%(A single line from a requirements.txt file, minus the line break.).freeze, %(Example: `html5lib==0.95`).freeze],
      label: "Pip Identifier".freeze,
      type: "deps:IdentifierScheme".freeze
    term :Recommended,
      type: "deps:Level".freeze
    term :Required,
      type: "deps:Level".freeze
    term :RpmId,
      comment: %(Examples: `perl-Moose` or `perl-Moose >= 2.0600-1`).freeze,
      label: "RPM Package Identifier".freeze,
      type: "deps:IdentifierScheme".freeze
    term :RuntimePhase,
      type: "deps:Phase".freeze
    term :Suggested,
      type: "deps:Level".freeze
    term :TestPhase,
      type: "deps:Phase".freeze
  end
end
