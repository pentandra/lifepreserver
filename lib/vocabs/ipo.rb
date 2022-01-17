# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/ipo/core#
require 'rdf'
module LifePreserver::Vocab
  IPO = Class.new(RDF::StrictVocabulary("http://purl.org/ipo/core#")) do

    # Ontology definition
    ontology :"http://purl.org/ipo/core#",
      comment: "Vocabulary for describing issues (or problems) and corresponding symptoms and solutions to a broad variety of contexts. It is intended to provide a generic, reusable core ontology that can be extended or specialized for use in domain-specific situations, aimed at supporting linked data publishing. The solutions are represented by procedures, which are possible workflows for solving corresponding issues.".freeze,
      "http://creativecommons.org/ns#license": "http://creativecommons.org/licenses/by/3.0/".freeze,
      "http://purl.org/dc/elements/1.1/creator": ["Mark Douglas de Azevedo Jacyntho".freeze, "Matheus Dimas de Morais".freeze],
      "http://purl.org/dc/elements/1.1/description": ["The conceptual model of the Issue Procedure Ontology can be seen below, where their classes and properties are presented by means of a UML class diagram.\nFor better understanding, the ontology can be divided into four modules:\nIssueEntity\nClasses: IssueEntity, Asset, Image, skos:Concept.\n\nProperties: directCategoryOf, hasDirectCategory, categoryOf, hasCategory, hasMaker, makerOf, hasAsset, assetOf, hasDepiction, depictionOf, title, description.\n\nPersons and Organizations\nClasses: Party, Person e Organization\n\nProperties: hasMember, memberOf, name.\n\nProblems and Symptoms\nClasses: Symptom, Issue.\n\nProperties: directlyCauses, directlyCausedBy, causes, causedBy, dependenceOf, dependsOn, directDependenceOf, directlyDependsOn, canDirectlyCause, canBeDirectlyCausedBy, canCause, canBeCausedBy, canBeDependenceOf, canDependOn, canBeDirectDependenceOf, canDirectlyDependOn, indicatedBy, indicates, hasCausativeAsset, causativeAssetOf, hasHostAsset, hostAssetOf.\n\nProblems and Solutions\nClasses: Action, Task, CompoundAction, Procedure, Activity, Step, Transition, BooleanExpression.\n\nProperties: solves, solvedBy, hasFirstStep, hasStep, activates, hasSource, hasTarget, hasIncoming, hasOutcoming, hasGuardCondition, hasPostCondition, hasPreCondition, goal.\n\nClassifying a IssueEntity\nThere are two ways of classifying a IssueEntity:\n1 - A non-intrinsic classification, ie, a classification aiming a simple grouping of IssueEntities, where the IPO ontology provides ipo use of the property \"ipo:hasCategory\" linking to \"skos:Concept\", enabling the creation of schemes of categories and subcategories.\n2 - A classification that is intrinsic to a IssueEntity, so that classification implies the creation of subclasses of IssueEntity with specific restrictions. For example, the \"Hard Disk Problem\" class being defined by a specific restriction that is being linked to at least one of the symptoms \"Error Reading File\" or \"Error Writing File\" (instances of Symptom class). Thus, resources can be classified based on the description of their symptoms, as an instance of the new class of \"Hard Disk Problem\" (HD).".freeze, "http://ipocore.sourceforge.net/1.2.0/ipo.png".freeze],
      "http://purl.org/dc/elements/1.1/language": "en".freeze,
      "http://purl.org/dc/elements/1.1/modified": "2015-07-30".freeze,
      "http://purl.org/dc/elements/1.1/title": "IPO - Issue Procedure Ontology".freeze,
      "http://purl.org/dc/terms/issued": "2014-11-21".freeze,
      "http://purl.org/dc/terms/license": "http://creativecommons.org/licenses/by/3.0/".freeze,
      "http://purl.org/dc/terms/rights": "This work is distributed under a Creative Commons Attribution License (http://creativecommons.org/licenses/by/3.0/).".freeze,
      "http://purl.org/vocab/vann/preferredNamespacePrefix": "ipo".freeze,
      "http://purl.org/vocab/vann/preferredNamespaceUri": "http://purl.org/ipo/core#".freeze,
      "http://www.w3.org/2002/07/owl#versionIRI": "http://purl.org/ipo/core/1.2.0".freeze,
      "http://www.w3.org/2002/07/owl#versionInfo": "1.2.0".freeze,
      label: "IPO - Issue Procedure Ontology".freeze,
      type: ["http://purl.org/vocommons/voaf#Vocabulary".freeze, "http://www.w3.org/2002/07/owl#NamedIndividual".freeze, "http://www.w3.org/2002/07/owl#Ontology".freeze]

    # Class definitions
    term :Action,
      comment: "Represents an action to be performed. An Action can only be a primitive action (Task) or a set of actions (CompoundAction).\nAn Action has a precondition that will enable the execution of the Action, and a postcondition (effect) which will be validated after running the Action.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Action".freeze,
      subClassOf: ["http://purl.org/ipo/core#IssueEntity".freeze, term(
          onProperty: "http://purl.org/ipo/core#hasPostCondition".freeze,
          someValuesFrom: "http://purl.org/ipo/core#BooleanExpression".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://purl.org/ipo/core#hasPreCondition".freeze,
          someValuesFrom: "http://purl.org/ipo/core#BooleanExpression".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Activity,
      comment: "A set of steps that perform an activity, but does not aim to solve a particular Issue.\nCan be used to group multiple steps that are repeated in various Procedures to facilitate reuse.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/ipo/core#Procedure".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Activity".freeze,
      subClassOf: "http://purl.org/ipo/core#CompoundAction".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Asset,
      comment: "Any \"thing\" that a IssueEntity is related. \nFor example, a problem (disease) diagnosed in a patient, can have a virus and the patient as Asset, since the virus is the causative agent of the problem and the patient is the host in which the problem manifests itself.\nAn Asset can be a person, an object, a report, a document, etc.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Asset".freeze,
      subClassOf: term(
          onProperty: "http://purl.org/ipo/core#title".freeze,
          someValuesFrom: "http://www.w3.org/2001/XMLSchema#string".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :BooleanExpression,
      comment: "A logical expression whose value is true or false, aiming to validate a Transition between two Steps, or serve with a pre-condition for the execution of a Action or serve as a post-condition to validate the execution of an Action.\n\t   ".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "BooleanExpression".freeze,
      subClassOf: term(
          onProperty: "http://purl.org/ipo/core#description".freeze,
          someValuesFrom: "http://www.w3.org/2001/XMLSchema#string".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :CompoundAction,
      comment: "An action composed of several other actions. A CompoundAction may have the goal of solving one or more Issues, representing a Procedure or not having an explicit goal, just be a group of Actions to be reused, behaving as an Activity. A CompoundAction has one or more execution steps that activate one Action (Task or other CompoundAction), thus allowing, that a compoundAction reuse another.\nA CompoundAction can be used to create a workflow structure, aimed at better structuring of actions that compose it.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/ipo/core#Task".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "CompoundAction".freeze,
      subClassOf: ["http://purl.org/ipo/core#Action".freeze, term(
          onProperty: "http://purl.org/ipo/core#hasFirstStep".freeze,
          someValuesFrom: "http://purl.org/ipo/core#Step".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://purl.org/ipo/core#hasStep".freeze,
          someValuesFrom: "http://purl.org/ipo/core#Step".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Image,
      comment: "An artifact that illustrates or records a visual perception.\n\nIt can be used to illustrate a IssueEntity seeking a better understanding of it.".freeze,
      equivalentClass: "http://xmlns.com/foaf/0.1/Image".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Image".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Issue,
      comment: "A problem or issue to be resolved. For example, something that is not operating normally or a hindrance to performing some task.\nA Issue can be cause and/or caused, directly or indirectly, by another Issue, the same that the Issue A can depend on the Issue B, needing that the Issue B be solved before solving Issue A.\nThe Issue can have a set of Actions (Procedures) that will fix it and also a Issue can be indicated by several Symptoms, where a set of Symptoms can identify a Issue.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Issue".freeze,
      subClassOf: ["http://purl.org/ipo/core#IssueEntity".freeze, term(
          onProperty: "http://purl.org/ipo/core#indicatedBy".freeze,
          someValuesFrom: "http://purl.org/ipo/core#Symptom".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :IssueEntity,
      comment: "A generic class representing the three main concepts within the domain of ontology: Symptom, Problem and Action.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "IssueEntity".freeze,
      subClassOf: [term(
          onProperty: "http://purl.org/ipo/core#description".freeze,
          someValuesFrom: "http://www.w3.org/2001/XMLSchema#string".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://purl.org/ipo/core#title".freeze,
          someValuesFrom: "http://www.w3.org/2001/XMLSchema#string".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Organization,
      comment: "Represents a group of people organized aiming at a common goal: social, commercial or political.\nCan be used, for example, to represent a company that manufactures an Asset.".freeze,
      equivalentClass: "http://xmlns.com/foaf/0.1/Organization".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/ipo/core#Person".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Organization".freeze,
      subClassOf: "http://purl.org/ipo/core#Party".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Party,
      comment: "A class representing a Person or an Organization, and it assumes a role of agent within the treated domain.".freeze,
      equivalentClass: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://purl.org/ipo/core#Organization".freeze, "http://purl.org/ipo/core#Person".freeze)
        ),
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Party".freeze,
      subClassOf: ["http://xmlns.com/foaf/0.1/Agent".freeze, term(
          onProperty: "http://purl.org/ipo/core#name".freeze,
          someValuesFrom: "http://www.w3.org/2001/XMLSchema#string".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Person,
      comment: "This class represents a person.\nCan be used, for example, to represent a person who works in an Organization, produces some Asset or records an IssueEntity.".freeze,
      equivalentClass: "http://xmlns.com/foaf/0.1/Person".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Person".freeze,
      subClassOf: "http://purl.org/ipo/core#Party".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Procedure,
      comment: "A sequence of steps which, after executed solve one or more Issues.\nA procedure has a number of steps that are executed in a specific sequence, one seeking to solve Issue.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Procedure".freeze,
      subClassOf: ["http://purl.org/ipo/core#CompoundAction".freeze, term(
          onProperty: "http://purl.org/ipo/core#solves".freeze,
          someValuesFrom: "http://purl.org/ipo/core#Issue".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Step,
      comment: "A step to be performed within a CompoundAction. Every Step has an Action to be performed and a Transition to another Step to be performed after completing the execution of the Action. \nWith Steps is possible to establish an order for the execution of Actions, as each Step has a Transition that sets the Step of origin and destination. Once a CompoundAction has an initial Step (IPO: hasFirstStep), from this Step can be run all other steps that composes the compoundAction following the Transition between them.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Step".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Symptom,
      comment: "Represents a sign or indication of one or more Issues. Something that is perceived when a problem occurs.\n".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Symptom".freeze,
      subClassOf: ["http://purl.org/ipo/core#IssueEntity".freeze, term(
          onProperty: "http://purl.org/ipo/core#indicates".freeze,
          someValuesFrom: "http://purl.org/ipo/core#Issue".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Task,
      comment: "One elementary and single action.\nBeing an elementary task, it can not be decomposed into simpler actions.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Task".freeze,
      subClassOf: "http://purl.org/ipo/core#Action".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Transition,
      comment: "An Transition represents a transition (passage) between two Steps. Each Transition has a Step of origin (source) and a Step of destination (target). A Transition has a guard condition that specifies a boolean condition for that the Transition to occur.\nThrough the guard condition, can be implemented, in a simplified way, a workflow, establishing decision structures, repetition, choice, etc.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "Transition".freeze,
      subClassOf: [term(
          onProperty: "http://purl.org/ipo/core#hasGuardCondition".freeze,
          someValuesFrom: "http://purl.org/ipo/core#BooleanExpression".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://purl.org/ipo/core#hasSource".freeze,
          someValuesFrom: "http://purl.org/ipo/core#Step".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://purl.org/ipo/core#hasTarget".freeze,
          someValuesFrom: "http://purl.org/ipo/core#Step".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze

    # Property definitions
    property :activates,
      comment: "Indicates the action to be activated by a Step.".freeze,
      domain: "http://purl.org/ipo/core#Step".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "activates".freeze,
      range: "http://purl.org/ipo/core#Action".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :assetOf,
      comment: "Indicates a IssueEntity that is related to the Asset.\nThis property can be used to facilitate retrieval records of problems related to the Asset.".freeze,
      inverseOf: "http://purl.org/ipo/core#hasAsset".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "assetOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :canBeCausedBy,
      comment: "The Issue can be caused by another Issue directly or indirectly.\nThis property is transitive, i.e., if the issue \"A\" can be caused by the issue \"B\" and the issue \"B\" can be caused by the issue \"C\", then the issue \"A\" can be caused by the issue \"C\".".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "canBeCausedBy".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :canBeDependenceOf,
      comment: "Indicates that an Issue can be a dependence of another Issue directly or indirectly.\nThis property is also transitive, i.e., if the issue \"A\" can be dependence of the issue \"B\" and the issue \"B\" can be dependence of the issue \"C\", then the issue \"A\" can be dependence of the issue \"C\".".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "canBeDependenceOf".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :canBeDirectDependenceOf,
      comment: "This property indicates an Issue that can be direct dependence of another Issue.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "canBeDirectDependenceOf".freeze,
      subPropertyOf: "http://purl.org/ipo/core#canBeDependenceOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :canBeDirectlyCausedBy,
      comment: "An Issue can be  directly caused by another Issue.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "canBeDirectlyCausedBy".freeze,
      subPropertyOf: "http://purl.org/ipo/core#canBeCausedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :canCause,
      comment: "An Issue can cause another Issue directly or indirectly. \nThis property aims to express a possible causal relationship and has the characteristic of transitivity, i.e., the Issue \"A\" can cause the Issue \"B\" and the Issue \"B\" can cause the Issue \"C\", then the Issue \"A\" can cause the Issue \"C\".".freeze,
      domain: "http://purl.org/ipo/core#Issue".freeze,
      inverseOf: "http://purl.org/ipo/core#canBeCausedBy".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "canCause".freeze,
      range: "http://purl.org/ipo/core#Issue".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :canDependOn,
      comment: "Indicates that an Issue can depend on another Issue directly or indirectly.\nThis property can express a dependency relationship between Issues and has the characteristic of transitivity, i.e., the Issue \"A\" can depend on the Issue \"B\" and the Issue \"B\" can depend on \"C\", then the Issue \"A\" can depend on the Issue \"C\".".freeze,
      domain: "http://purl.org/ipo/core#Issue".freeze,
      inverseOf: "http://purl.org/ipo/core#canBeDependenceOf".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "canDependOn".freeze,
      range: "http://purl.org/ipo/core#Issue".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :canDirectlyCause,
      comment: "An Issue can directly cause another Issue.\nThis property aims to express a possible causal relationship, where an Issue can be direct cause of another Issue. For example, flu disease can cause pneumonia, i.e., in some cases, flu causes pneumonia and in another cases not.".freeze,
      inverseOf: "http://purl.org/ipo/core#canBeDirectlyCausedBy".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "canDirectlyCause".freeze,
      subPropertyOf: "http://purl.org/ipo/core#canCause".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :canDirectlyDependOn,
      comment: "Indicates that an Issue can directly depend on another Issue.\nFor example, pneumonia can directly depend that the flu is cured to finally be treated.".freeze,
      inverseOf: "http://purl.org/ipo/core#canBeDirectDependenceOf".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "canDirectlyDependOn".freeze,
      subPropertyOf: "http://purl.org/ipo/core#canDependOn".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :categoryOf,
      comment: "Indicates a IssueEntity classified in a skos:Concept.".freeze,
      inverseOf: "http://purl.org/ipo/core#hasCategory".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "categoryOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :causativeAssetOf,
      comment: "This property relates a Asset with a Issue caused by this Asset. For example, a virus associated with a disease caused by it.".freeze,
      inverseOf: "http://purl.org/ipo/core#hasCausativeAsset".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "causativeAssetOf".freeze,
      subPropertyOf: "http://purl.org/ipo/core#assetOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :causedBy,
      comment: "Indicates that an Issue is caused by another Issue directly or indirectly.\nThis property also has a transitive characteristic, i.e., if the Issue \"A\" is caused by Issue \"B\" and the Issue \"B\" is caused by Issue \"C\", then the Issue \"A\" is caused by Issue \"C\".".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "causedBy".freeze,
      subPropertyOf: "http://www.w3.org/2002/07/owl#topObjectProperty".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :causes,
      comment: "Indicates that an Issue causes another Issue directly or indirectly.\nThis property expresses a causal relationship between Issues and have the characteristic of transitivity, i.e., if the Issue \"A\" causes Issue \"B\" and the Issue \"B\" causes Issue \"C\", then the Issue \"A\" causes Issue \"C\".".freeze,
      domain: "http://purl.org/ipo/core#Issue".freeze,
      inverseOf: "http://purl.org/ipo/core#causedBy".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "causes".freeze,
      range: "http://purl.org/ipo/core#Issue".freeze,
      subPropertyOf: "http://www.w3.org/2002/07/owl#topObjectProperty".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :dependenceOf,
      comment: "Indicates that an Issue is a dependence of another Issue directly or indirectly. \nThis property also has a transitive characteristic, i.e. , if Issue \"A\" is dependence of the Issue \"B\", and the Issue \"B\" is dependence of Issue \"C\", then the Issue \"A\" is dependence of Issue \"C\".".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "dependenceOf".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :dependsOn,
      comment: "This property indicates that an Issue depends on another Issue directly or indirectly.\nThis property expresses a dependence relationship between Issues and has the characteristic of transitivity, i.e. , if Issue \"A\" depends on the Issue \"B\", and the Issue \"B\" depends on Issue \"C\", then the Issue \"A\" depends on Issue \"C\".".freeze,
      domain: "http://purl.org/ipo/core#Issue".freeze,
      inverseOf: "http://purl.org/ipo/core#dependenceOf".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "dependsOn".freeze,
      range: "http://purl.org/ipo/core#Issue".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :depictionOf,
      comment: "Indicates a IssueEntity illustrated by the image.\nThis property is functional, i.e., an Image is related by this property with only one IssueEntity.".freeze,
      inverseOf: "http://purl.org/ipo/core#hasDepiction".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "depictionOf".freeze,
      subPropertyOf: "http://xmlns.com/foaf/0.1/depicts".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :description,
      comment: "Indicates text that describes something in detail.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "description".freeze,
      range: "http://www.w3.org/2001/XMLSchema#string".freeze,
      subPropertyOf: ["http://purl.org/dc/terms/description".freeze, "http://www.w3.org/2000/01/rdf-schema#comment".freeze],
      type: ["http://www.w3.org/2002/07/owl#AnnotationProperty".freeze, "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze]
    property :directCategoryOf,
      comment: "Indicates a IssueEntity directly classified in a skos:Concept.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "directCategoryOf".freeze,
      subPropertyOf: "http://purl.org/ipo/core#categoryOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :directDependenceOf,
      comment: "Indicates that a Issue is direct dependence of another Issue.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "directDependenceOf".freeze,
      subPropertyOf: "http://purl.org/ipo/core#dependenceOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :directlyCausedBy,
      comment: "Indicates that an Issue is directly caused by another Issue.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "directlyCausedBy".freeze,
      subPropertyOf: "http://purl.org/ipo/core#causedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :directlyCauses,
      comment: "This property indicates that an Issue directly causes another Issue.".freeze,
      inverseOf: "http://purl.org/ipo/core#directlyCausedBy".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "directlyCauses".freeze,
      subPropertyOf: "http://purl.org/ipo/core#causes".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :directlyDependsOn,
      comment: "This relation indicates that a issue directly depends on another Issue.".freeze,
      inverseOf: "http://purl.org/ipo/core#directDependenceOf".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "directlyDependsOn".freeze,
      subPropertyOf: "http://purl.org/ipo/core#dependsOn".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :goal,
      comment: "Indicates the description of the goal to be reached after the execution of Procedure.".freeze,
      domain: "http://purl.org/ipo/core#Procedure".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "goal".freeze,
      range: "http://www.w3.org/2001/XMLSchema#string".freeze,
      type: "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze
    property :hasAsset,
      comment: "Indicates an Asset to IssueEntity, i.e., any \"thing\" which is related to IssueEntity.".freeze,
      domain: "http://purl.org/ipo/core#IssueEntity".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasAsset".freeze,
      range: "http://purl.org/ipo/core#Asset".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasCategory,
      comment: "Indicates a category (skos: Concept) directly or indirectly related to a IssueEntity.\nThe Concept class of SKOS ontology has properties that allow you to create hierarchies of categories (Concepts), still allowing express transitivity between categories. This approach should be used as an alternative to classification by subclass of IssueEntity when it are not intrinsic classifications, just grouping. For example, in the field of medicine, disease can be grouped as viral diseases, bacterial diseases, etc.".freeze,
      domain: "http://purl.org/ipo/core#IssueEntity".freeze,
      "http://www.w3.org/2002/07/owl#propertyChainAxiom": list("http://purl.org/ipo/core#hasCategory".freeze, term(
          type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
        )),
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasCategory".freeze,
      range: "http://www.w3.org/2004/02/skos/core#Concept".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasCausativeAsset,
      comment: "Indicates an Asset that is the causer of the Issue.".freeze,
      domain: "http://purl.org/ipo/core#Issue".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasCausativeAsset".freeze,
      subPropertyOf: "http://purl.org/ipo/core#hasAsset".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasDepiction,
      comment: "Indicates an image that illustrates the IssueEntity.\nSeeking a better description of IssueEntity, one can make use of this property to relate an illustrative image. For example, an image of a software screen containing an error occurred can help describe the problem.".freeze,
      domain: "http://purl.org/ipo/core#IssueEntity".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasDepiction".freeze,
      range: "http://purl.org/ipo/core#Image".freeze,
      subPropertyOf: "http://xmlns.com/foaf/0.1/depiction".freeze,
      type: ["http://www.w3.org/2002/07/owl#InverseFunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hasDirectCategory,
      comment: "Indicates a category (skos: Concept) directly related to a IssueEntity.".freeze,
      inverseOf: "http://purl.org/ipo/core#directCategoryOf".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasDirectCategory".freeze,
      subPropertyOf: "http://purl.org/ipo/core#hasCategory".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasFirstStep,
      comment: "A CompoundAction has one or more steps, so this property indicates the first step should be executed.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasFirstStep".freeze,
      subPropertyOf: "http://purl.org/ipo/core#hasStep".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#InverseFunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hasGuardCondition,
      comment: "Indicates a BooleanExpression for that a Transition occurs.\nFor example, a Transition can have as guardCondition that the Step of origin be executed 10 times. So while this Step does is not executes 10 times, will not be started the Step of destination. This example illustrates a repeating structure within the workflow.".freeze,
      domain: "http://purl.org/ipo/core#Transition".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasGuardCondition".freeze,
      range: "http://purl.org/ipo/core#BooleanExpression".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#InverseFunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hasHostAsset,
      comment: "Indicates an Asset that is the host (harbourer) of the Issue.".freeze,
      domain: "http://purl.org/ipo/core#Issue".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasHostAsset".freeze,
      subPropertyOf: "http://purl.org/ipo/core#hasAsset".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasIncoming,
      comment: "Indicates the Transition that starts the execution of this Step.".freeze,
      domain: "http://purl.org/ipo/core#Step".freeze,
      inverseOf: "http://purl.org/ipo/core#hasTarget".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasIncoming".freeze,
      range: "http://purl.org/ipo/core#Transition".freeze,
      type: ["http://www.w3.org/2002/07/owl#InverseFunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hasMaker,
      comment: "Indicates a Person or Organization (Party) who created or registered the IssueEntity. This property is also used by Asset class to relate to its manufacturer, developer, inventor, etc.".freeze,
      domain: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://purl.org/ipo/core#Asset".freeze, "http://purl.org/ipo/core#IssueEntity".freeze)
        ),
      inverseOf: "http://purl.org/ipo/core#makerOf".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasMaker".freeze,
      range: "http://purl.org/ipo/core#Party".freeze,
      subPropertyOf: "http://xmlns.com/foaf/0.1/maker".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasMember,
      comment: "Indicates a Person who is a member of this Organization or another Organization that is member of this Organization, representing here a department or business unit.\n".freeze,
      domain: "http://purl.org/ipo/core#Organization".freeze,
      inverseOf: "http://purl.org/ipo/core#memberOf".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasMember".freeze,
      range: "http://purl.org/ipo/core#Party".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasOutcoming,
      comment: "Indicates the Transition that occurs after execution of this Step and that activates the next Step to be executed.".freeze,
      domain: "http://purl.org/ipo/core#Step".freeze,
      inverseOf: "http://purl.org/ipo/core#hasSource".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasOutcoming".freeze,
      range: "http://purl.org/ipo/core#Transition".freeze,
      type: ["http://www.w3.org/2002/07/owl#InverseFunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hasPostCondition,
      comment: "Indicates a postcondition (effect) will be reached after executing the Action.".freeze,
      domain: "http://purl.org/ipo/core#Action".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasPostCondition".freeze,
      range: "http://purl.org/ipo/core#BooleanExpression".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#InverseFunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hasPreCondition,
      comment: "Indicates a precondition for the Action be executed.\n\nA precondition may represent a prerequisite for execution of the Action, without which it is not guaranteed correct execution.".freeze,
      domain: "http://purl.org/ipo/core#Action".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasPreCondition".freeze,
      range: "http://purl.org/ipo/core#BooleanExpression".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#InverseFunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hasSource,
      comment: "Indicates the Step of origin of this Transition.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasSource".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hasStep,
      comment: "Indicates a Step that composes the compoundAction.".freeze,
      domain: "http://purl.org/ipo/core#CompoundAction".freeze,
      "http://www.w3.org/2002/07/owl#propertyChainAxiom": list("http://purl.org/ipo/core#hasStep".freeze, "http://purl.org/ipo/core#hasOutcoming".freeze, "http://purl.org/ipo/core#hasTarget".freeze),
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasStep".freeze,
      range: "http://purl.org/ipo/core#Step".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasTarget,
      comment: "Indicates the Step of destination of this Transition.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hasTarget".freeze,
      type: ["http://www.w3.org/2002/07/owl#FunctionalProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hostAssetOf,
      comment: "Relates an Asset with a Issue that occurs in it.\nThis property can be used to relate a person with a disease whose the person is where the disease occurs.".freeze,
      inverseOf: "http://purl.org/ipo/core#hasHostAsset".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "hostAssetOf".freeze,
      subPropertyOf: "http://purl.org/ipo/core#assetOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :indicatedBy,
      comment: "Indicates a Symptom of this Issue.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "indicatedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :indicates,
      comment: "This property relates a Issue indicated by this Symptom.\nA Symptom may indicate many Issues, such as a Symptom of fever can indicate many diseases.".freeze,
      domain: "http://purl.org/ipo/core#Symptom".freeze,
      inverseOf: "http://purl.org/ipo/core#indicatedBy".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "indicates".freeze,
      range: "http://purl.org/ipo/core#Issue".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :makerOf,
      comment: "This property can be used to indicates an Asset created/manufactured by Party or a IssueEntity created/registered by the Party.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "makerOf".freeze,
      subPropertyOf: "http://xmlns.com/foaf/0.1/made".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :memberOf,
      comment: "Indicates a organization that the Party is participant.\nThis property can be used to indicates that an employee is a member of an organization.\nAnother approach is to use this property to relate two organizations thus representing a department that is a member of his company.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "memberOf".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :name,
      comment: "Indicates a name to identify something.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "name".freeze,
      range: "http://www.w3.org/2001/XMLSchema#string".freeze,
      type: "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze
    property :solvedBy,
      comment: "Indicates a solution (Procedure) for this Issue.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "solvedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :solves,
      comment: "Indicates a Issue that this Procedure solves.".freeze,
      domain: "http://purl.org/ipo/core#Procedure".freeze,
      inverseOf: "http://purl.org/ipo/core#solvedBy".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "solves".freeze,
      range: "http://purl.org/ipo/core#Issue".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :title,
      comment: "Title (word or phrase) that briefly describes something.".freeze,
      isDefinedBy: "http://purl.org/ipo/core".freeze,
      label: "title".freeze,
      range: "http://www.w3.org/2001/XMLSchema#string".freeze,
      subPropertyOf: ["http://purl.org/dc/terms/title".freeze, "http://www.w3.org/2000/01/rdf-schema#label".freeze],
      type: ["http://www.w3.org/2002/07/owl#AnnotationProperty".freeze, "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze]
  end
end
