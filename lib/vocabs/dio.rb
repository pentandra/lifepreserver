# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from https://w3id.org/dio#
require 'rdf'
module LifePreserver::Vocab
  DIO = Class.new(RDF::StrictVocabulary("https://w3id.org/dio#")) do

    # Ontology definition
    ontology :"https://w3id.org/dio#",
      "http://purl.org/dc/elements/1.1/creator": "Monika Solanki (monika.solanki@cs.ox.ac.uk)".freeze,
      "http://purl.org/dc/elements/1.1/date": "04-01-2016".freeze,
      "http://purl.org/dc/elements/1.1/description": ["The Design Intent Ontology (DIO) is a generic ontology that provides the conceptualisation needed to capture the knowledge generated during various phases of the overall design lifecycle. \n\nIt provides definitions for design artifacts such as requirements, designs, design issues, solutions, justifications and evidence and relationships between them to represent the design process and how these things lead to design outcomes.  It draws upon the paradigms of IBIS(Interactive Intent-Based Illustration), argumentation and design rationale. It is linked to W3C PROV by defining the actors in the design process as PROV agents and the design artifacts themselves are PROV entities. However DIO uses a modualrised version of PROV-O, based on Syntactic locality.\n\nDIO makes few assumptions about the design process used as the definitions of these activities properly belongs in the software lifecycle and data lifecycle models. The Figure below illustrates the conceptual entities in DIO and their relationships.".freeze, "http://aligned.cs.ox.ac.uk/images/dio.jpg".freeze],
      "http://purl.org/dc/elements/1.1/title": "The Design Intent Ontology - A content ontology design pattern".freeze,
      "http://www.w3.org/2000/01/rdf-schema#seeAlso": "http://ceur-ws.org/Vol-1461/WOP2015_pattern_abstract_6.pdf".freeze,
      "http://www.w3.org/2002/07/owl#imports": "http://aligned.cs.ox.ac.uk/ontologies/prov_dio".freeze,
      "http://www.w3.org/2002/07/owl#versionInfo": "1.1.000".freeze,
      type: "http://www.w3.org/2002/07/owl#Ontology".freeze

    # Class definitions
    term :AlternativeSolution,
      comment: "An entity representing the proposed solution.".freeze,
      label: "Alternative Solution".freeze,
      subClassOf: "https://w3id.org/dio#Solution".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Argument,
      comment: "A reason presented against a proposed solution.".freeze,
      label: "Argument".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Assumption,
      comment: "The assumption on which a proposed solution is based.".freeze,
      label: "Assumption".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Comment,
      comment: "A comment made by an agent in response to an argument, a justification or another comment".freeze,
      label: "Comment".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Constraint,
      comment: "A constraint that underlies the proposed solution.".freeze,
      label: "Constraint".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Design,
      comment: "A design is a specification of an object, manifested by an agent, intended to accomplish goals, in a particular environment, using a set of  components, satisfying a set of requirements, subject to constraints.".freeze,
      label: "Design".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :DesignArtifact,
      comment: "The concrete artifact that is implemented or developed following the design that emerges from the design decisions.".freeze,
      label: "Design Artifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :DesignDecision,
      comment: "The final design decision made based on the various alternative solutions proposed. A design decision is driven by a mandated solution.".freeze,
      label: "Design Decision".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :DesignGoal,
      comment: "An entity representing the problem, goal, question or issue the design intent aims to address.".freeze,
      equivalentClass: "https://w3id.org/dio#DesignIssue".freeze,
      label: "Design Goal".freeze,
      subClassOf: term(
          intersectionOf: list("https://w3id.org/dio#DesignIntentArtifact".freeze, term(
            allValuesFrom: "https://w3id.org/dio#AlternativeSolution".freeze,
            onProperty: "https://w3id.org/dio#hasAlternativeSolution".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          ), term(
            allValuesFrom: "https://w3id.org/dio#MandatedSolution".freeze,
            onProperty: "https://w3id.org/dio#hasMandatedSolution".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          ), term(
            "http://www.w3.org/2002/07/owl#maxQualifiedCardinality": "1".freeze,
            "http://www.w3.org/2002/07/owl#onClass": "https://w3id.org/dio#MandatedSolution".freeze,
            onProperty: "https://w3id.org/dio#hasMandatedSolution".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :DesignIntent,
      comment: "A entity defining the notion of a design intent, i.e., the rationale underpinning the choices that are made from the alternatives available during various phases of the overall design lifecycle.".freeze,
      label: "Design Intent".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :DesignIntentArtifact,
      comment: "An entity representing any artifact that plays a part in capturing the design intent. The minimum ontological commitment required for this entity is a brief description of the artifact, the version info and the date.".freeze,
      label: "Design Intent Artifact".freeze,
      subClassOf: term(
          intersectionOf: list(term(
            "http://www.w3.org/2002/07/owl#onClass": "http://www.w3.org/ns/prov#Agent".freeze,
            "http://www.w3.org/2002/07/owl#qualifiedCardinality": "1".freeze,
            onProperty: "http://www.w3.org/ns/prov#wasAttributedTo".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          ), term(
            "http://www.w3.org/2002/07/owl#onDataRange": "http://www.w3.org/2001/XMLSchema#dateTime".freeze,
            "http://www.w3.org/2002/07/owl#qualifiedCardinality": "1".freeze,
            onProperty: "http://www.w3.org/ns/prov#generatedAtTime".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          ), term(
            "http://www.w3.org/2002/07/owl#onDataRange": "http://www.w3.org/2001/XMLSchema#string".freeze,
            "http://www.w3.org/2002/07/owl#qualifiedCardinality": "1".freeze,
            onProperty: "https://w3id.org/dio#version".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :DesignIssue,
      comment: "An entity representing the problem, goal, question or issue the design intent aims to address.".freeze,
      label: "Design Issue".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :DesignRequirement,
      comment: "An entity capturing the requirements that result in the design intent".freeze,
      label: "Design Requirements".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Evaluation,
      comment: "An entity representing the evaluation that supports the solution.".freeze,
      label: "Evaluation".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Evidence,
      comment: "An entity representing an evidence that supports a proposed solution.".freeze,
      label: "Evidence".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Heuristic,
      comment: "An entity representing the requirements to be fulfilled for realising the solution".freeze,
      label: "Heuristic".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Justification,
      comment: "A reason supporting the proposed solution.".freeze,
      label: "Justification".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :MandatedSolution,
      comment: "An entity representing the solution accepted as a result of the design deliberation process.".freeze,
      label: "Mandated Solution".freeze,
      subClassOf: "https://w3id.org/dio#Solution".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :RationaleCaptureMethod,
      comment: "An entity representing the methodology used to capture the design intent artifact".freeze,
      label: "Rationale Capture Methodology".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Solution,
      label: "Solution".freeze,
      subClassOf: "https://w3id.org/dio#DesignIntentArtifact".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Status,
      comment: "An entity representing the status of a design issue.".freeze,
      label: "Status".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze

    # Property definitions
    property :addressedBy,
      comment: "A relationship stating the design intent addressing a requirement.".freeze,
      label: "addressedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :captureMethodology,
      comment: "A relationship identifying the capture methodology for a design issue".freeze,
      label: "captureMethodology".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :contradicts,
      comment: "A relationship indicating contradictory issues.".freeze,
      domain: "https://w3id.org/dio#Solution".freeze,
      label: "contradicts".freeze,
      range: "https://w3id.org/dio#Solution".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :fulfillsRequirement,
      comment: "A relationship between the design and its requirement.".freeze,
      domain: ["https://w3id.org/dio#Design".freeze, "https://w3id.org/dio#DesignIntentArtifact".freeze],
      inverseOf: "https://w3id.org/dio#requirementFulfilledBy".freeze,
      label: "fullfillsRequirements".freeze,
      range: "https://w3id.org/dio#DesignRequirement".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :generatedByIntent,
      comment: "A relationship between the design issue and intent.".freeze,
      inverseOf: "https://w3id.org/dio#generatesIssue".freeze,
      label: "generatedByIntent".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :generatesIssue,
      comment: "A relationship between the design intent and issue.".freeze,
      label: "generatesIssue".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :governsDesign,
      comment: "The design decision governing the design.".freeze,
      domain: "https://w3id.org/dio#DesignDecision".freeze,
      label: "governsDesign".freeze,
      range: "https://w3id.org/dio#Design".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasAlternativeSolution,
      comment: "The realtionship between the issue and an alternative solution for it.".freeze,
      label: "hasAlternativeSolution".freeze,
      range: "https://w3id.org/dio#AlternativeSolution".freeze,
      subPropertyOf: "http://www.w3.org/2002/07/owl#topObjectProperty".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasArgument,
      comment: "The relationship between a solution and an argument made against it.".freeze,
      label: "hasArgument".freeze,
      range: "https://w3id.org/dio#Argument".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasComment,
      comment: "The relationship between a comment and a design intent artifact for which the comment is made.".freeze,
      label: "hasComment".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasConstraint,
      comment: "A relationship between a solution and a constarint on it.".freeze,
      domain: "https://w3id.org/dio#Solution".freeze,
      label: "hasConstraint".freeze,
      range: "https://w3id.org/dio#Constraint".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasEvidence,
      comment: "A relationship between a solution and an evidence for it.".freeze,
      domain: ["https://w3id.org/dio#Argument".freeze, "https://w3id.org/dio#Justification".freeze],
      label: "hasEvidence".freeze,
      range: "https://w3id.org/dio#Evidence".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasJustification,
      comment: "A relationship between a solution and the justification for it.".freeze,
      label: "hasJustification".freeze,
      range: "https://w3id.org/dio#Justification".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasMandatedSolution,
      comment: "A relationship between the issue and its mandated solution.".freeze,
      label: "hasMandatedSolution".freeze,
      range: "https://w3id.org/dio#MandatedSolution".freeze,
      subPropertyOf: "http://www.w3.org/2002/07/owl#topObjectProperty".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasStatus,
      comment: "The relationship between an issue and its status.".freeze,
      domain: "https://w3id.org/dio#DesignIssue".freeze,
      label: "hasStatus".freeze,
      range: "https://w3id.org/dio#Status".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :identifiedByRequirement,
      comment: "The relationship between an issue and the requirement that identifies it.".freeze,
      inverseOf: "https://w3id.org/dio#identifies".freeze,
      label: "identifiedByRequirement".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :identifies,
      comment: "A relationship between the requirement and the issue it identifies.".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :implementedBy,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :leadsTo,
      comment: "A relationship between a mandated solution and design decision made based on it.".freeze,
      domain: "https://w3id.org/dio#MandatedSolution".freeze,
      label: "leadsTo".freeze,
      range: "https://w3id.org/dio#DesignDecision".freeze,
      subPropertyOf: "http://www.w3.org/2002/07/owl#topObjectProperty".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :providesAlternativeSolution,
      comment: "A relationship between an alternative solution and the issue.".freeze,
      inverseOf: "https://w3id.org/dio#hasAlternativeSolution".freeze,
      label: "providesAlternativeSolution".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :providesMandatedSolution,
      comment: "A relationship between a mandated solution and the issue.".freeze,
      inverseOf: "https://w3id.org/dio#hasMandatedSolution".freeze,
      label: "providesMandatedSolution".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :rationaleCapturedUsing,
      comment: "A relationship between the design rationale and its capture methodology.".freeze,
      label: "rationaleCapturedUsing".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :refines,
      comment: "A relationship between two requirememts when one refines the other.".freeze,
      domain: "https://w3id.org/dio#Solution".freeze,
      label: "refines".freeze,
      range: "https://w3id.org/dio#Solution".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :requirementFulfilledBy,
      comment: "A relationship between the design and its originating requirements".freeze,
      label: "requirementFulfilledBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :supports,
      comment: "A relationship between an agent and a design solution argument or justification.".freeze,
      label: "supports".freeze,
      range: ["https://w3id.org/dio#Argument".freeze, "https://w3id.org/dio#Justification".freeze],
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :usesAssumption,
      comment: "A relationship between a solution and the Assumption it makes.".freeze,
      domain: "https://w3id.org/dio#Solution".freeze,
      label: "usesAssumption".freeze,
      range: "https://w3id.org/dio#Assumption".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :usesHeuristic,
      comment: "A relationship between a solution and the heuristic iy uses.".freeze,
      domain: "https://w3id.org/dio#Solution".freeze,
      label: "usesHeuristic".freeze,
      range: "https://w3id.org/dio#Heuristic".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :version,
      type: ["http://www.w3.org/2002/07/owl#DatatypeProperty".freeze, "http://www.w3.org/2002/07/owl#FunctionalProperty".freeze]

    # Extra definitions
    term :Active,
      comment: "The status of an issue when it is active.".freeze,
      label: "Active".freeze,
      type: ["http://www.w3.org/2002/07/owl#NamedIndividual".freeze, "https://w3id.org/dio#Status".freeze]
    term :OnHold,
      comment: "The status of an issue when it is onHold".freeze,
      label: "onHold".freeze,
      type: ["http://www.w3.org/2002/07/owl#NamedIndividual".freeze, "https://w3id.org/dio#Status".freeze]
    term :Resolved,
      comment: "The status of an issue when it is resolved.".freeze,
      type: ["http://www.w3.org/2002/07/owl#NamedIndividual".freeze, "https://w3id.org/dio#Status".freeze]
    term :Terminated,
      comment: "The status of an issue when it is terminated.".freeze,
      type: ["http://www.w3.org/2002/07/owl#NamedIndividual".freeze, "https://w3id.org/dio#Status".freeze]
  end
end
