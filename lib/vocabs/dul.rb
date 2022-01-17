# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#
require 'rdf'
module LifePreserver::Vocab
  DUL = Class.new(RDF::StrictVocabulary("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#")) do

    # Ontology definition
    ontology :"http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#",
      comment: "The DOLCE+DnS Ultralite ontology.\nIt is a simplification of some parts of the DOLCE Lite-Plus library (cf. http://www.ontologydesignpatterns.org/ont/dul/DLP397.owl). \nMain aspects in which DOLCE+DnS Ultralite departs from DOLCE Lite-Plus are the following:\n\n- The names of classes and relations have been made more intuitive\n- The DnS-related part is closer to the newer 'constructive DnS' ontology (http://www.ontologydesignpatterns.org/ont/dul/cDnS.owl).\n- Temporal and spatial relations are simplified\n- Qualities and regions are more relaxed than in DOLCE-Full: they can be used as attributes of any entity; an axiom states that each quality has a region\n- Axiomatization makes use of simpler constructs than DOLCE Lite-Plus\n- The architecture of the ontology is pattern-based, which means that DOLCE+DnS Ultralite is also available in modules, called 'content ontology design patterns', which can be applied independently in the design of domain ontologies (cf. http://www.ontologydesignpatterns.org).  If many modules are needed in a same ontology project, it is anyway useful to use this integrated version.\n\nThe final result is a lightweight, easy-to-apply foundational ontology for modeling either physical or social contexts.\nSeveral extensions of DOLCE+DnS Ultralite have been designed: \n- Information objects: http://www.ontologydesignpatterns.org/ont/dul/IOLite.owl \n- Systems: http://www.ontologydesignpatterns.org/ont/dul/SystemsLite.owl \n- Plans: http://www.ontologydesignpatterns.org/ont/dul/PlansLite.owl\n- Legal domain: http://www.ontologydesignpatterns.org/ont/dul/CLO/CoreLegal.owl\n- Lexical and semiotic domains: http://www.ontologydesignpatterns.org/ont/lmm/LMM_L2.owl\n- DOLCE-Zero: http://www.ontologydesignpatterns.org/ont/d0.owl is a commonsense-oriented generalisation of some top-level classes, which allows to use DOLCE with tolerance against ambiguities like abstract vs. concrete information, locations vs. physical artifacts, event occurrences vs. event types, events vs. situations, qualities vs. regions, etc.; etc.".freeze,
      "http://www.w3.org/2002/07/owl#versionInfo": ["3.34".freeze, "Created by Aldo Gangemi as both a simplification and extension of DOLCE and Descriptions and Situations ontologies.".freeze, "In 3.2, the links between instances of Region or Parameter, and datatypes have been revised and made more powerful, in order to support efficient design patterns for data value modelling in OWL1.0.\nAlso, the names of the related properties have been changed in order to make them more intuitive.\nFurthermore, a large comment field has been added to the 'expresses' object property, in order to clarify some issues about the many interpretations.\nIn 3.3, the relation between regions, parameters, and datatypes has been still improved.\nIn 3.5, the person-related classes have been refactored: Person in 3.4 is now SocialPerson, to avoid confusion with commonsense intuition; Person is now the union of social persons and humans, therefore being a subclass of Agent.\nIn 3.6, other fixes on universal restriction involving expresses. Also added the property 'isConstraintFor' between parameters and entities. Moved the properties: 'assumes' and 'adopts' to the new module: http://www.ontologydesignpatterns.org/ont/dul/Conceptualization.owl.\nIn 3.7, some fixes on the names of classes and properties related to FormalEntity; created a new separate module for general universal restrictions (DULGCI.owl).\nIn 3.8, more fixes on the interface to formal entities and links to IOLite.owl.\nIn 3.9, some naming and comment fixes.\nIn 3.10, removed cardinality restriction from hasPart and isPartOf restrictions (changed to hasComponent and isComponentOf), for OWL(DL) compatibility. Also enlarged the range of includesAgent to contain both social and physical agents, and of conceptualizes universal restriction on agents, to include all social objects.\nIn 3.11, some more subproperty axioms have been introduced, and all elements have got English labels.\nIn 3.12, added some classes to map some old DolceLitePlus classes that were used to align OntoWordNet.\nIn 3.13, added the LocalConcept class to express a Concept that cannot be used in a Description different from the one that defines it. Also updated some comments.\nIn 3.14, added some comments.\nIn 3.15, removed some owl:disjointWith axioms relating Collection to InformationObject, Description, Situation, and SocialAgent. The rationale for doing that is to allow less strict constraints on domain relations involving collections that can be also conceived as descriptions, situations, social agents, or information objects; for example: a collection of sentences from a text (an information object) that are ranked with a relevance criterion can be still considered a text.\nIn 3.16, name of isActedBy changed to actsThrough, which is clearer. Also added SpatioTemporalRegion as constituted by a SpaceRegion and a TimeInterval.\nIn 3.17, removed redundant universal axioms from Entity and other top classes. Fixed restrictions on FunctionalSubstance class, and comments in Design and Substance classes.\nIn 3.18, removed subClassOf axiom from FunctionalSubstance to DesignedArtifact, created a new subclass of FunctionalSubstance, called DesignedSubstance, and created a subClassOf axiom from DesignedSubstance to DesignedArtifact.\nIn 3.19, removed disjointness axiom between Concept and Collection (the same rationale applies as in 3.15 version.\nIn 3.20, revised the comment for Quality, added InformationEntity as the superclass for InformationObject and InformationRealization (represented as the union of those classes). This is needed in many domain ontologies that do not need to distinguish between abstract and concrete aspects of information entities. One possible revision (not implemented here) would be to introduce the relations: expresses and isAbout with a broader domain:InformationEntity, and two more specific properties: abstractlyExpresses and isAbstractlyAbout. This last revision has not been implemented yet, since a large revision procedure should be carried out in order to check the impact of the revision on the existing DOLCE-DnS-Ultralite plugins.\nIn 3.21, added comment to InformationEntity, and optimized representation of equivalence for InformationRealization.\nIn 3.22, added comment to Personification.\nIn 3.23, added associatedWith object property, and put all object properties as subproperties of it.\nIn 3.24, removed hasProxy datatype property.\nIn 3.25, generalized domain and range of hasComponent and isComponentOf.\nIn 3.26, updated some comments in order to clarify or exemplify the concepts.\nIn 3.27, added rdfs:isDefinedBy annotations for Linked Data browsers.\nIn 3.28, broadened the universe of pre-/post-conditions to give room to events and states.\nIn 3.29, added some properties to support DBpedia alignment: sameSettingAs (situational analogous to coparticipation), including relations originating e.g. from sharing kinship, ownership, or roleplaying situations.\nIn 3.30, completed some domains and ranges (formerly owl:Thing, now dul:Entity), and added axiom: Organism subClassOf PhysicalAgent.\nIn 3.31, added a restriction to Quality and one to Region in order to ensure the original DOLCE constraint of qualities being always associated with a region, and vice versa. These axioms do not however exclude a direct applicability of qualities or regions to any other entity.\nIn 3.32, removed redundant union axioms and some restrictions, which spot a negative trade-off between expressivity and complexity.\nIn 3.33, added the ObjectAggregate class, added two property chains for coparticipation and same situation setting, updated some comments, added an axiom to Transition.\nIn 3.34, extended mereological support for parthood, introducing hasPropertPart (transitive) as a middle property between hasPart (transitive and reflexive) and hasComponent (asymmetric). This solution uses then \"reflexive reduction\" and \"transitive reduction\" design patterns (they allow to grant property characteristics through the superproperties, but not in the subproperties). Technically, mereology axioms would require that also hasProperPart be asymmetric, however a direct subproperty of an OWL non-simple property (hasPart) cannot be also asymmetric, hence the approximation. \nAdded a n-ary parthood class in order to suggest an alternative pattern for time- (and space-)indexed part relations. In order to ensure that property characteristics hold also with parthood n-ary, a property chain is introduced which infers a direct dul:partOf property for each parthood individual.\nAdded a dul:realizesSelfInformation propery in order to enable local reflexivity ('Self') axioms for all information realizations.\n\nIn 4.0, some foundational changes are introduced. \n- Firstly, the temporally indexed versions of some properties are introduced as subclasses of Situation (following the n-ary relation pattern), so covering relations from DOLCE that were skipped because of their larger arity. - \n- Secondly, D&S's Situation class is extracted from DOLCE top-level distinctions (it used to be a subclass of SocialObject), put as a primitive class under Entity, and not disjoint from any other class. Since we are relaxing the semantics of Situation, this change is fully compatible with previous versions of DUL.\nThe reason for the change is that it may sound counterintuitive (as many have noticed) to assume a descriptive commitment for situations, but not for events or states. \nIn fact, D&S provides an epistemological commitment to an ontology, independently from its foundational distinctions. A situation operationalizes that epistemology, and it is better not to put it under any foundational distinction (event, object, fluent, etc.), leaving to the designer whether to use descriptions as epistemological lenses, and so generating a situation, or not. \nA consequence is that any entity, when 'framed' by (satisfying) a description, becomes a situation. We can still model entities as being in a situation's setting, and classified by a concept defined in a description.".freeze],
      label: "DOLCE+DnS Ultralite".freeze,
      type: "http://www.w3.org/2002/07/owl#Ontology".freeze

    # Class definitions
    term :Abstract,
      comment: "Any Entity that cannot be located in space-time. E.g. mathematical entities: formal semantics elements, regions within dimensional spaces, etc.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Quality".freeze],
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Abstract".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Action,
      comment: "An Event with at least one Agent that isParticipantIn it, and that executes a Task that typically isDefinedIn a Plan, Workflow, Project, etc.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Action".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, term(
          minCardinality: "1".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#executesTask".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasParticipant".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Agent,
      comment: ["Additional comment: a computational agent can be considered as a PhysicalAgent that realizes a certain class of algorithms (that can be considered as instances of InformationObject) that allow to obtain some behaviors that are considered typical of agents in general. For an ontology of computational objects based on DOLCE see e.g. http://www.loa-cnr.it/COS/COS.owl, and http://www.loa-cnr.it/KCO/KCO.owl.".freeze, "Any agentive Object , either physical (e.g. a whale, a robot, an oak), or social (e.g. a corporation, an institution, a community).".freeze],
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Agent".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Amount,
      comment: "A quantity, independently from how it is measured, computed, etc.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalAttribute".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SpaceRegion".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze],
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Amount".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :BiologicalObject,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Biological object".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalBody".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ChemicalObject,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Chemical object".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalBody".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Classification,
      comment: "A special kind of Situation that allows to include time indexing for the classifies relation in situations. For example, if a Situation s 'my old cradle is used in these days as a flower pot' isSettingFor the entity 'my old cradle' and the TimeIntervals '8June2007' and '10June2007', and we know that s satisfies a functional Description for aesthetic objects, which defines the Concepts 'flower pot' and 'flower', then we also need to know what concept classifies 'my old cradle' at what time.\nIn order to solve this issue, we need to create a sub-situation s' for the classification time: 'my old cradle is a flower pot in 8June2007'. Such sub-situation s' isPartOf s.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: ["Classification".freeze, "time-indexed classification".freeze],
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeIndexedRelation".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Collection,
      comment: "Any container for entities that share one or more common properties. E.g. \"stone objects\", \"the nurses\", \"the Louvre Aegyptian collection\", all the elections for the Italian President of the Republic. \nA collection is not a logical class: a collection is a first-order entity, while a class is second-order.\nA collection is neither an aggregate of its member entities (see e.g. ObjectAggregate class).".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Collection".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Collective,
      comment: "A Collection whose members are agents, e.g. \"the nurses\", \"the Italian rockabilly fans\".\nCollectives, facon de parler, can act as agents, although they are not assumed here to be agents (they are even disjoint from the class SocialAgent). This is represented by admitting collectives in the range of the relations having Agent in their domain or range.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Collective".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasMember".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :CollectiveAgent,
      comment: "A SocialAgent that is actedBy agents that are (and act as) members of a Collective. A collective agent can have roles that are also roles of those agents.\nFor example, in sociology, a 'group action' is the situation in which a number of people (that result to be members of a collective) in a given area behave in a coordinated way in order to achieve a (often common) goal. The Agent in such a Situation is not single, but a CollectiveAgent (a Group). This can be generalized to the notion of social movement, which assumes a large Community or even the entire Society as agents.\nThe difference between a CollectiveAgent and an Organization is that a Description that introduces a CollectiveAgent is also one that unifies the corresponding Collective. In practice, this difference makes collective agents 'less stable' than organizations, because they have a dedicated, publicly recognizable Description that is conceived to introduce them.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Collective agent".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#actsThrough".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isIntroducedBy".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Community,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Community".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#CollectiveAgent".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Concept,
      comment: "A Concept is a SocialObject, and isDefinedIn some Description; once defined, a Concept can be used in other Description(s). If a Concept isDefinedIn exactly one Description, see the LocalConcept class.\nThe classifies relation relates Concept(s) to Entity(s) at some TimeInterval".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze],
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Concept".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isDefinedIn".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Configuration,
      comment: "A collection whose members are 'unified', i.e. organized according to a certain schema that can be represented by a Description.\nTypically, a configuration is the collection that emerges out of a composed entity: an industrial artifact, a plan, a discourse, etc.  \nE.g. a physical book has a configuration provided by the part-whole schema that holds together its cover, pages, ink. That schema, based on the individual relations between the book and its parts, can be represented in a reified way by means of a (structural) description, which is said to 'unify' the book configuration.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Configuration".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Contract,
      comment: "(The content of) an agreement between at least two agents that play a Party Role, about some contract object (a Task to be executed).".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Contract".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Description,
      comment: "A Description is a SocialObject that represents a conceptualization. \nIt can be thought also as a 'descriptive context' that uses or defines concepts in order to create a view on a 'relational context' (cf. Situation) out of a set of data or observations. \nFor example, a Plan is a Description of some actions to be executed by agents in a certain way, with certain parameters; a Diagnosis is a Description that provides an interpretation for a set of observed entities, etc.\nDescriptions 'define' or 'use' concepts, and can be 'satisfied' by situations.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze],
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Description".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Design,
      comment: "A Description of the Situation, in terms of structure and function, held by an Entity for some reason.\nA design is usually accompanied by the rationales behind the construction of the designed Entity (i.e. of the reasons why a design is claimed to be as such). For example, the actual design (a Situation) of a car or of a law is based on both the specification (a Description) of the structure, and the rationales used to construct cars or laws.\nWhile designs typically describe entities to be constructed, they can also be used to describe 'refunctionalized' entities, or to hypothesize unknown functions. For example, a cradle can be refunctionalized as a flowerpot based on a certain home design.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Design".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :DesignedArtifact,
      comment: "A PhysicalArtifact that is also described by a Design. This excludes simple recycling or refunctionalization of natural objects. Most common sense 'artifacts' can be included in this class: cars, lamps, houses, chips, etc.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Designed artifact".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalArtifact".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isDescribedBy".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Design".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :DesignedSubstance,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#DesignedArtifact".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#FunctionalSubstance".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Diagnosis,
      comment: "A Description of the Situation of a system, usually applied in order to control a normal behaviour, or to explain a notable behavior (e.g. a functional breakdown).".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Diagnosis".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Entity,
      comment: "Anything: real, possible, or imaginary, which some modeller wants to talk about for some purpose.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Entity".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Event,
      comment: "Any physical, social, or mental process, event, or state.\n\nMore theoretically, events can be classified in different ways, possibly based on 'aspect' (e.g. stative, continuous, accomplishement, achievement, etc.), on 'agentivity' (e.g. intentional, natural, etc.), or on 'typical participants' (e.g. human, physical, abstract, food, etc.).\nHere no special direction is taken, and the following explains why: events are related to observable situations, and they can have different views at a same time.\nIf a position has to be suggested here anyway, the participant-based classification of events seems the most stable and appropriate for many modelling problems.\n\n(1) Alternative aspectual views\n\nConsider a same event 'rock erosion in the Sinni valley': it can be conceptualized as an accomplishment (what has brought a certain state to occur), as an achievement (the state resulting from a previous accomplishment), as a punctual event (if we collapse the time interval of the erosion into a time point), or as a transition (something that has changed from a state to a different one). \nIn the erosion case, we could therefore have good motivations to shift from one aspect to another: a) causation focus, b) effectual focus, c) historical condensation, d) transition (causality).\n\nThe different views refer to the same event, but are still different: how to live with this seeming paradox? \nA typical solution e.g. in linguistics (cf. Levin's aspectual classes) and in DOLCE Full (cf. WonderWeb D18 axiomatization) is to classify events based on aspectual differences. But this solution would create different identities for a same event, where the difference is only based on the modeller's attitude.\nAn alternative solution is suggested here, and exploits the notion of (observable) Situation; a Situation is a view, consistent with a Description, which can be observed of a set of entities. It can also be seen as a 'relational context' created by an observer on the basis of a 'frame'. Therefore, a Situation allows to create a context where each particular view can have a proper identity, while the Event preserves its own identity. \nFor example, ErosionAsAccomplishment is a Situation where rock erosion is observed as a process leading to a certain achievement: the conditions (roles, parameters) that suggest such view are stated in a Description, which acts as a 'theory of accomplishments'. Similarly, ErosionAsTransition is a Situation where rock erosion is observed as an event that has changed a state to another: the conditions for such interpretation are stated in a different Description, which acts as a 'theory of state transitions'.\nConsider that in no case the actual event is changed or enriched in parts by the aspectual view.\n\n(2) Alternative intentionality views\n\nSimilarly to aspectual views, several intentionality views can be provided for a same Event. For example, one can investigate if an avalanche has been caused by immediate natural forces, or if there is any hint of an intentional effort to activate those natural forces.\nAlso in this case, the Event as such has not different identities, while the causal analysis generates situations with different identities, according to what Description is taken for interpreting the Event. \nOn the other hand, if the possible actions of an Agent causing the starting of an avalanche are taken as parts of the Event, then this makes its identity change, because we are adding a part to it. \nTherefore, if intentionality is a criterion to classify events or not, this depends on if an ontology designer wants to consider causality as a relevant dimension for events' identity.\n\n(3) Alternative participant views\n\nA slightly different case is when we consider the basic participants to an Event. In this case, the identity of the Event is affected by the participating objects, because it depends on them. \nFor example, if snow, mountain slopes, wind, waves, etc. are considered as an avalanche basic participants, or if we also want to add water, human agents, etc., that makes the identity of an avalanche change.\nAnyway, this approach to event classification is based on the designer's choices, and more accurately mirrors lexical or commonsense classifications (see. e.g. WordNet 'supersenses' for verb synsets).\n\nUltimately, this discussion has no end, because realists will keep defending the idea that events in reality are not changed by the way we describe them, while constructivists will keep defending the idea that, whatever 'true reality' is about, it can't be modelled without the theoretical burden of how we observe and describe it. \nBoth positions are in principle valid, but, if taken too radically, they focus on issues that are only partly relevant to the aim of computational ontologies, which assist domain experts in representing a certain portion of reality according to their own assumptions and requirements. \n\nFor this reason, in this ontology version of DOLCE, both events and situations are allowed, together with descriptions (the reason for the inclusion of the D&S framewrok in DOLCE), in order to encode the modelling needs, independently from the position (if any) chosen by the model designer.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Quality".freeze],
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Event".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasConstituent".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasParticipant".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasTimeInterval".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :EventType,
      comment: "A Concept that classifies an Event . An event type describes how an Event should be interpreted, executed, expected, seen, etc., according to the Description that the EventType isDefinedIn (or used in)".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze],
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Event type".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#classifies".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :FormalEntity,
      comment: "Entities that are formally defined and are considered independent from the social context in which they are used. They cannot be localized in space or time. Also called 'Platonic entities'.\nMathematical and logical entities are included in this class: sets, categories, tuples, costants, variables, etc.\nAbstract formal entities are distinguished from information objects, which are supposed to be part of a social context, and are localized in space and time, therefore being (social) objects.\nFor example, the class 'Quark' is an abstract formal entity from the purely set-theoretical perspective, but it is an InformationObject from the viewpoint of ontology design, when e.g. implemented in a logical language like OWL.\nAbstract formal entities are also distinguished from Concept(s), Collection(s), and Description(s), which are part of a social context, therefore being SocialObject(s) as well.\nFor example, the class 'Quark' is an abstract FormalEntity from the purely set-theoretical perspective, but it is a Concept within history of science and cultural dynamics.\n\nThese distinctions allow to represent two different notions of 'semantics': the first one is abstract and formal ('formal semantics'), and formallyInterprets symbols that are about entities whatsoever; for example, the term 'Quark' isAbout the Collection of all quarks, and that Collection isFormalGroundingFor the abstract class 'Quark' (in the extensional sense). \nThe second notion is social, localized in space-time ('social semantics'), and can be used to interpret entities in the intensional sense. For example, the Collection of all quarks isCoveredBy the Concept 'Quark', which is also expressed by the term 'Quark'.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Formal entity".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Abstract".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :FunctionalSubstance,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Functional substance".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Substance".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Goal,
      comment: "The Description of a Situation that is desired by an Agent, and usually associated to a Plan that describes how to actually achieve it".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Goal".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Group,
      comment: "A CollectiveAgent whose acting agents conceptualize a same SocialRelation .".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Group".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#CollectiveAgent".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isDescribedBy".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Plan".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :InformationEntity,
      comment: "A piece of information, be it concretely realized or not. It is a catchall class, intended to bypass the ambiguities of many data or text that could denote either a an expression or a concrete realization of that expression.\nIn a semiotic model, there is no special reason to distinguish between them, however we may want to distinguish between a pure information content (e.g. the 3rd Gymnopedie by Satie), and its possible concrete realizations as a music sheet, a piano execution, the reproduction of the execution, its publishing as a record, etc.).".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :InformationObject,
      comment: "A piece of information, such as a musical composition, a text, a word, a picture, independently from how it is concretely realized.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Information object".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationEntity".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :InformationRealization,
      comment: "A concrete realization of an InformationObject, e.g. the written document (object) containing the text of a law, a poetry reading (event), the dark timbre (quality) of a sound (event) in the execution (event) of a musical composition, realizing a 'misterioso' tempo indication.\n\nThe realization of an information object also realizes information about itself. This is a special semiotic feature, which allows to avoid a traditonal paradox, by which an information is often supposed to be about itself besides other entities (e.g. the information object 'carpe diem' is about its meaning in Horace's Odes (let alone its fortune in Western culture and beyond), but also about its expression in context: 'dum loquimur, fugerit invida aetas: carpe diem, quam minimum credula postero', with the sound and emotional relations that it could activate.\nThis is expressed in OWL2 with a local reflexivity axiom of the dul:InformationRealization class.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Information realization".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationEntity".freeze, term(
          "http://www.w3.org/2002/07/owl#hasSelf": "true".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#realizesSelfInformation".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#realizes".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalObject".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Quality".freeze)
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :LocalConcept,
      comment: "A Concept that isDefinedIn exactly 1 Description. For example, the Concept 'coffee' in a 'preparesCoffee' relation can be defined in that relation, and for all other Description(s) that use it, the isConceptUsedIn property should be applied. Notice therefore that not necessarily all Concept(s) isDefinedIn exactly 1 Description.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Local concept".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Method,
      comment: "A method is a Description that defines or uses concepts in order to guide carrying out actions aimed at a solution with respect to a problem. \nIt is different from a Plan, because plans could be carried out in order to follow a method, but a method can be followed by executing alternative plans.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Method".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Narrative,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Narrative".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :NaturalPerson,
      comment: "A person in the physical commonsense intuition: 'have you seen that person walking down the street?'".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Natural person".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Person".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalAgent".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Norm,
      comment: "A social norm.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Norm".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Object,
      comment: "Any physical, social, or mental object, or a substance. Following DOLCE Full, objects are always participating in some event (at least their own life), and are spatially located.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Quality".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Object".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasConstituent".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isClassifiedBy".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasLocation".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isParticipantIn".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ObjectAggregate,
      comment: "An aggregate of distributed objects, members of a same Collection, e.g. the stars in a constellation, the parts of a car, the employees of a company, the entries from an encyclopedia, the concepts expressed in a speech, etc.\nIt cannot be defined by means of an equivalence axiom, because it'd require the same Collection for all members, an axiom that cannot be expressed in OWL.".freeze,
      "http://purl.org/dc/elements/1.1/creator": "Aldo Gangemi".freeze,
      "http://purl.org/dc/elements/1.1/date": "2021-02-21T23:35:02Z".freeze,
      subClassOf: term(
          intersectionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze, term(
            onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
            someValuesFrom: term(
              intersectionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze, term(
                onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isMemberOf".freeze,
                someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
                type: "http://www.w3.org/2002/07/owl#Restriction".freeze
              )),
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Organism,
      comment: "A physical objects with biological characteristics, typically that organisms can self-reproduce.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Organism".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#BiologicalObject".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalAgent".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Organization,
      comment: "An internally structured, conventionally created SocialAgent, needing a specific Role and Agent that plays it, in order to act.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Organization".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Parameter,
      comment: "A Concept that classifies a Region; the difference between a Region and a Parameter is that regions represent sets of observable values, e.g. the height  of a given building, while parameters represent constraints or selections on observable values, e.g. 'VeryHigh'. Therefore, parameters can also be used to constrain regions, e.g. VeryHigh on a subset of values of the Region Height applied to buildings, or to add an external selection criterion , such as measurement units, to regions, e.g. Meter on a subset of values from the Region Length applied to the Region Length applied to roads.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Parameter".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#classifies".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Parthood,
      comment: "A special kind of Situation that allows to include time indexing for the hasPart relation in situations. \nFor example, if a Situation s 'finally, my bike has a luggage rack' isSettingFor the entity 'my bike' and the TimeIntervals 'now', or more specifically '29March2021', we need to have a time-index the part relation. With Parthood, we use includesWhole and includesPart properties.\nThis can be done similarly for other arguments of parthood, e.g. location, configuration, topology, etc.\nConcerning the possible property characteristics reused from mereology (transitivity, asymmetry, reflexivity), they need to be implemented by means of rules (or, in a limited way, property chains using the binary hasPart or hasProperPart properties).\nA key is also added to ensure identification constraints of time-indexed parthood.".freeze,
      "http://purl.org/dc/elements/1.1/creator": "Aldo Gangemi".freeze,
      "http://purl.org/dc/elements/1.1/date": "2021-04-03T13:53:57Z".freeze,
      "http://www.w3.org/2002/07/owl#hasKey": list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesPart".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesWhole".freeze),
      label: "parthood".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeIndexedRelation".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesPart".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesWhole".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Pattern,
      comment: "Any invariance detected from a dataset, or from observation; also, any invariance proposed based on top-down considerations.\nE.g. patterns detected and abstracted by an organism, by pattern recognition algorithms, by machine learning techniques, etc.\nAn occurrence of a pattern is an 'observable', or detected Situation".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Pattern".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Relation".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Person,
      comment: "Persons in commonsense intuition, which does not apparently distinguish between either natural or social persons.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: ["Person".freeze, "Persona {it}".freeze],
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Personification,
      comment: "A social entity with agentive features, but whose status is the result of a cultural transformation from e.g. a PhysicalObject, an Event, an Abstract, another SocialObject, etc. For example: the holy grail, deus ex machina, gods, magic wands, etc.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Personification".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :PhysicalAgent,
      comment: "A PhysicalObject that is capable of self-representing (conceptualizing) a Description in order to plan an Action. \nA PhysicalAgent is a substrate for (actsFor) a Social Agent".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Physical agent".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalObject".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :PhysicalArtifact,
      comment: "Any PhysicalObject that isDescribedBy a Plan .\nThis axiomatization is weak, but allows to talk of artifacts in a very general sense, i.e. including recycled objects, objects with an intentional functional change, natural objects that are given a certain function, even though they are not modified or structurally designed, etc. PhysicalArtifact(s) are not considered disjoint from PhysicalBody(s), in order to allow a dual classification when needed. E.g.,\nFunctionalSubstance(s) are included here as well.\nImmaterial (non-physical) artifacts (e.g. texts, ideas, cultural movements, corporations, communities, etc. can be modelled as social objects (see SocialObject), which are all 'artifactual' in the weak sense assumed here.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Physical artifact".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalObject".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isDescribedBy".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Plan".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :PhysicalAttribute,
      comment: "Physical value of a physical object, e.g. density, color, etc.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SpaceRegion".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze],
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Physical attribute".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalObject".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRegionFor".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :PhysicalBody,
      comment: "Physical bodies are PhysicalObject(s), for which we tend to neutralize any possible artifactual character. They can have several granularity levels: geological, chemical, physical, biological, etc.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Physical body".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalObject".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :PhysicalObject,
      comment: "Any Object that has a proper space region. The prototypical physical object has also an associated mass, but the nature of its mass can greatly vary based on the epistemological status of the object (scientifically measured, subjectively possible, imaginary).".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Physical object".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalObject".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :PhysicalPlace,
      comment: "A physical object that is inherently located; for example, a water area.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Physical place".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalObject".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Place,
      comment: "Socially or cognitively dependent locations: political geographic entities (Rome, Lesotho), and non-material locations determined by the presence of other entities (\"the area close to Rome\") or of pivot events or signs (\"the area where the helicopter fell\"), as well as identified as complements to other entities (\"the area under the table\"), etc. \nIn this generic sense, a Place is a 'dependent' location. For 'non-dependent' locations, cf. the PhysicalPlace class. For an abstract (dimensional) location, cf. the SpaceRegion class.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Place".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze, term(
          minCardinality: "1".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isLocationOf".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Plan,
      comment: "A Description having an explicit Goal, to be achieved by executing the plan".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Plan".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasComponent".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Goal".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :PlanExecution,
      comment: "Plan executions are situations that proactively satisfy a plan. Subplan executions are proper parts of the whole plan execution.".freeze,
      equivalentClass: term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#satisfies".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Plan".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ),
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Plan execution".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Process,
      comment: "This is a placeholder for events that are considered in their evolution, or anyway not strictly dependent on agents, tasks, and plans. \nSee Event class for some thoughts on classifying events. See also 'Transition'.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Process".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Project,
      comment: "A Plan that defines Role(s), Task(s), and a specific structure for tasks to be executed in relation to goals to be achieved, in order to achieve the main goal of the project. In other words, a project is a plan with a subgoal structure and multiple roles and tasks.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Project".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Plan".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#definesRole".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#definesTask".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Task".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Quality,
      comment: "Any aspect of an Entity (but not a part of it), which cannot exist without that Entity. For example, the way the surface of a specific PhysicalObject looks like, or the specific light of a place at a certain time, are examples of Quality, while the encoding of a Quality into e.g. a PhysicalAttribute should be modeled as a Region. \nFrom the design viewpoint, the Quality-Region distinction is useful only when individual aspects of an Entity are considered in a domain of discourse. \nFor example, in an automotive context, it would be irrelevant to consider the aspects of car windows for a specific car, unless the factory wants to check a specific window against design parameters (anomaly detection). \nOn the other hand, in an antiques context, the individual aspects for a specific piece of furniture are a major focus of attention, and may constitute the actual added value, because the design parameters for old furniture are often not fixed, and may not be viewed as 'anomalies'.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Quality".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Quality".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasConstituent".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Quality".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasRegion".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isQualityOf".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Region,
      comment: "Any region in a dimensional space (a dimensional space is a maximal Region), which can be used as a value for a quality of an Entity . For example, TimeInterval, SpaceRegion, PhysicalAttribute, Amount, SocialAttribute are all subclasses of Region. \nRegions are not data values in the ordinary knowledge representation sense; in order to get patterns for modelling data, see the properties: representsDataValue and hasDataValue".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Region".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Abstract".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasConstituent".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#overlaps".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#precedes".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Relation,
      comment: "Relations are descriptions that can be considered as the counterpart of formal relations (that are included in the FormalEntity class).\nFor example, 'givingGrantToInstitution(x,y,z)' with three argument types: Provider(x),Grant(y),Recipient(z), can have a Relation counterpart: 'GivingGrantToInstitution', which defines three Concept instances: Provider,Grant,Recipient.\nSince social objects are not formal entities, Relation includes here any 'relation-like' entity in common sense, including social relations.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Relation".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Right,
      comment: "A legal position by which an Agent is entitled to obtain something from another Agent , under specified circumstances, through an enforcement explicited either in a Law, Contract , etc.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Right".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze, term(
          minCardinality: "1".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#definesTask".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          minCardinality: "2".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#definesRole".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Role,
      comment: "A Concept that classifies an Object".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Role".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#classifies".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Set,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: ["Insieme {it}".freeze, "Set".freeze],
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#FormalEntity".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Situation,
      comment: "A view, consistent with ('satisfying') a Description, on a set of entities. \nIt can also be seen as a 'relational context' created by an observer on the basis of a 'frame' (i.e. a Description). \nFor example, a PlanExecution is a context including some actions executed by agents according to certain parameters and expected tasks to be achieved from a Plan; a DiagnosedSituation is a context of observed entities that is interpreted on the basis of a Diagnosis, etc.\nSituation is also able to represent reified n-ary relations, where isSettingFor is the top-level relation for all binary projections of the n-ary relation. \nIf used in a transformation pattern for n-ary relations, the designer should take care of adding (some or all) OWL2 keys, corresponding to binary projections of the n-ary, to a subclass of Situation. Otherwise the 'identification constraint' (Calvanese et al., IJCAI 2001) might be violated.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Situation".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#satisfies".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SocialAgent,
      comment: "Any individual whose existence is granted simply by its social communicability and capability of action (through some PhysicalAgent).".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Social agent".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#actsThrough".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalAgent".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SocialObject,
      comment: "Any Object that exists only within some communication Event, in which at least one PhysicalObject participates in. \nIn other words, all objects that have been or are created in the process of social communication: for the sake of communication (InformationObject), for incorporating new individuals (SocialAgent, Place), for contextualizing or intepreting existing entities (Description, Concept), or for collecting existing entities (Collection).\nBeing dependent on communication, all social objects need to be expressed by some information object (information objects are self-expressing).".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Social object".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isExpressedBy".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SocialObjectAttribute,
      comment: "Any Region in a dimensional space that is used to represent some characteristic of a SocialObject, e.g. judgment values, social scalars, statistical attributes over a collection of entities, etc.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Social attribute".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRegionFor".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SocialPerson,
      comment: "A SocialAgent that needs the existence of a specific NaturalPerson in order to act (but the lifetime of the NaturalPerson has only to overlap that of the SocialPerson).".freeze,
      "http://www.w3.org/2002/07/owl#versionInfo": "Formerly: Person (changed to avoid confusion with commonsense intuition)".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Social person".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Person".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze, term(
          cardinality: "1".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#actsThrough".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SocialRelation,
      comment: "Any social relationship".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Social relation".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Relation".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SpaceRegion,
      comment: "Any Region in a dimensional space that is used to localize an Entity ; i.e., it is not used to represent some characteristic (e.g. it excludes time intervals, colors, size values, judgment values, etc.). Differently from a Place , a space region has a specific dimensional space.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Space region".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SpatioTemporalRegion,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasConstituent".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SpaceRegion".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasConstituent".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Substance,
      comment: "Any PhysicalBody that has not necessarily specified (designed) boundaries, e.g. a pile of trash, some sand, etc. \nIn this sense, an artistic object made of trash or a dose of medicine in the form of a pill would be a FunctionalSubstance, and a DesignedArtifact, since its boundaries are specified by a Design; aleatoric objects that are outcomes of an artistic process might be still considered DesignedArtifact(s), and Substance(s).".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Substance".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#PhysicalBody".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Task,
      comment: "An EventType that classifies an Action to be executed. \nFor example, reaching a destination is a task that can be executed by performing certain actions, e.g. driving a car, buying a train ticket, etc. \nThe actions to execute a task can also be organized according to a Plan that is not the same as the one that defines the task (if any). \nFor example, reaching a destination could be defined by a plan to get on holidays, while the plan to execute the task can consist of putting some travels into a sequence.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Task".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#EventType".freeze, term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Action".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isExecutedIn".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isTaskDefinedIn".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isTaskOf".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          allValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Task".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Theory,
      comment: "A Theory is a Description that represents a set of assumptions for describing something, usually general. Scientific, philosophical, and commonsense theories can be included here.\nThis class can also be used to act as 'naturalized reifications' of logical theories (of course, they will be necessarily incomplete in this case, because second-order entities are represented as first-order ones).".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Theory".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasComponent".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Relation".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :TimeIndexedRelation,
      comment: "A Situation that includes a time indexing in its setting, so allowing to order any binary relation (property) with time.".freeze,
      equivalentClass: term(
          intersectionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze, term(
            onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
            someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      "http://purl.org/dc/elements/1.1/creator": "Aldo Gangemi".freeze,
      "http://purl.org/dc/elements/1.1/date": "2021-02-24T14:24:23Z".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :TimeInterval,
      comment: "Any Region in a dimensional space that aims at representing time.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Time interval".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Transition,
      comment: "A transition is a Situation that creates a context for three TimeInterval(s), two additional different Situation(s), one Event, one Process, and at least one Object: the Event is observed as the cause for the transition, one Situation is the state before the transition, the second Situation is the state after the transition, the Process is the invariance under some different transitions (including the one represented here), in which at least one Object is situated. Finally, the time intervals position the situations and the transitional event in time.\nThis class of situations partly encodes the ontology underlying typical engineering algebras for processes, e.g. Petri Nets. \nA full representation of the transition ontology is outside the expressivity of OWL, because we would need qualified cardinality restrictions,  coreference, property equivalence, and property composition.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Transition".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze, term(
          "http://www.w3.org/2002/07/owl#minQualifiedCardinality": "2".freeze,
          "http://www.w3.org/2002/07/owl#onClass": "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          "http://www.w3.org/2002/07/owl#minQualifiedCardinality": "3".freeze,
          "http://www.w3.org/2002/07/owl#onClass": "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesTime".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesEvent".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesObject".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Process".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
          someValuesFrom: term(
            intersectionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze, term(
              onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#precedes".freeze,
              someValuesFrom: term(
                intersectionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, term(
                  onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#precedes".freeze,
                  someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
                  type: "http://www.w3.org/2002/07/owl#Restriction".freeze
                )),
                type: "http://www.w3.org/2002/07/owl#Class".freeze
              ).freeze,
              type: "http://www.w3.org/2002/07/owl#Restriction".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :TypeCollection,
      comment: "A Collection whose members are the maximal set of individuals that share the same (named) type, e.g. \"the gem stones\", \"the Italians\".\nThis class is very useful to apply a variety of the so-called \"ClassesAsValues\" design pattern, when it is used to talk about the extensional aspect of a class. An alternative variety of the pattern applies to the intensional aspect of a class, and the class Concept should be used instead.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Type collection".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :UnitOfMeasure,
      comment: "Units of measure are conceptualized here as parameters on regions, which can be valued as datatype values.".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Unit of measure".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#parametrizes".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Workflow,
      comment: "A Plan that defines Role(s), Task(s), and a specific structure for tasks to be executed, usually supporting the work of an Organization".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Workflow".freeze,
      subClassOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Plan".freeze, term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#definesRole".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#definesTask".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Task".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :WorkflowExecution,
      equivalentClass: term(
          onProperty: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#satisfies".freeze,
          someValuesFrom: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Workflow".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ),
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "Workflow execution".freeze,
      subClassOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze

    # Property definitions
    property :actsFor,
      comment: "The relation holding between any Agent, and a SocialAgent. In principle, a SocialAgent requires at least one PhysicalAgent in order to act, but this dependency can be 'delegated'; e.g. a university can be acted for by a department, which on its turm is acted for by physical agents.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#actsThrough".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "acts for".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :actsThrough,
      comment: "The relation holding between a PhysicalAgent and a SocialAgent. In principle, a SocialAgent requires at least one PhysicalAgent in order to act, but this dependency can be 'delegated', e.g. a university can be acted for by a department, which is acted for by physical agents. AKA isActedBy".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "acts through".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :associatedWith,
      comment: "A catch-all object property, useful for alignment and querying purposes.\nIt is declared as both transitive and symmetric, in order to reason an a maximal closure of associations between individuals.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "associatedWith".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#SymmetricProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :characterizes,
      comment: "A relation between concepts and collections, where a Concept is said to characterize a Collection; it corresponds to a link between the (reified) intensional and extensional interpretations of a _proper subset of_ a (reified) class. This is different from covers, because it refers to an interpretation the entire reified class.\nE.g. the collection of vintage saxophones is characterized by the Concept 'manufactured by hand', while it gets covered by the Concept 'Saxophone' with the Parameter 'Vintage'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isCharacterizedBy".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "characterizes".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :classifies,
      comment: "A relation between a Concept and an Entity, e.g. the Role 'student' classifies a Person 'John'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isClassifiedBy".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "classifies".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :conceptualizes,
      comment: "A relation stating that an Agent is internally representing a SocialObject: situations, descriptions, concepts, etc. E.g., 'John believes in the conspiracy theory'; 'Niels Bohr created the solar-system metaphor for the atomic theory'; 'Jacques assumes all swans are white'; 'the task force members share the attack plan'.\nConceptualizations can be distinguished into different forms, primarily based on the type of SocialObject that is conceptualized. Descriptions and concepts can be 'assumed', situations can be 'believed' or 'known', plans can be 'adopted', etc. (see ontology: http://www.ontologydesignpatterns.org/ont/dul/Conceptualization.owl.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isConceptualizedBy".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "conceptualizes".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :concretelyExpresses,
      comment: "A relation between an InformationRealization and a Description, e.g. 'the printout of the Italian Constitution concretelyExpresses the Italian Constitution'. It should be supplied also with a rule stating that the InformationRealization realizes an InformationObject that expresses the Description".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationRealization".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isConcretelyExpressedBy".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "concretely expresses".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :coparticipatesWith,
      comment: "A relation between two objects participating in a same Event; e.g., 'Vitas and Jimmy are playing tennis'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
      "http://www.w3.org/2002/07/owl#propertyChainAxiom": list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isParticipantIn".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasParticipant".freeze),
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#coparticipatesWith".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "co-participates with".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#SymmetricProperty".freeze]
    property :covers,
      comment: "A relation between concepts and collections, where a Concept is said to cover a Collection; it corresponds to a link between the (reified) intensional and extensional interpretations of a (reified) class.\nE.g. the collection of vintage saxophones is covered by the Concept 'Saxophone' with the Parameter 'Vintage'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isCoveredBy".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "covers".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :defines,
      comment: "A relation between a Description and a Concept, e.g. a Workflow for a governmental Organization defines the Role 'officer', or 'the Italian Traffic Law defines the role Vehicle'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isDefinedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "defines".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#usesConcept".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :definesRole,
      comment: "A relation between a description and a role, e.g. the recipe for a cake defines the role 'ingredient'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRoleDefinedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "defines role".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#defines".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :definesTask,
      comment: "A relation between a description and a task, e.g. the recipe for a cake defines the task 'boil'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isTaskDefinedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "defines task".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Task".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#defines".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :describes,
      comment: "The relation between a Description and an Entity : a Description gives a unity to a Collection of parts (the components), or constituents, by assigning a Role to each of them in the context of a whole Object (the system).\nA same Entity can be given different descriptions, for example, an old cradle can be given a unifying Description based on the original aesthetic design, the functionality it was built for, or a new aesthetic functionality in which it can be used as a flower pot.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isDescribedBy".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "describes".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :directlyFollows,
      comment: "The intransitive follows relation. For example, Wednesday directly precedes Thursday. Directness of precedence depends on the designer conceptualization.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#directlyPrecedes".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "directly follows".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#follows".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :directlyPrecedes,
      comment: "The intransitive precedes relation. For example, Monday directly precedes Tuesday. Directness of precedence depends on the designer conceptualization.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "directly precedes".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#precedes".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :executesTask,
      comment: "A relation between an action and a task, e.g. 'putting some water in a pot and putting the pot on a fire until the water starts bubbling' executes the task 'boiling'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Action".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isExecutedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "executes task".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Task".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isClassifiedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :expands,
      comment: "A partial order relation that holds between descriptions. It represents the proper part relation between a description and another description featuring the same properties as the former, with at least one additional one.\nDescriptions can be expanded either by adding other descriptions as parts, or by refining concepts that are used by them. \nAn 'intention' to expand must be present (unless purely formal theories are considered, but even in this case a criterion of relevance is usually active).".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isExpandedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "expands".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToDescription".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :expresses,
      comment: ["A relation between an InformationObject and a 'meaning', generalized here as a 'SocialObject'. For example: 'A Beehive is a structure in which bees are kept, typically in the form of a dome or box.' (Oxford dictionary)'; 'the term Beehive expresses the concept Beehive in my apiculture ontology'.\nThe intuition for 'meaning' is intended to be very broad. A separate, large comment is included for those who want to investigate more on what kind of meaning can be represented in what form.".freeze, "This is a large comment field for those who want to investigate the different uses of the 'expresses' relation for modeling different approaches to meaning characterization and modeling.\nFor example, in all these cases, some aspect of meaning is involved:\n\n- Beehive means \"a structure in which bees are kept, typically in the form of a dome or box.\" (Oxford dictionary)\n- 'Beehive' is a synonym in noun synset 09218159 \"beehive|hive\" (WordNet)\n- 'the term Beehive can be interpreted as the fact of 'being a beehive', i.e. a relation that holds for concepts such as Bee, Honey, Hosting, etc.'\n- 'the text of Italian apiculture regulation expresses a rule by which beehives should be kept at least one kilometer away from inhabited areas'\n- 'the term Beehive expresses the concept Beehive'\n- ''Beehive' for apiculturists does not express the same meaning as for, say, fishermen'\n- 'Your meaning of 'Beautiful' does not seem to fit mine'\n- ''Beehive' is formally interpreted as the set of all beehives'\n- 'from the term 'Beehive', we can build a vector space of statistically significant cooccurring terms in the documents that contain it'\n- the lexeme 'Belly' expresses the role 'Body_Part' in the frame 'ObservableBodyParts' (FrameNet)\n\nAs the examples suggest, the 'meaning of meaning' is dependent on the background approach/theory that one assumes. One can hardly make a summary of the too many approaches and theories of meaning, therefore this relation is maybe the most controversial and difficult to explain; normally, in such cases it would be better to give up formalizing. \nHowever, the usefulness of having a 'semantic abstraction' in modeling information objects is so high (e.g. for the semantic web, interoperability, reengineering, etc.), that we accept this challenging task, although without taking any particular position in the debate. \nWe provide here some examples, which we want to generalize upon when using the 'expresses' relation to model semantic aspects of social reality.\n\nIn the most common approach, lexicographers that write dictionaries, glossaries, etc. assume that the meaning of a term is a paraphrase (or 'gloss', or 'definition'). \nAnother approach is provided by concept schemes like thesauri and lexicons, which assume that the meaning of a term is a 'concept', encoded as a 'lemma', 'synset', or 'descriptor'.\nStill another approach is that of psychologists and cognitive scientists, which often assume that the meaning of an information object is a concept encoded in the mind or cognitive system of an agent. \nA radically different approach is taken by social scientists and semioticians, who usually assume that meanings of an information object are spread across the communication practices in which members of a community use that object.\nAnother approach that tackles the distributed nature of meaning is assumed by geometrical models of semantics, which assume that the meaning of an InformationObject (e.g. a word) results from the set of informational contexts (e.g. within texts) in which that object is used similarly.\nThe logical approach to meaning is still different, since it assumes that the meaning of e.g. a term is equivalent to the set of individuals that the term can be applied to; for example, the meaning of 'Ali' is e.g. an individual person called Ali, the meaning of 'Airplane' is e.g. the set of airplanes, etc. \nFinally, an approach taken by structuralist linguistics and frame semantics is that a meaning is the relational context in which an information object can be applied; for example, a meaning of 'Airplane' is situated e.g. in the context ('frame') of passenger airline flights.\n\nThese different approaches are not necessarily conflicting, and they mostly talk about different aspects of so-called 'semantics'. They can be summarized and modelled within DOLCE-Ultralite as follows (notice that such list is far from exhaustive):\n\n(1) Informal meaning (as for linguistic or commonsense semantics: a distinction is assumed between (informal) meaning and reference; see isAbout for an alternative pattern on reference)\n\t- Paraphrase meaning (as for lexicographic semantics). Here it is modelled as the expresses relation between instances of InformationObject and different instances of InformationObject that act as 'paraphrases'\n\t- Conceptual meaning (as for 'concept scheme' semantics). Here it is modelled as the expresses relation between instances of InformationObject and instances of Concept\n\t- Relational meaning (as for frame semantics). Here it is modelled as the expresses relation between instances of InformationObject and instances of Description\n\t- Cognitive meaning (as for 'psychological' semantics). Here it is modelled as the expresses relation between any instance of InformationObject and any different instance of InformationObject that isRealizedBy a mental, cognitive or neural state (depending on which theory of mind is assumed). Such states can be considered here as instances of Process (occurring in the mind, cognitive system, or neural system of an agent)\n\t- Cultural meaning (as for 'social science' semantics). Here it is modelled as the expresses relation between instances of InformationObject and instances of SocialObject (institutions, cultural paradigms, norms, social practices, etc.)\n\t- Distributional meaning (as for geometrical models of meaning). Here it is modelled as the expresses relation between any instance of InformationObject and any different instance of InformationObject that isFormallyRepresentedIn some (geometrical) Region (e.g. a vector space)\n\n(2) Formal meaning (as for logic and formal semantics: no distinction is assumed between informal meaning and reference, therefore between 'expresses' and 'isAbout', which can be used interchangeably)\n\t- Object-level formal meaning (as in the traditional first-order logic semantics). Here it is modelled as the expresses relation between an instance of InformationObject and an instance of Collection that isGroundingFor (in most cases) a Set; isGroundingFor is defined in the ontology: http://www.ontologydesignpatterns.org/ont/dul/IOLite.owl\n\t- Modal formal meaning (as in possible-world semantics). Here it is modelled as the expresses relation between an instance of InformationObject and an instance of Collection that isGroundingFor a Set, and which isPartOf some different instance of Collection that isGroundingFor a PossibleWorld\n\nThis is only a first step to provide a framework, in which one can model different aspects of meaning. A more developed ontology should approach the problem of integrating the different uses of 'expresses', so that different theories, resources, methods can interoperate.".freeze],
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isExpressedBy".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "expresses".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :expressesConcept,
      comment: "A relation between an InformationObject and a Concept , e.g. the term \"dog\" expresses the Concept \"dog\". For expressing a relational meaning, see the more general object property: expresses".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isConceptExpressedBy".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "expresses concept".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#expresses".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :farFrom,
      comment: "Generic distance relation between any Entity(s). E.g. Rome is far from Beijing, astronomy is far from necromancy.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#farFrom".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "far from".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#SymmetricProperty".freeze]
    property :follows,
      comment: "A relation between entities, expressing a 'sequence' schema. \nE.g. 'year 2000 follows 1999', 'preparing coffee' follows 'deciding what coffee to use', 'II World War follows I World War', etc. \nIt can be used between tasks, processes or time intervals, and subproperties would fit best in order to distinguish the different uses.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#precedes".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "follows".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :hasCommonBoundary,
      comment: "A relation to encode either formal or informal characterizations of 'boundaries' common to two different entities: an Event that ends when another begins, two abstract regions that have a common topological boundary, two objects that are said to be 'in contact' from a commonsense perspective, etc.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasCommonBoundary".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has common boundary".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#SymmetricProperty".freeze]
    property :hasComponent,
      comment: "The hasProperPart relation without transitivity, holding between an Object (the system) and another (the component), and assuming a Design that structures the Object.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isComponentOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has component".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasProperPart".freeze,
      type: ["http://www.w3.org/2002/07/owl#AsymmetricProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :hasConstituent,
      comment: "'Constituency' depends on some layering of  the world described by the ontology. For example, scientific granularities (e.g. body-organ-tissue-cell) or ontological 'strata' (e.g. social-mental-biological-physical) are  typical layerings. \nIntuitively, a constituent is a part belonging to a lower layer. Since layering is actually a partition of the world described by the ontology, constituents are not properly classified as parts, although this kinship can be intuitive for common sense.\nA desirable advantage of this distinction is that we are able to talk e.g. of physical constituents of non-physical objects (e.g. systems), while this is not possible in terms of parts.\nExample of are the persons constituting a social system, the molecules constituting a person, the atoms constituting a river, etc. \nIn all these examples, we notice a typical discontinuity between the constituted and the constituent object: e.g. a social system is conceptualized at a different layer from the persons that constitute it, a person is conceptualized at a different layer from the molecules that constitute them, and a river is conceptualized at a different layer from the atoms that constitute it.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isConstituentOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has constituent".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasConstraint,
      comment: "A relation between parameters and entities. It allows to assert generic constraints (encoded as parameters), e.g. MinimumAgeForDriving isConstraintFor John (where John is a legal subject under the TrafficLaw).\nThe intended semantics (not expressible in OWL) is that a Parameter isParameterFor a Concept that classifies an Entity; moreover, it entails that a Parameter parametrizes a Region that isRegionFor that Entity.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isConstraintFor".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has constraint".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isClassifiedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasDataValue,
      comment: "A datatype property that encodes values from a datatype for an Entity. \nThere are several ways to encode values in DOLCE (Ultralite):\n\n1) Directly assert an xsd:_ value to an Entity by using hasDataValue\n2) Assert a Region for an Entity by using hasRegion, and then assert an xsd:_ value to that Region, by using hasRegionDataValue\n3) Assert a Quality for an Entity by using hasQuality, then assert a Region for that Quality, and assert an xsd:_ value to that Region, by using hasRegionDataValue\n4) When the value is required, but not directly observed, assert a Parameter for an xsd:_ value by using hasParameterDataValue, and then associate the Parameter to an Entity by using isConstraintFor\n5) When the value is required, but not directly observed, you can also assert a Parameter for a Region by using parametrizes, and then assert an xsd:_ value to that Region, by using hasRegionDataValue\n\nThe five approaches obey different requirements. \nFor example, a simple value can be easily asserted by using pattern (1), but if one needs to assert an interval between two values, a Region should be introduced to materialize that interval, as pattern (2) suggests. \nFurthermore, if one needs to distinguish the individual Quality of a value, e.g. the particular nature of the density of a substance, pattern (3) can be used. \nPatterns (4) and (5) should be used instead when a constraint or a selection is modeled, independently from the actual observation of values in the real world.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has data value".freeze,
      type: "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze
    property :hasEventDate,
      comment: "A datatype property that encodes values from xsd:dateTime for an Event; a same Event can have more than one xsd:dateTime value: begin date, end date, date at which the interval holds, etc.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has event date".freeze,
      range: "http://www.w3.org/2001/XMLSchema#dateTime".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasDataValue".freeze,
      type: "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze
    property :hasIntervalDate,
      comment: "A datatype property that encodes values from xsd:dateTime for a TimeInterval; a same TimeInterval can have more than one xsd:dateTime value: begin date, end date, date at which the interval holds, etc.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has interval date".freeze,
      range: "http://www.w3.org/2001/XMLSchema#dateTime".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasRegionDataValue".freeze,
      type: "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze
    property :hasLocation,
      comment: "A generic, relative spatial location, holding between any entities. E.g. 'the cat is on the mat', 'Omar is in Samarcanda', 'the wound is close to the femural artery'.\nFor 'absolute' locations, see SpaceRegion".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isLocationOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has location".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasMember,
      comment: "A relation between collections and entities, e.g. 'my collection of saxophones includes an old Adolphe Sax original alto' (i.e. my collection has member an Adolphe Sax alto).".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isMemberOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has member".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasParameter,
      comment: "A Concept can have a Parameter that constrains the attributes that a classified Entity can have in a certain Situation, e.g. a 4WheelDriver Role definedIn the ItalianTrafficLaw has a MinimumAge parameter on the Amount 16.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isParameterFor".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has parameter".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToConcept".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasParameterDataValue,
      comment: "Parametrizes values from a datatype. For example, a Parameter MinimumAgeForDriving hasParameterDataValue 18 on datatype xsd:int, in the Italian traffic code. In this example, MinimumAgeForDriving isDefinedIn the Norm ItalianTrafficCodeAgeDriving.\nMore complex parametrization requires workarounds. E.g. AgeRangeForDrugUsage could parametrize data value: 14 to 50 on the datatype: xsd:int. Since complex datatypes are not allowed in OWL1.0, a solution to this can only work by creating two 'sub-parameters': MinimumAgeForDrugUsage (that hasParameterDataValue 14) and MaximumAgeForDrugUsage (that hasParameterDataValue 50), which are components of (cf. hasComponent) the main Parameter AgeRangeForDrugUsage.\nOrdering on subparameters can be created by using or specializing the object property 'precedes'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has parameter data value".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasDataValue".freeze,
      type: "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze
    property :hasPart,
      comment: "A schematic relation between any entities, e.g. 'the human body has a brain as part', '20th century contains year 1923', 'World War II includes the Pearl Harbour event'.\n\nParthood should assume the basic properties of mereology: transitivity, antisymmetry, and reflexivity (propert Parthood of course misses reflexivity). \nHowever, antisymmetry is not supported in OWL2 explicitly, therefore DUL has to adopt one of two patterns:\n1) dropping asymmetry axioms, while granting reflexivity: this means that symmetry is not enforced, but permitted for the case of reflexivity. Of course, in this way we cannot prevent symmetric usages of hasPart;\n2) dropping the reflexivity axiom, and enforce asymmetry: in this case, we would prevent all symmetric usages, but we loose the possibility of enforcing reflexivity, which is commonsensical in parthood.\nIn DUL, we adopt pattern #1 for partOf, and pattern #2 for properPartOf, which seems a good approximation: due to the lack of inheritance of property characteristics, each asymmetric hasPropertPart assertion would also be a reflexive hasPart assertion (reflexive reduction design pattern).\n\nSubproperties and restrictions can be used to specialize hasPart for objects, events, etc.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      "http://www.w3.org/2002/07/owl#propertyChainAxiom": list(term(
          inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesWhole".freeze
        ), "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesPart".freeze),
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isPartOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has part".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#ReflexiveProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :hasParticipant,
      comment: "A relation between an object and a process, e.g. 'John took part in the discussion', 'a large mass of snow fell during the avalanche', or 'a cook, some sugar, flour, etc. are all present in the cooking of a cake'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isParticipantIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has participant".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasPostcondition,
      comment: "Direct succession applied to situations. \nE.g., 'A postcondition of our Plan is to have things settled'.".freeze,
      domain: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze)
        ),
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isPostconditionOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has postcondition".freeze,
      range: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze)
        ),
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#directlyPrecedes".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasPrecondition,
      comment: "Direct precedence applied to situations. \nE.g., 'A precondition to declare war against a foreign country is claiming to find nuclear weapons in it'.".freeze,
      domain: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze)
        ),
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isPreconditionOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has precondition".freeze,
      range: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze)
        ),
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#directlyFollows".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasProperPart,
      comment: "Asymmetric (so including irreflexive) parthood.".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isPropertPartOf".freeze,
      label: "has proper part".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasPart".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :hasQuality,
      comment: "A relation between entities and qualities, e.g. 'Dmitri's skin is yellowish'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isQualityOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has quality".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Quality".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasRegion,
      comment: "A relation between entities and regions, e.g. 'the number of wheels of that truck is 12', 'the time of the experiment is August 9th, 2004', 'the whale has been localized at 34 degrees E, 20 degrees S'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRegionFor".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has region".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasRegionDataValue,
      comment: "A datatype property that encodes values for a Region, e.g. a float for the Region Height.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has region data value".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasDataValue".freeze,
      type: "http://www.w3.org/2002/07/owl#DatatypeProperty".freeze
    property :hasRole,
      comment: "A relation between an object and a role, e.g. the person 'John' has role 'student'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRoleOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has role".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isClassifiedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasSetting,
      comment: "A relation between entities and situations, e.g. 'this morning I've prepared my coffee with a new fantastic Arabica', i.e.: (an amount of) a new fantastic Arabica hasSetting the preparation of my coffee this morning.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has setting".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasTask,
      comment: "A relation between roles and tasks, e.g. 'students have the duty of giving exams' (i.e. the Role 'student' hasTask the Task 'giving exams').".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isTaskOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has task".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Task".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToConcept".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :hasTimeInterval,
      comment: "The generic relation between events and time intervals.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isTimeIntervalOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "has time interval".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasRegion".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :includesAction,
      comment: "A relation between situations and actions, e.g. 'this morning I've prepared my coffee and had my fingers burnt' (i.e.: the preparation of my coffee this morning included a burning of my fingers).".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isActionIncludedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "includes action".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Action".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesEvent".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :includesAgent,
      comment: "A relation between situations and persons, e.g. 'this morning I've prepared my coffee and had my fingers burnt' (i.e.: the preparation of my coffee this morning included me).".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isAgentIncludedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "includes agent".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#includesObject".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :includesEvent,
      comment: "A relation between situations and events, e.g. 'this morning I've prepared my coffee and had my fingers burnt' (i.e.: the preparation of my coffee this morning included a burning of my fingers).".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isEventIncludedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "includes event".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :includesObject,
      comment: "A relation between situations and objects, e.g. 'this morning I've prepared my coffee and had my fingers burnt' (i.e.: the preparation of my coffee this morning included me).".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isObjectIncludedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "includes object".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :includesPart,
      "http://purl.org/dc/elements/1.1/creator": "Aldo Gangemi".freeze,
      "http://purl.org/dc/elements/1.1/date": "2021-04-03T14:11:09Z".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :includesTime,
      comment: "A relation between situations and time intervals, e.g. 'this morning I've prepared my coffee and had my fingers burnt' (i.e.: preparing my coffee was held this morning). A data value attached to the time interval typically complements this modelling pattern.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isTimeIncludedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "includes time".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :includesWhole,
      "http://purl.org/dc/elements/1.1/creator": "Aldo Gangemi".freeze,
      "http://purl.org/dc/elements/1.1/date": "2021-04-03T14:11:01Z".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :introduces,
      comment: "A relation between a Description and a SocialAgent, e.g. a Constitutional Charter introduces the SocialAgent 'PresidentOfRepublic'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isIntroducedBy".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "introduces".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :involvesAgent,
      comment: "Agent participation.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isAgentInvolvedIn".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "involves agent".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasParticipant".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isAbout,
      comment: "A relation between an information object and an Entity (including information objects). It can be used to talk about entities that are references of proper nouns: the proper noun 'Leonardo da Vinci' isAbout the Person Leonardo da Vinci; as well as to talk about sets of entities that can be described by a common noun: the common noun 'person' isAbout the set of all persons in a domain of discourse, which can be represented in DOLCE-Ultralite as an individual of the class: dul:Collection.\nA specific sentence may use common nouns with either a singular or plural reference, or it can even refer to all possible references (e.g. in a lexicographic definition): all those uses are kinds of aboutness.\n\nThe isAbout relation is sometimes considered as reflexive, however this is semiotically inaccurate, because information can be about itself ('de dicto' usage, as in 'John is four character long'), but it is typically about something else ('de re' usage, as in 'John loves Mary').\nIf a reflexivity exists in general, it rather concerns its realisation, which is always associated with an event, e.g. an utterance, which makes the information denoting itself, besides its aboutness. This is implemented in DUL with the dul:realizesSelfInformation property, which is used with local reflexivity in the dul:InformationRealization class.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isReferenceOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is about".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isActionIncludedIn,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Action".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is action included in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isEventIncludedIn".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isAgentIncludedIn,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is agent included in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isObjectIncludedIn".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isAgentInvolvedIn,
      comment: "Agent participation.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is agent involved in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isParticipantIn".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isCharacterizedBy,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: ["is characterized by {@en-us}".freeze, "is characterized by".freeze],
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isClassifiedBy,
      comment: "A relation between a Concept and an Entity, e.g. 'John is considered a typical rude man'; your last concert constitutes the achievement of a lifetime; '20-year-old means she's mature enough'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is classified by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isComponentOf,
      comment: "The asymmetric isProperPartOf relation without transitivity, holding between an Object (the system) and another (the component), and assuming a Design that structures the Object.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is component of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isPropertPartOf".freeze,
      type: ["http://www.w3.org/2002/07/owl#AsymmetricProperty".freeze, "http://www.w3.org/2002/07/owl#ObjectProperty".freeze]
    property :isConceptExpressedBy,
      comment: "A relation between an InformationObject and a Concept , e.g. the term \"dog\" expresses the Concept \"dog\". For expressing a relational meaning, see the more general object property: expresses".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is concept expressed by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isExpressedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isConceptUsedIn,
      comment: "A more generic relation holding between a Description and a Concept. In order to be used, a Concept must be previously definedIn another Description".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#usesConcept".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is concept used in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isConceptualizedBy,
      comment: "A relation stating that an Agent is internally representing a Description . E.g., 'John believes in the conspiracy theory'; 'Niels Bohr created a solar-system metaphor for his atomic theory'; 'Jacques assumes all swans are white'; 'the task force shares the attack plan'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is conceptualized by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Agent".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isConcretelyExpressedBy,
      comment: "A relation between an InformationRealization and a Description, e.g. 'the printout of the Italian Constitution concretelyExpresses the Italian Constitution'. It should be supplied also with a rule stating that the InformationRealization realizes an InformationObject that expresses the Description".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is concretely expressed by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationRealization".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isConstituentOf,
      comment: "'Constituency' depends on some layering of  the world described by the ontology. For example, scientific granularities (e.g. body-organ-tissue-cell) or ontological 'strata' (e.g. social-mental-biological-physical) are  typical layerings. \nIntuitively, a constituent is a part belonging to a lower layer. Since layering is actually a partition of the world described by the ontology, constituents are not properly classified as parts, although this kinship can be intuitive for common sense.\nA desirable advantage of this distinction is that we are able to talk e.g. of physical constituents of non-physical objects (e.g. systems), while this is not possible in terms of parts.\nExample of are the persons constituting a social system, the molecules constituting a person, the atoms constituting a river, etc. \nIn all these examples, we notice a typical discontinuity between the constituted and the constituent object: e.g. a social system is conceptualized at a different layer from the persons that constitute it, a person is conceptualized at a different layer from the molecules that constitute them, and a river is conceptualized at a different layer from the atoms that constitute it.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is constituent of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isConstraintFor,
      comment: "A relation between parameters and entities. It allows to assert generic constraints (encoded as parameters), e.g. MinimumAgeForDriving isConstraintFor John (where John is a legal subject under the TrafficLaw).\nThe intended semantics (not expressible in OWL) is that a Parameter isConstraintFor and Entity if the Parameter isParameterFor a Concept that classifies that Entity; moreover, it entails that a Parameter parametrizes a Region that isRegionFor that Entity. The use in OWL is therefore a shortcut to annotate what Parameter constrains what Entity".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is constraint for".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#classifies".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isCoveredBy,
      comment: "A relation between concepts and collections, where a Concept is said to cover a Collection; it corresponds to a link between the (reified) intensional and extensional interpretations of a (reified) class.\nE.g. the collection of vintage saxophones is covered by the Concept 'Saxophone' with the Parameter 'Vintage'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is covered by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isDefinedIn,
      comment: "A relation between a Description and a Concept, e.g. a Workflow for a governmental Organization defines the Role 'officer', or 'the Italian Traffic Law defines the role Vehicle'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is defined in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isConceptUsedIn".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isDescribedBy,
      comment: "The relation between an Entity and a Description: a Description gives a unity to a Collection of parts (the components), or constituents, by assigning a Role to each of them in the context of a whole Object (the system).\nA same Entity can be given different descriptions, for example, an old cradle can be given a unifying Description based on the original aesthetic design, the functionality it was built for, or a new aesthetic functionality in which it can be used as a flower pot.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is described by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isEventIncludedIn,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is event included in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasSetting".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isExecutedIn,
      comment: "A relation between an action and a task, e.g. 'putting some water in a pot and putting the pot on a fire until the water starts bubbling' executes the task 'boiling'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Task".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is executed in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Action".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#classifies".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isExpandedIn,
      comment: "A partial order relation that holds between descriptions. It represents the proper part relation between a description and another description featuring the same properties as the former, with at least one additional one.\nDescriptions can be expanded either by adding other descriptions as parts, or by refining concepts that are used by them. \nAn 'intention' to expand must be present (unless purely formal theories are considered, but even in this case a criterion of relevance is usually active).".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is expanded in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToDescription".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isExpressedBy,
      comment: "A relation between a dul:SocialObject (the 'meaning') and a dul:InformationObject (the 'expression'). \nFor example: 'A Beehive is a structure in which bees are kept, typically in the form of a dome or box.' (Oxford dictionary)'; 'the term Beehive expresses the concept Beehive in my apiculture ontology'.\nThe intuition for 'meaning' is intended to be very broad. A separate, large comment is included in the encoding of 'expresses', for those who want to investigate more on what kind of meaning can be represented in what form.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is expressed by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isIntroducedBy,
      comment: "A relation between a Description and a SocialAgent, e.g. a Constitutional Charter introduces the SocialAgent 'PresidentOfRepublic'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialAgent".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is introduced by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isLocationOf,
      comment: "A generic, relative localization, holding between any entities. E.g. 'Rome is the seat of the Pope', 'the liver is the location of the tumor'.\nFor 'absolute' locations, see SpaceRegion".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is location of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isMemberOf,
      comment: "A relation between collections and entities, e.g. 'the Night Watch by Rembrandt is in the Rijksmuseum collection'; 'Davide is member of the Pen Club', 'Igor is one the subjects chosen for the experiment'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is member of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isObjectIncludedIn,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is object included in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasSetting".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isObservableAt,
      comment: "A relation to represent a (past, present or future) TimeInterval at which an Entity is observable.\nIn order to encode a specific time, a data value should be related to the TimeInterval. \nAn alternative way of representing time is the datatype property: hasIntervalDate".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isTimeOfObservationOf".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is observable at".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasRegion".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isParameterFor,
      comment: "A Concept can have a Parameter that constrains the attributes that a classified Entity can have in a certain Situation, e.g. a 4WheelDriver Role definedIn the ItalianTrafficLaw has a MinimumAge parameter on the Amount 16.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is parameter for".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToConcept".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isParametrizedBy,
      comment: "The relation between a Parameter, e.g. 'MajorAge', and a Region, e.g. '>17 year'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#parametrizes".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is parametrized by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isClassifiedBy".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isPartOf,
      comment: "A relation between any entities, e.g. 'brain is a part of the human body'. See dul:hasPart for additional documentation.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is part of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#ReflexiveProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :isParticipantIn,
      comment: "A relation between an object and a process, e.g. 'John took part in the discussion', 'a large mass of snow fell during the avalanche', or 'a cook, some sugar, flour, etc. are all present in the cooking of a cake'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is participant in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isPostconditionOf,
      comment: "Direct succession applied to situations. \nE.g., 'Taking some rest is a postcondition of my search for a hotel'.".freeze,
      domain: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze)
        ),
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is postcondition of".freeze,
      range: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze)
        ),
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#directlyFollows".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isPreconditionOf,
      comment: "Direct precedence applied to situations. \nE.g., 'claiming to find nuclear weapons in a foreign country is a precondition to declare war against it'.".freeze,
      domain: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze)
        ),
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is precondition of".freeze,
      range: term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze)
        ),
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#directlyPrecedes".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isPropertPartOf,
      comment: "See dul:hasProperPart for additional documentation.".freeze,
      label: "is propert part of".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isPartOf".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :isQualityOf,
      comment: "A relation between entities and qualities, e.g. 'Dmitri's skin is yellowish'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Quality".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is quality of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isRealizedBy,
      comment: "A relation between an information realization and an information object, e.g. the paper copy of the Italian Constitution realizes the text of the Constitution.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#realizes".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is realized by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationRealization".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isReferenceOf,
      comment: "A relation between information objects and any Entity (including information objects). It can be used to talk about e.g. entities are references of proper nouns: the proper noun 'Leonardo da Vinci' isAbout the Person Leonardo da Vinci; as well as to talk about sets of entities that can be described by a common noun: the common noun 'person' isAbout the set of all persons in a domain of discourse, which can be represented in DOLCE-Ultralite as an individual of the class: Collection .\nThe isReferenceOf relation is irreflexive, differently from its inverse isAbout.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is reference of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isReferenceOfInformationRealizedBy,
      comment: "The relation between entities and information realizations, e.g. between Italy and a paper copy of the text of the Italian Constitution.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#realizesInformationAbout".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is reference of information realized by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationRealization".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isRegionFor,
      comment: "A relation between entities and regions, e.g. 'the color of my car is red'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is region for".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isRelatedToConcept,
      comment: "Any relation between concepts, e.g. superordinated, conceptual parthood, having a parameter, having a task, superordination, etc.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToConcept".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is related to concept".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#SymmetricProperty".freeze]
    property :isRelatedToDescription,
      comment: "Any relation between descriptions.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToDescription".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is related to description".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#SymmetricProperty".freeze]
    property :isRoleDefinedIn,
      comment: "A relation between a description and a role, e.g. the role 'Ingredient' is defined in the recipe for a cake.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is role defined in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isDefinedIn".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isRoleOf,
      comment: "A relation between an object and a role, e.g. 'student' is the role of 'John'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is role of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Object".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#classifies".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isSatisfiedBy,
      comment: "A relation between a Situation and a Description, e.g. the execution of a Plan satisfies that plan.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#satisfies".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is satisfied by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isSettingFor,
      comment: "A relation between situations and entities, e.g. 'this morning I've prepared my coffee with a new fantastic Arabica', i.e.: the preparation of my coffee this morning is the setting for (an amount of) a new fantastic Arabica.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is setting for".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isSpecializedBy,
      comment: "A partial order relation that holds between social objects. It represents the subsumption relation between e.g. a Concept and another Concept that is broader in extensional interpretation, but narrowe in intensional interpretation.\nE.g. PhDStudent Role specializes Student Role".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#specializes".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is specialized by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :isSubordinatedTo,
      comment: "Direct succession applied to concepts. E.g. the role 'Officer' is subordinated to 'Director'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSuperordinatedTo".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is subordinated to".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#directlyFollows".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToConcept".freeze],
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isSuperordinatedTo,
      comment: "Direct precedence applied to concepts. E.g. the role 'Executive' is superordinated to 'DepartmentManager'.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is superordinated to".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: ["http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#directlyPrecedes".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToConcept".freeze],
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isTaskDefinedIn,
      comment: "A relation between a description and a task, e.g. the task 'boil' is defined in a recipe for a cake.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Task".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is task defined in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isDefinedIn".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isTaskOf,
      comment: "A relation between roles and tasks, e.g. 'students have the duty of giving exams' (i.e. the Role 'student' hasTask the Task 'giving exams').".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Task".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is task of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Role".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRelatedToConcept".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isTimeIncludedIn,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is time included in".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasSetting".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isTimeIntervalOf,
      comment: "The generic relation between time intervals and events.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is time interval of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRegionFor".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isTimeOfObservationOf,
      comment: "A relation to represent a (past, present or future) TimeInterval at which an Entity is observable.\nIn order to encode a specific time, a data value should be related to the TimeInterval. \nAn alternative way of representing time is the datatype property: hasIntervalDate".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#TimeInterval".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is time of observation of".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isRegionFor".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :isUnifiedBy,
      comment: "A Collection has a unification criterion, provided by a Description; for example, a community of practice can be unified by a shared theory or interest, e.g. the community that makes research on mirror neurons shares some core knowledge about mirror neurons, which can be represented as a Description MirrorNeuronTheory that unifies the community. There can be several unifying descriptions.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#unifies".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is unified by".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :nearTo,
      comment: "Generic distance relation between any Entity(s). E.g. Rome is near to Florence, astronomy is near to physics.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#nearTo".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "near to".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#SymmetricProperty".freeze]
    property :overlaps,
      comment: "A schematic relation between any entities, e.g. 'the chest region overlaps with the abdomen region', 'my spoken words overlap with hers', 'the time of my leave overlaps with the time of your arrival', 'fibromyalgia overlaps with other conditions'.\nSubproperties and restrictions can be used to specialize overlaps for objects, events, time intervals, etc.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#overlaps".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "overlaps".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#SymmetricProperty".freeze]
    property :parametrizes,
      comment: "The relation between a Parameter, e.g. 'MajorAgeLimit', and a Region, e.g. '18_year'.\nFor a more data-oriented relation, see hasDataValue".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Parameter".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "parametrizes".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Region".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#classifies".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :precedes,
      comment: "A relation between entities, expressing a 'sequence' schema. \nE.g. 'year 1999 precedes 2000', 'deciding what coffee to use' precedes 'preparing coffee', 'World War II follows World War I', 'in the Milan to Rome autoroute, Bologna precedes Florence', etc.\nIt can then be used between tasks, processes, time intervals, spatially locate objects, situations, etc. \nSubproperties can be defined in order to distinguish the different uses.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "precedes".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :realizes,
      comment: "A relation between an information realization and an information object, e.g. the paper copy of the Italian Constitution realizes the text of the Constitution.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationRealization".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "realizes".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationObject".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :realizesInformationAbout,
      comment: "The relation between entities and information realizations, e.g. between Italy and a paper copy of the text of the Italian Constitution.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#InformationRealization".freeze,
      "http://www.w3.org/2002/07/owl#propertyChainAxiom": list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#realizes".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isAbout".freeze),
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "realizes information about".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :realizesSelfInformation,
      comment: "This relation is a workaround to enable local reflexivity axioms (Self) working with non-simple properties; in this case, dul:realizesInformation About.".freeze,
      "http://purl.org/dc/elements/1.1/creator": "Aldo Gangemi".freeze,
      "http://purl.org/dc/elements/1.1/date": "2021-04-05T22:31:22Z".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#realizesInformationAbout".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :sameSettingAs,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      "http://www.w3.org/2002/07/owl#propertyChainAxiom": list("http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#hasSetting".freeze, "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#isSettingFor".freeze),
      inverseOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#sameSettingAs".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "is in the same setting as".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Entity".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#SymmetricProperty".freeze]
    property :satisfies,
      comment: "A relation between a Situation and a Description, e.g. the execution of a Plan satisfies that plan.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Situation".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "satisfies".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :specializes,
      comment: "A partial order relation that holds between social objects. \nIt mainly represents the subsumption relation between e.g. a Concept or Description and another Concept (resp. Description) that is broader in extensional interpretation, but narrower in intensional interpretation. For example, the role PhDStudent specializes the role Student.\nAnother possible use is between a Collection that isCoveredBy a Concept A, and another Collection that isCoveredBy a Concept B that on its turm specializes A. For example, the 70,000 series Selmer Mark VI saxophone Collection specializes the Selmer Mark VI saxophone Collection.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "specializes".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#SocialObject".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: ["http://www.w3.org/2002/07/owl#ObjectProperty".freeze, "http://www.w3.org/2002/07/owl#TransitiveProperty".freeze]
    property :unifies,
      comment: "A Collection has a unification criterion, provided by a Description; for example, a community of practice can be unified by a shared theory or interest, e.g. the community that makes research on mirror neurons shares some core knowledge about mirror neurons, which can be represented as a Description MirrorNeuronTheory that unifies the community. There can be several unifying descriptions.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "unifies".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Collection".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
    property :usesConcept,
      comment: "A generic relation holding between a Description and a Concept. In order to be used, a Concept must be previously definedIn another Description. This last condition cannot be encoded for object properties in OWL.".freeze,
      domain: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Description".freeze,
      isDefinedBy: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl".freeze,
      label: "uses concept".freeze,
      range: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Concept".freeze,
      subPropertyOf: "http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#associatedWith".freeze,
      type: "http://www.w3.org/2002/07/owl#ObjectProperty".freeze
  end
end
