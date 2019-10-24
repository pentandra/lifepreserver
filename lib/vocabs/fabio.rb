# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/spar/fabio/
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/spar/fabio/>
  #   class FABIO < RDF::StrictVocabulary
  #   end
  class FABIO < RDF::StrictVocabulary("http://purl.org/spar/fabio/")

    # Ontology definition
    ontology :"http://purl.org/spar/fabio/",
      comment: %(The FRBR-aligned Bibliographic Ontology \(FaBiO\) is an ontology for describing entities that are published or potentially publishable \(e.g., journal articles, conference papers, books\), and that contain or are referred to by bibliographic references.

**URL:** http://purl.org/spar/fabio

**Creators**: [David Shotton]\(http://orcid.org/0000-0001-5506-523X\), [Silvio Peroni]\(http://orcid.org/0000-0003-0530-4305\)

**Contributors:** [Paolo Ciccarese]\(https://orcid.org/0000-0002-5156-2703\), [Tim Clark]\(https://orcid.org/0000-0003-4060-7360\)

**License:** [Creative Commons Attribution 4.0 International]\(https://creativecommons.org/licenses/by/4.0/legalcode\)

**Website:** http://www.sparontologies.net/ontologies/fabio

**Cite as:** Peroni, S., Shotton, D. \(2012\). FaBiO and CiTO: ontologies for describing bibliographic resources and citations. In Journal of Web Semantics, 17: 33-43. https://doi.org/10.1016/j.websem.2012.08.001. Open Access at: http://speroni.web.cs.unibo.it/publications/peroni-2012-fabio-cito-ontologies.pdf).freeze,
      "dc11:contributor": ["Paolo Ciccarese".freeze, "Tim Clark".freeze],
      "dc11:creator": ["David Shotton".freeze, "Silvio Peroni".freeze],
      "dc11:date": "2019-02-19".freeze,
      "dc11:description": ["FaBiO, the FRBR-aligned Bibliographic Ontology, is an ontology for recording and publishing on the Semantic Web descriptions of entities that are published or potentially publishable, and that contain or are referred to by bibliographic references, or entities used to define such bibliographic references. FaBiO entities are primarily textual publications such as books, magazines, newspapers and journals, and items of their content such as poems, conference papers and editorials.  However, they also include blogs, web pages, datasets, computer algorithms, experimental protocols, formal specifications and vocabularies, legal records, governmental papers, technical and commercial reports and similar publications, and also anthologies, catalogues and similar collections. \n\nFaBiO classes are structured according to the FRBR schema of Works, Expressions, Manifestations and Items. Additional properties have been added to extends the FRBR data model by linking Works and Manifestations (fabio:hasManifestation and fabio:isManifestationOf), Works and Items (fabio:hasPortrayal and fabio:isPortrayedBy), and Expressions and Items  (fabio:hasRepresentation and fabio:isRepresentedBy).".freeze, "fabio:FRBR%20diagram%20with%20new%20Fabio%20verbs.png".freeze],
      "dc11:rights": "This work is distributed under a Creative Commons Attribution License (https://creativecommons.org/licenses/by/4.0/legalcode).".freeze,
      "dc11:title": "FaBiO, the FRBR-aligned Bibliographic Ontology".freeze,
      "http://purl.org/vocab/vann/preferredNamespacePrefix": "fabio".freeze,
      "http://purl.org/vocab/vann/preferredNamespaceUri": "http://purl.org/spar/fabio/".freeze,
      "owl:imports": "http://purl.org/spar/frbr".freeze,
      "owl:priorVersion": "fabio:2018-05-02".freeze,
      "owl:versionIRI": "fabio:2019-02-19".freeze,
      "owl:versionInfo": "2.1".freeze,
      type: "owl:Ontology".freeze

    # Class definitions
    term :Abstract,
      comment: %(A brief summary of a work on a particular subject, designed to act as the point-of-entry that will help the reader quickly to obtain an overview of the work's contents.   The abstract may be an integral part of the work itself, written by the same author\(s\) and appearing at the beginning of a work such as a research paper, report, review or thesis.  Alternatively it may be separate from the published work itself, and written by someone other than the author\(s\) of the published work, for example by a member of a professional abstracting service such as CAB Abstracts.).freeze,
      label: "abstract".freeze,
      "owl:disjointWith": "fabio:StructuredSummary".freeze,
      "rdfs:seeAlso": "fabio:StructuredSummary".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :AcademicProceedings,
      comment: %(A document containing the programme and collected papers, or their abstracts, presented at an academic meeting.).freeze,
      label: "academic proceedings".freeze,
      subClassOf: ["fabio:ExpressionCollection".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:ProceedingsPaper".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Addendum,
      comment: %(An item of material added at the end of a book or other publication, typically to include omitted or late-arriving material. ).freeze,
      label: "addendum".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :Algorithm,
      comment: %(A precise sequential set of pre-defined logical rules or computational operations to be employed for solving a particular problem in a finite number of steps.).freeze,
      label: "algorithm".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :AnalogItem,
      comment: %(A real object that is an exemplar of a fabio:Manifestation, such as a particular copy of the book 'Alice's adventures in Wonderland', that a person may own.).freeze,
      "dc11:description": "An analog item is an exemplar of an analog manifestation only and it is always stored in a storage medium suitable for analog objects, such as paper, vinyl discs and films.".freeze,
      label: "analog item".freeze,
      "owl:disjointWith": "fabio:DigitalItem".freeze,
      subClassOf: ["fabio:Item".freeze, term(
          onProperty: "fabio:isStoredOn".freeze,
          someValuesFrom: "fabio:AnalogStorageMedium".freeze,
          type: "owl:Restriction".freeze
        ), term(
          onProperty: "http://purl.org/vocab/frbr/core#exemplarOf".freeze,
          someValuesFrom: "fabio:AnalogManifestation".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :AnalogManifestation,
      comment: %(A manifestation in an analog form.).freeze,
      label: "analog manifestation".freeze,
      "owl:disjointWith": "fabio:DigitalManifestation".freeze,
      subClassOf: ["fabio:Manifestation".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#exemplar".freeze,
          someValuesFrom: "fabio:AnalogItem".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :AnalogStorageMedium,
      comment: %(A means of storing information in non-digital form, e.g. paper, film \(for analogue photographs or movies\), magnetic tape \(for analogue sound recordings or video recordings\) or vinyl disc.).freeze,
      label: "analog storage medium".freeze,
      subClassOf: ["fabio:StorageMedium".freeze, term(
          allValuesFrom: "fabio:AnalogItem".freeze,
          onProperty: "fabio:stores".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Announcement,
      comment: %(A formal statement about something.).freeze,
      label: "announcement".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Anthology,
      comment: %(A collection of selected literary or scholastics works, for example poems, short stories, plays or research papers.).freeze,
      label: "anthology".freeze,
      subClassOf: "fabio:ExpressionCollection".freeze,
      type: "owl:Class".freeze
    term :ApplicationProfile,
      comment: %(A set of metadata elements, policies and guidelines defined for a particular application.  The metadata elements used in the application profile may be drawn from more than one element sets, including locally defined sets. ).freeze,
      label: "application profile".freeze,
      subClassOf: "fabio:Metadata".freeze,
      type: "owl:Class".freeze
    term :ApplicationProgrammingInterface,
      comment: %( A computer program that enables a separate computer to interact programmatically with the computer running the API.  \(Commonly abbreviated 'API'.\)).freeze,
      label: ["API".freeze, "application programming interface".freeze],
      subClassOf: "fabio:ComputerProgram".freeze,
      type: "owl:Class".freeze
    term :ArchivalDocument,
      comment: %(An archival document is a realization of the content related to an archival record. It can be exemplified as a book, a document, a letter, a database, etc.).freeze,
      label: "archival document".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :ArchivalDocumentSet,
      comment: %(A collection of archival document.).freeze,
      label: "archival document set".freeze,
      subClassOf: ["fabio:ExpressionCollection".freeze, term(
          allValuesFrom: "fabio:ArchivalDocument".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          type: "owl:Restriction".freeze
        ), term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:ArchivalDocument".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :ArchivalRecord,
      comment: %(An archival record connotes a material created or received by a person, family, or organization, public or private, in the conduct of their affairs that is preserved because of the enduring value contained in the information it contains or as evidence of the function and the responsibilities of its creator.).freeze,
      label: "archival record".freeze,
      subClassOf: ["fabio:Work".freeze, term(
          allValuesFrom: "fabio:ArchivalDocument".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#realization".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :ArchivalRecordSet,
      comment: %(A collection of archival records.).freeze,
      label: "archival record set".freeze,
      subClassOf: ["fabio:WorkCollection".freeze, term(
          allValuesFrom: "fabio:ArchivalDocumentSet".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#realization".freeze,
          type: "owl:Restriction".freeze
        ), term(
          allValuesFrom: "fabio:ArchivalRecord".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          type: "owl:Restriction".freeze
        ), term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:ArchivalRecord".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Article,
      comment: %(The realization of a piece of writing on a particular topic, usually published within a periodical publication \(e.g. journal, magazine and newspaper\).).freeze,
      label: "article".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :ArtisticWork,
      comment: %(It describes any work regarded as art in its widest sense, including works from literature and music, visual art, etc.).freeze,
      label: "artistic work".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :AudioDocument,
      comment: %(The realization of a sound recording.).freeze,
      label: "audio document".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:SoundRecording".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :AuthorityFile,
      comment: %(A controlled vocabulary or official list that establishes, for consistency, the authoritative forms of headings, and the preferred terms or proper names to be used, when creating a catalogue or when indexing and searching a set of entities within a defined domain.).freeze,
      label: "authority file".freeze,
      subClassOf: "fabio:ControlledVocabulary".freeze,
      type: "owl:Class".freeze
    term :BachelorsThesis,
      comment: %(A thesis reporting a research project undertaken as part of an undergraduate course of education leading to a bachelor's degree.).freeze,
      label: "bachelor's thesis".freeze,
      subClassOf: "fabio:Thesis".freeze,
      type: "owl:Class".freeze
    term :BibliographicDatabase,
      comment: %(A database providing an authoritative source of bibliographic information, for example PubMed \(http://www.ncbi.nlm.nih.gov/pubmed\), CrossRef Metadata Search \(http://search.crossref.org/\) and PubMed Central \(http://www.ncbi.nlm.nih.gov/pmc/\).).freeze,
      label: "bibliographic database".freeze,
      subClassOf: "fabio:Database".freeze,
      type: "owl:Class".freeze
    term :BibliographicMetadata,
      comment: %(Standard bibliographic metadata describing an expression of a work.  To take the example of a journal article, bibliographic metadata typically include the authors' names, the date of publication, the title of the article, the journal name and volume number, the first and last page numbers, and the Digital Object Identifier \(DOI\).).freeze,
      label: "bibliographic metadata".freeze,
      subClassOf: "fabio:Metadata".freeze,
      type: "owl:Class".freeze
    term :Biography,
      comment: %(An account of the events, works and achievements, both personal and professional, of a person, either living or dead.).freeze,
      label: "biography".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Blog,
      comment: %(A Web publication medium containing blog posts.).freeze,
      label: "blog".freeze,
      subClassOf: "fabio:WebManifestation".freeze,
      type: "owl:Class".freeze
    term :BlogPost,
      comment: %(Information manifested in a blog, one of a set of periodic sequential entries containing commentary, descriptions of events, or other material such as images or videos, usually displayed in reverse-chronological order and usually maintained by an individual, or comments on such a post.).freeze,
      label: "blog post".freeze,
      subClassOf: ["fabio:Entry".freeze, "fabio:WebContent".freeze],
      type: "owl:Class".freeze
    term :Book,
      comment: %(A non-serial document that is complete in one volume or a designated finite number of volumes.  A book published by a publisher is usually  identified by an International Standard Book Number \(ISBN\), and may be manifested as a physical printed publication on paper bound in a hard or soft cover, or in electronic format as an 'e-book'.).freeze,
      label: "book".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :BookChapter,
      comment: %(A defined chapter of a book, usually with a separate title or number.).freeze,
      label: "book chapter".freeze,
      subClassOf: ["fabio:Chapter".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:Book".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :BookReview,
      comment: %(A written review and critical analysis of the content, scope and quality of a book or other monographic work.).freeze,
      label: "book review".freeze,
      subClassOf: "fabio:Review".freeze,
      type: "owl:Class".freeze
    term :BookSeries,
      comment: %(A sequence of books having certain characteristics in common that are formally identified together as a group - for instance, the books in the Law, Governance and Technology Series published by Springer.).freeze,
      label: "book series".freeze,
      "owl:disjointWith": "fabio:BookSet".freeze,
      subClassOf: ["fabio:Series".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:Book".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :BookSet,
      comment: %(A set of books having certain characteristics in common that informally allow their identification together as a group - for instance, the books of the Harry Potter saga.).freeze,
      label: "book set".freeze,
      subClassOf: ["fabio:ExpressionCollection".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:Book".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :BriefReport,
      comment: %(A brief report document.  This term may also be used synonymously with Rapid Communication to mean 'A short rapidly published research article or conference paper, typically reporting significant research results that have been recently discovered, or a brief news item reporting such discoveries.').freeze,
      label: "brief report".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          type: "owl:Class".freeze,
          unionOf: list("fabio:RapidCommunication".freeze, "fabio:ReportDocument".freeze)
        )],
      type: "owl:Class".freeze
    term :CallForApplications,
      comment: %(A document published by a funding agency requesting submission of applications for financial grants to fund projects, for example to enable research investigations in areas specified in the Call.).freeze,
      label: "call for applications".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Proposition".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :CaseForSupport,
      comment: %(A part of a grant application that provides a description of a proposed project and gives reasons why it is worthy of funding. \(See also fabio:GrantApplication\).).freeze,
      label: "case for support".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :CaseForSupportDocument,
      comment: %(A document containing the case for support for a particular project, usually contained within a grant application document but sometimes distributed separately, without the financial and organizational information that the grant application document also contains.).freeze,
      label: "case for support document".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:CaseForSupport".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :CaseReport,
      comment: %(A report about a particular case or situation.).freeze,
      label: "case report".freeze,
      subClassOf: "fabio:Report".freeze,
      type: "owl:Class".freeze
    term :Catalog,
      comment: %(A list of items describing the content of a resource, for example items in an exhibition, items offered for sale by a vendor, or entities contained within a library or collection.  Ideally, catalogs are created according to specific and uniform principles of construction and are under the control of an authority file.).freeze,
      label: "catalog".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :Chapter,
      comment: %(A defined document section, forming part of or intended for inclusion within a larger document, usually with its own title or chapter number.  Different chapters within a document such as a book or a report may each be independently authored, or may all be authored by a single individual or group of authors.).freeze,
      label: "chapter".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :CitationMetadata,
      comment: %(Metadata describing the citations made within a work to other works, and \(optionally\) some characteristics of the expressions of the cited works.).freeze,
      label: "citation metadata".freeze,
      subClassOf: "fabio:Metadata".freeze,
      type: "owl:Class".freeze
    term :ClinicalCaseReport,
      comment: %(A presentation of findings following a clinical or medical investigation on a human or animal patient, that may contain a diagnosis and proposals for therapeutic treatment and/or epidemiological control measures, or may propose further evaluative studies that will eventually lead to such outcomes.).freeze,
      label: "clinical case report".freeze,
      subClassOf: "fabio:CaseReport".freeze,
      type: "owl:Class".freeze
    term :ClinicalGuideline,
      comment: %(A recommendation on the appropriate treatment and care of people with a specific disease or condition, based on the best available evidence, designed to help healthcare professionals in their work.).freeze,
      label: "clinical guideline".freeze,
      subClassOf: "fabio:InstructionalWork".freeze,
      type: "owl:Class".freeze
    term :ClinicalTrialDesign,
      comment: %(A predefined written procedural method, designed to ensure reliability of findings, for undertaking a medical or veterinary clinical study of the safety, efficacy, or optimum dosage schedule of one or more diagnostic, therapeutic or prophylactic drugs or treatments, or of devices or techniques, involving a randomized controlled trial for evidence-based assessment in humans or animals, specifying criteria of eligibility, nature of controls, sampling schedules, data collection parameters, statistical analyses, reporting standards, etc. to be employed in undertaking the clinical trial.).freeze,
      label: "clinical trial design".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :ClinicalTrialReport,
      comment: %(The report of a pre-planned medical or veterinary clinical study of the safety, efficacy, or optimum dosage schedule of one or more diagnostic, therapeutic or prophylactic drugs, or of devices, treatments or techniques, involving a randomized controlled trial for evidence-based assessment in humans or animals selected according to predetermined criteria of eligibility and observed for evidence of favourable and unfavourable effects.).freeze,
      label: "clinical trial report".freeze,
      subClassOf: "fabio:TrialReport".freeze,
      type: "owl:Class".freeze
    term :CollectedWorks,
      comment: %(A collection of the literary or scholastic works of a single person.).freeze,
      label: "collected works".freeze,
      subClassOf: "fabio:Anthology".freeze,
      type: "owl:Class".freeze
    term :Comment,
      comment: %(A verbal or written remark concerning some entity.  In written form, a comment is often appended to that entity and termed an annotation.  Within computer programs or ontologies, comments are added to enhance human understanding, and are usually prefaced by a special syntactic symbol that ensures they are ignored during execution of the program.).freeze,
      label: "comment".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :CompleteWorks,
      comment: %(A collection of all the literary or scholastic works of a single person.).freeze,
      label: "complete works".freeze,
      subClassOf: "fabio:CollectedWorks".freeze,
      type: "owl:Class".freeze
    term :ComputerApplication,
      comment: %(A computer program designed to assist a human user to perform one or more goal-oriented tasks such as word processing or image processing.  A computer application will typically save its output files in one or more specific formats, conforming either to proprietary or open standards.  ).freeze,
      label: "computer application".freeze,
      subClassOf: "fabio:ComputerProgram".freeze,
      type: "owl:Class".freeze
    term :ComputerFile,
      comment: %(A digital item containing information in computer-readable form encoded in a particular format.).freeze,
      label: "computer file".freeze,
      subClassOf: "fabio:DigitalItem".freeze,
      type: "owl:Class".freeze
    term :ComputerProgram,
      comment: %(A unit of computer code in source or compiled form, employing one or more algorithms to be executed by a digital computer to undertake a particular task.  Computer programs are collectively called 'software' to distinguish them from the equipment \('hardware'\) upon which they run. ).freeze,
      label: "computer program".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :ConferencePaper,
      comment: %(A paper, typically the realization of a research paper reporting original research findings, usually published within a conference proceedings volume.).freeze,
      label: "conference paper".freeze,
      subClassOf: "fabio:ProceedingsPaper".freeze,
      type: "owl:Class".freeze
    term :ConferencePoster,
      comment: %(A display poster, typically containing text with illustrative figures and/or tables, usually reporting research results or proposing hypotheses, submitted for acceptance to and/or presented at a conference, seminar, symposium, workshop or similar event.).freeze,
      label: "conference poster".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :ConferenceProceedings,
      comment: %(A document containing the programme and collected conference papers, or their abstracts, presented at a conference, seminar, symposium or similar event.).freeze,
      label: "conference proceedings".freeze,
      subClassOf: ["fabio:AcademicProceedings".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:ConferencePaper".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :ControlledVocabulary,
      comment: %(A collection of selected words and phrases related to a particular domain of knowledge used to permit consistency of metadata annotation and improved retrieval following a search, in which homonyms, synonyms and similar ambiguities of meaning present in natural language are disambiguated.).freeze,
      label: "controlled vocabulary".freeze,
      subClassOf: "fabio:Vocabulary".freeze,
      type: "owl:Class".freeze
    term :Correction,
      comment: %(A correction to an error in a previously published document.).freeze,
      label: "correction".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Corrigendum,
      comment: %(A formal correction to an error introduced by the author into a previously published document.).freeze,
      label: "corrigendum".freeze,
      subClassOf: "fabio:Correction".freeze,
      type: "owl:Class".freeze
    term :Cover,
      comment: %(A protective covering used to bind together the pages of a document or the first, informative, page of a digital document.).freeze,
      label: "cover".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :CriticalEdition,
      comment: %(A new edition of a historical publication, edited by a scholar other than the original author, containing within the body text the supposedly best version of the original work, with footnotes detailing and commenting on textual variations between different versions, typically with an introduction to the original work written by the scholar, and with a bibliography listing related publications.).freeze,
      label: "critical edition".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :DataFile,
      comment: %(A realisation of a fabio:Dataset \(a frbr:Work\) containing a defined collection of data with specific content and possibly with a specific version number, that can be embodied as a fabio:Digital Manifestation \(a frbr:Manifestation with a specific format\) and be represented by a specific fabio:ComputerFile \(a frbr:Item\) on someone's hard drive.).freeze,
      label: "data file".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Dataset".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :DataManagementPolicy,
      comment: %(A policy that descibes and defines how data should be managed, preserved and shared.).freeze,
      label: "data management policy".freeze,
      subClassOf: "fabio:Policy".freeze,
      type: "owl:Class".freeze
    term :DataManagementPolicyDocument,
      comment: %(A document embodying a policy that descibes and defines how data should be managed, preserved and shared.).freeze,
      label: "data management policy document".freeze,
      subClassOf: "fabio:PolicyDocument".freeze,
      type: "owl:Class".freeze
    term :DataMangementPlan,
      comment: %(A structured document giving information about how data arising from a research project or other endeavour is to be manages, preserved and shared.).freeze,
      label: "data management plan".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Proposition".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :DataRepository,
      comment: %(A repository for storing data.).freeze,
      label: "data repository".freeze,
      subClassOf: "fabio:Repository".freeze,
      type: "owl:Class".freeze
    term :Database,
      comment: %(A structured collection of logically related records or data usually stored and retrieved using computer-based means.).freeze,
      label: "database".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :DatabaseManagementSystem,
      comment: %(The software used to create a database.  \(Commonly abbreviated 'DBMS'.\)).freeze,
      label: "database management system".freeze,
      subClassOf: "fabio:ComputerProgram".freeze,
      type: "owl:Class".freeze
    term :Dataset,
      comment: %(A collection of related facts, often expressed in numerical form and encoded in a defined structure.).freeze,
      label: "dataset".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :DefinitiveVersion,
      comment: %(The final published expression of a work that bears the publisher's imprimatur. Typically for a journal article, the Definitive Version results from revision of an earlier submitted version of the work following peer review, and is then published in print and/or digital form after the publisher has assigned it a DOI.  The Definitive Version is also known as the Version of Record, although according to the CrossRef Glossary \(http://crossref.org/02publishers/glossary.html\) that term can also refer to the author's final version of a work that is not formally published. ).freeze,
      label: "definitive version".freeze,
      subClassOf: "fabio:Manuscript".freeze,
      type: "owl:Class".freeze
    term :DemoPaper,
      comment: %(A demonstration paper, typically describing a new product, service or system created as a result of research, usually presented during a conference or workshop.).freeze,
      label: "demo paper".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :Diary,
      comment: %(A personal record, in a form of book, with discrete entries \(often handwritten\) arranged by date, reporting what has happened over the course of a day or other period of time.).freeze,
      label: "diary".freeze,
      subClassOf: ["fabio:Notebook".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:Entry".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :DigitalItem,
      comment: %(A digital object, such as a computer file.).freeze,
      "dc11:description": "A digital item is an exemplar of a digital manifestation only and it is always stored in a storage medium suitable for digital objects, such as CDs, DVDs, HDs and the Web.".freeze,
      label: "digital item".freeze,
      subClassOf: ["fabio:Item".freeze, term(
          onProperty: "fabio:isStoredOn".freeze,
          someValuesFrom: "fabio:DigitalStorageMedium".freeze,
          type: "owl:Restriction".freeze
        ), term(
          onProperty: "http://purl.org/vocab/frbr/core#exemplarOf".freeze,
          someValuesFrom: "fabio:DigitalManifestation".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :DigitalManifestation,
      comment: %(A manifestation that represents data in binary form, encoding the data as a series of 0s and 1s.).freeze,
      label: "digital manifestation".freeze,
      subClassOf: ["fabio:Manifestation".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#exemplar".freeze,
          someValuesFrom: "fabio:DigitalItem".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :DigitalStorageMedium,
      comment: %(A means of storing information in digital form, involving binary encoding of data in 0s and 1s, e.g. a computer random access memory, hard disc, USB stick, CD, DVD or digital magnetic tape.).freeze,
      label: "digital storage medium".freeze,
      subClassOf: ["fabio:StorageMedium".freeze, term(
          allValuesFrom: "fabio:DigitalItem".freeze,
          onProperty: "fabio:stores".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Directory,
      comment: %(A database of information which is heavily optimized for reading.).freeze,
      label: "directory".freeze,
      subClassOf: "fabio:Database".freeze,
      type: "owl:Class".freeze
    term :DisciplineDictionary,
      comment: %(A discipline dictionary is a collection of subject disciplines.).freeze,
      label: "discipline dictionary".freeze,
      "owl:disjointWith": "fabio:TermDictionary".freeze,
      subClassOf: ["skos:ConceptScheme".freeze, term(
          allValuesFrom: "fabio:SubjectDiscipline".freeze,
          onProperty: "fabio:isSchemeOf".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :DoctoralThesis,
      comment: %(A thesis reporting the research undertaken during a period of graduate study leading to a doctoral degree.).freeze,
      label: "doctoral thesis".freeze,
      subClassOf: "fabio:Thesis".freeze,
      type: "owl:Class".freeze
    term :DocumentRepository,
      comment: %(A repository for storing documents.).freeze,
      label: "document repository".freeze,
      subClassOf: "fabio:Repository".freeze,
      type: "owl:Class".freeze
    term :DustJacket,
      comment: %(A detachable outer cover, usually made of paper and printed with text and illustrations. This outer cover has folded flaps that hold it to the cover of a document.).freeze,
      label: "dust jacket".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :Editorial,
      comment: %(The realization of an opinion written by an editor.).freeze,
      label: "editorial".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Opinion".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Email,
      comment: %(A message transmitted over the internet as an item of electronic mail, typically based on the Simple Mail Transfer Protocol \(SMTP\).  Emails can have computer files containing documents, dataset and images attached to them or embedded within them.).freeze,
      label: "e-mail".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :EntityMetadata,
      comment: %(Metadata describing the work itself, including for example the name of the creator\(s\), the title of the work, and the date and place of its creation.).freeze,
      label: "entity metadata".freeze,
      subClassOf: "fabio:Metadata".freeze,
      type: "owl:Class".freeze
    term :Entry,
      comment: %(An item written or printed in a diary, list, account book, reference book, or database.).freeze,
      label: "entry".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :Erratum,
      comment: %(A formal correction to an error introduced by the publisher into a previously published document.).freeze,
      label: "erratum".freeze,
      subClassOf: "fabio:Correction".freeze,
      type: "owl:Class".freeze
    term :Essay,
      comment: %(A piece of non-fiction writing on a particular subject, usually of moderate length and without chapters.).freeze,
      label: "essay".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :ExaminationPaper,
      comment: %(A set of questions on a particular topic designed to test the academic, professional or technical ability of the person taking the examination, with achievement of a pass grade in the examination typically being a prerequisite for the award of an educational award such as a degree, or of a professional or technical qualification.).freeze,
      label: "examination paper".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Excerpt,
      comment: %(A segment or passage selected from a larger expression for use in another expression, usually with specific attribution to its original source.

[Note: Use fabio:Excerpt to indicate a segment or passage selected from another expression that is not a passage of speech, and fabio:Quotation to indicate a segment or passage selected from another expression that is a passage of speech.]).freeze,
      "dc11:description": "An excerpt is more general than a quotation, and is generally used to indicate a re-published extract from a book, instruction manual, film, radio programme, etc, that need not be what someone said.  \n\nFor example:\n     Oxford    01865\n     Oxshott   01372\n     Oxted      01883\n     Oxton      01578\nis an excerpt from the UK Dialling Codes section of the Oxford Telephone Directory.  \n\nSimilarly, the following concluding passage from William Wordsworth's poem Lines written a Few Miles above Tintern Abbey is an excerpt rather than a quotation:\n                                           Nor wilt thou then forget,    \n    That after many wanderings, many years    \n    Of absence, these steep woods and lofty cliffs,    \n    And this green pastoral landscape, were to me    \n    More dear, both for themselves and for thy sake.".freeze,
      label: "excerpt".freeze,
      "rdfs:seeAlso": "fabio:Quotation".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :ExecutiveSummary,
      comment: %(An executive summary is a brief report summarizing a longer formal report, designed to present the key points, conclusions and recommendations arising from the study being reported, for readers too busy to take the time to read the complete report.).freeze,
      label: "executive summary".freeze,
      subClassOf: "fabio:BriefReport".freeze,
      type: "owl:Class".freeze
    term :ExperimentalProtocol,
      comment: %(A predefined written procedural method, designed to ensure successful replication of results by others in the same or other laboratories, that describes the overall objectives, organization and implementation of a scientific experiment, and specifies the experimental design, experimental methods, reagents, instrumentation, sampling schedules, data collection parameters, statistical analyses, image processing procedures, safety precautions, reporting standards, etc. employed in undertaking the experiment.).freeze,
      label: "experimental protocol".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :Expression,
      comment: %(A subclass of FRBR expression, restricted to expressions of fabio:Works.  For your latest research paper, the preprint submitted to the publisher, and the final published version to which the publisher assigned a unique digital object identifier, are both expressions of the same work.  ).freeze,
      "dc11:description": "A fabio:Expression can only have part or be part of another fabio:Expression.  Moreover, it can be a representation only of a fabio:Work, and  it can be embodied only in fabio:Manifestation(s).".freeze,
      label: "expression".freeze,
      subClassOf: ["http://purl.org/vocab/frbr/core#Expression".freeze, term(
          allValuesFrom: "fabio:Manifestation".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#embodiment".freeze,
          type: "owl:Restriction".freeze
        ), term(
          allValuesFrom: "fabio:Work".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          type: "owl:Restriction".freeze
        ), term(
          intersectionOf: list(term(
            allValuesFrom: "http://purl.org/vocab/frbr/core#Expression".freeze,
            onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
            type: "owl:Restriction".freeze
          ), term(
            allValuesFrom: "http://purl.org/vocab/frbr/core#Expression".freeze,
            onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
            type: "owl:Restriction".freeze
          )),
          type: "owl:Class".freeze
        )],
      type: "owl:Class".freeze
    term :ExpressionCollection,
      comment: %(A collection of expressions, for example a periodical or a book series.).freeze,
      label: "expression collection".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:Expression".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Figure,
      comment: %(A visual communication object comprising one or more still images on a related theme.  If included within a publication, a figure is typically unaligned with the main body of text, having its own descriptive textual figure legend.).freeze,
      label: "figure".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:StillImage".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Film,
      comment: %(A movie with an accompanying soundtrack, typically created by a professional film studio, designed to communicate a fictional story, record an artistic event, or impart information that is scientific or documentary in nature.).freeze,
      label: "film".freeze,
      subClassOf: "fabio:Movie".freeze,
      type: "owl:Class".freeze
    term :Folksonomy,
      comment: %(A system of classification derived from the practice and method of collaboratively creating and managing tags to annotate and categorize content in a particular domain. [Contrast fabio:Ontology]).freeze,
      label: "folksonomy".freeze,
      subClassOf: "fabio:UncontrolledVocabulary".freeze,
      type: "owl:Class".freeze
    term :GanttChart,
      comment: %(A horizontal bar chart used to guide project planning, execution and control, illustrating the project schedule, with a separate line indicating the start and end dates of each of the key project activities or workpackages, and optionally showing the dependencies between these items. A Gantt chart is typically part of a project plan.).freeze,
      label: "Gantt chart".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :GrantApplication,
      comment: %(A formal written request for financial support from a grant-giving body in support of a project, for example an academic research project.  \(See also fabio:CaseForSupport.\)).freeze,
      label: "grant application".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :GrantApplicationDocument,
      comment: %(The realization of a grant application, usually containing a case for support document.).freeze,
      label: "grant application document".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:GrantApplication".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Hardback,
      comment: %(A print object bound with rigid protective covers \(typically of cardboard covered with cloth, heavy paper, or sometimes leather\).).freeze,
      label: "hardback".freeze,
      subClassOf: "fabio:PrintObject".freeze,
      type: "owl:Class".freeze
    term :Image,
      comment: %(A visual representation other than text, including all types of moving image and still image.).freeze,
      label: "image".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :InBrief,
      comment: %(An 'In Brief' is a journal or magazine news item that describes all the articles \(or all the important articles\) in that issue of the periodical. The content of an 'In Brief' may be constructed from the abstracts of the articles it highlights, but is more likely to be written by a member of the periodical staff especially for the issue.).freeze,
      label: "in brief".freeze,
      subClassOf: ["fabio:NewsItem".freeze, term(
          type: "owl:Class".freeze,
          unionOf: list("fabio:JournalNewsItem".freeze, "fabio:MagazineNewsItem".freeze)
        )],
      type: "owl:Class".freeze
    term :InUsePaper,
      comment: %(A scholarly work that describes applied and validated solutions such as software tools, systems or architectures that benefit from the use of the technology of a particular scholarly domain. Usually, papers of this kind should also provide convincing evidence that there is use of the proposed application or tool by the target user group, preferably outside the institution that conducted its development.

E.g. see http://iswc2018.semanticweb.org/call-for-in-use-track-papers/.).freeze,
      label: "in-use paper".freeze,
      subClassOf: "fabio:ScholarlyWork".freeze,
      type: "owl:Class".freeze
    term :Index,
      comment: %(An alphabetically-ordered list of words and phrases \('headings'\) and associated pointers \('locators'\) to where useful material relating to that heading can be found in a document.).freeze,
      label: "index".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :InstructionManual,
      comment: %(An instructional document typically supplied with a technologically advanced consumer product, such as a car or a computer application, or with an item of complex equipment such as a microscope.).freeze,
      label: "instruction manual".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:InstructionalWork".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :InstructionalWork,
      comment: %(A work created for the purpose of education or instruction, that may be expressed as a  text book, a lecture, a tutorial or an instruction manual.).freeze,
      label: "instructional work".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Item,
      comment: %(A subclass of FRBR item, restricted to exemplars of fabio:Manifestations.  An example of a fabio:Item is a printed copy of a journal article on your desk, or a PDF file of that article that you purchased from a publisher and that now resides in digital form on your computer hard drive.  ).freeze,
      "dc11:description": "A fabio:Item can only have part or be part of another fabio:Item. Moreover, it can be an exemplar only of a fabio:Manifestation.".freeze,
      label: "item".freeze,
      subClassOf: ["http://purl.org/vocab/frbr/core#Item".freeze, term(
          allValuesFrom: "fabio:Manifestation".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#exemplarOf".freeze,
          type: "owl:Restriction".freeze
        ), term(
          intersectionOf: list(term(
            allValuesFrom: "http://purl.org/vocab/frbr/core#Item".freeze,
            onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
            type: "owl:Restriction".freeze
          ), term(
            allValuesFrom: "http://purl.org/vocab/frbr/core#Item".freeze,
            onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
            type: "owl:Restriction".freeze
          )),
          type: "owl:Class".freeze
        )],
      type: "owl:Class".freeze
    term :ItemCollection,
      comment: %(A collection of items.).freeze,
      label: "item collection".freeze,
      subClassOf: ["fabio:Item".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:Item".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Journal,
      comment: %(A scholarly periodical primarily devoted to the publication of original research papers. [Printed and electronic manifestations of the same journal are usually identified by separate print and electronic International Standard Serial Numbers \(ISSN or eISSN, respectively\), that identifies the journal as a whole, not to individual issues of it.]).freeze,
      label: "journal".freeze,
      subClassOf: ["fabio:Periodical".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:JournalIssue".freeze,
          type: "owl:Restriction".freeze
        ), term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:JournalVolume".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :JournalArticle,
      comment: %(An article, typically the realization of a research paper reporting original research findings, published in a journal issue.  ).freeze,
      label: "journal article".freeze,
      subClassOf: ["fabio:Article".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:JournalIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :JournalEditorial,
      comment: %(An editorial published in an issue of a journal.).freeze,
      label: "journal editorial".freeze,
      subClassOf: ["fabio:Editorial".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:JournalIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :JournalIssue,
      comment: %(A particular published issue of a journal, one or more of which will constitute a volume of the journal.).freeze,
      label: "journal issue".freeze,
      subClassOf: ["fabio:PeriodicalIssue".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:JournalVolume".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :JournalNewsItem,
      comment: %(A news report published in a journal issue.).freeze,
      label: "journal news item".freeze,
      subClassOf: ["fabio:NewsItem".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:JournalIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :JournalVolume,
      comment: %(A particular published volume of a journal, comprising one or more journal issues.).freeze,
      label: "journal volume".freeze,
      subClassOf: ["fabio:PeriodicalVolume".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:Journal".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :LaboratoryNotebook,
      comment: %(A notebook used by an individual research scientist as the primary record of his or her research activities. A researcher may use a laboratory notebook to document hypotheses, to describe experiments and to record data in various formats, to provide details of data analysis and interpretation, or to record the validation or invalidation of the original hypotheses. The laboratory notebook serves as an organizational tool and a memory aid.  It may also have a role in recording and protecting any intellectual property created during the research, and may be used in evidence when establishing priority of discoveries, for example in patent applications.  Electronic versions of laboratory notebooks are increasingly being employed by researchers, particularly in chemistry and the pharmaceutical industry.).freeze,
      label: "laboratory notebook".freeze,
      subClassOf: "fabio:Notebook".freeze,
      type: "owl:Class".freeze
    term :LectureNotes,
      comment: %(A document containing notes that summarize a lecture or course of lectures.).freeze,
      label: "lecture notes".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :LegalOpinion,
      comment: %(A written explanation by a judge or group of judges that accompanies a ruling in a legal case, laying out the reasons and legal principles for the ruling, and sometimes containing pronouncements about what the law is and how it should be interpreted.).freeze,
      label: "legal opinion".freeze,
      subClassOf: "fabio:Opinion".freeze,
      type: "owl:Class".freeze
    term :Letter,
      comment: %(A written or printed communication of a personal or professional nature between individuals and/or representatives of corporate bodies, usually transmitted by the postal service or published in a periodical.  In the latter case, the letter is typically addressed to the editor and comments on or discussed an item previously published by that periodical, or of interest to its readership.).freeze,
      label: "letter".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :LibraryCatalog,
      comment: %(The catalog of the holdings of a library, for example that of the Library of Congress \(http://catalog.loc.gov/\).).freeze,
      label: "library catalog".freeze,
      subClassOf: "fabio:Catalog".freeze,
      type: "owl:Class".freeze
    term :LiteraryArtisticWork,
      comment: %(A literary creative work, such as a novel, play, poem or song.).freeze,
      label: "literary artistic work".freeze,
      subClassOf: "fabio:ArtisticWork".freeze,
      type: "owl:Class".freeze
    term :Magazine,
      comment: %(A periodical, usually devoted to a particular topic or domain of interest, and usually published weekly or monthly, consisting primarily of  non-peer reviewed editorials, journalistic news items and more substantive articles, reviews, book reviews and discussions concerning current or recent events and publications, and matters of interest to the domain served by the magazine.  [Some scientific journals, notably Science and Nature, also secondarily serve as science magazines by containing substantive editorials and news items on vital or controversial issues].).freeze,
      label: "magazine".freeze,
      subClassOf: ["fabio:Periodical".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:MagazineIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :MagazineArticle,
      comment: %(An article published in a magazine issue.).freeze,
      label: "magazine article".freeze,
      subClassOf: ["fabio:Article".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:MagazineIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :MagazineEditorial,
      comment: %(An editorial published in an issue of a magazine.).freeze,
      label: "magazine editorial".freeze,
      subClassOf: ["fabio:Editorial".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:MagazineIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :MagazineIssue,
      comment: %(A particular published  issue of a magazine, identified by date, and sometimes also by place \(e.g. 'West Coast edition'\) or language \(e.g. 'Spanish edition'\).).freeze,
      label: "magazine issue".freeze,
      subClassOf: ["fabio:PeriodicalIssue".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:Magazine".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :MagazineNewsItem,
      comment: %(A news report published in a magazine issue.).freeze,
      label: "magazine news item".freeze,
      subClassOf: ["fabio:NewsItem".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:MagazineIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Manifestation,
      comment: %(A subclass of FRBR manifestation, restricted to manifestations of fabio:Expressions. fabio:Manifestation specifically applies to electronic \(digital\) as well as to physical manifestations of expressions.  

Examples of different manifestations of a single 'version of record' expression of a scholarly work include an article in a print journal or the on-line version of that article as a web page.).freeze,
      "dc11:description": "A fabio:Manifestation can only have part or be part of another fabio:Manifestation.  Moreover, it can be an embodiment only of a fabio:Expression and it can be exemplified only by fabio:Item(s).".freeze,
      label: "manifestation".freeze,
      subClassOf: ["http://purl.org/vocab/frbr/core#Manifestation".freeze, term(
          allValuesFrom: "fabio:Expression".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#embodimentOf".freeze,
          type: "owl:Restriction".freeze
        ), term(
          allValuesFrom: "fabio:Item".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#exemplar".freeze,
          type: "owl:Restriction".freeze
        ), term(
          intersectionOf: list(term(
            allValuesFrom: "http://purl.org/vocab/frbr/core#Manifestation".freeze,
            onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
            type: "owl:Restriction".freeze
          ), term(
            allValuesFrom: "http://purl.org/vocab/frbr/core#Manifestation".freeze,
            onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
            type: "owl:Restriction".freeze
          )),
          type: "owl:Class".freeze
        )],
      type: "owl:Class".freeze
    term :ManifestationCollection,
      comment: %(A collection of manifestations.).freeze,
      label: "manifestation collection".freeze,
      subClassOf: ["fabio:Manifestation".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:Manifestation".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Manuscript,
      comment: %(A textual work prepared 'by hand', such as a typescript or word-processed pre-publication draft of a research paper or a report, or a work not otherwise reproduced in multiple copies.  [Note: fabio:Manuscript is not intended to describe a handwritten historical document on paper or parchment, for which the FRBR distinctions between work, expression, manifestation and item \(individual copy\) becomes blurred.].).freeze,
      label: "manuscript".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :MastersThesis,
      comment: %(A thesis reporting a research project undertaken as part of a graduate course of education leading to a master's degree.).freeze,
      label: "master's thesis".freeze,
      subClassOf: "fabio:Thesis".freeze,
      type: "owl:Class".freeze
    term :MeetingReport,
      comment: %(A report of a meeting of some kind.).freeze,
      label: "meeting report".freeze,
      subClassOf: "fabio:Report".freeze,
      type: "owl:Class".freeze
    term :Metadata,
      comment: %(A separate work that provides information describing one or more characteristics of a resource or entity.).freeze,
      label: "metadata".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :MetadataDocument,
      comment: %(A document that contains metadata information describing one or more characteristics of an entity.).freeze,
      label: "metadata document".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Metadata".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :MethodsPaper,
      comment: %(A scholarly work detailing a method, procedure or experimental protocol employed in a particular scholarly domain.).freeze,
      label: "methods paper".freeze,
      subClassOf: "fabio:ScholarlyWork".freeze,
      type: "owl:Class".freeze
    term :Microblog,
      comment: %(A social networking publication medium such as Twitter, Tumblr, FriendFeed, Facebook or MySpace. A microblog differs from a traditional blog in that its individual content items are smaller than a traditional blog posts, typically containing just a short sentence, a single image, or a URI.  These small messages are referred to as microposts.).freeze,
      label: "microblog".freeze,
      subClassOf: "fabio:Blog".freeze,
      type: "owl:Class".freeze
    term :Micropost,
      comment: %(A content item that is published in a Microblog, typically containing just a short sentence, a single image, or a URL.).freeze,
      label: "micropost".freeze,
      subClassOf: ["fabio:Entry".freeze, "fabio:WebContent".freeze],
      type: "owl:Class".freeze
    term :MinimalInformationStandard,
      comment: %(A metadata standard specifying items to be included when creating metadata describing a dataset of a particular type, or when creating a structured summary of the main findings of an article or report in a particular domain of interest, thereby ensuring adequate descriptive information is recorded for subsequent resource discovery and/or interpretation of the information described.  [See also fabio:ReportingStandard.]).freeze,
      label: "minimal information standard".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :Model,
      comment: %(A mathematical, graphical or physical representation of some physical reality, conceptual idea or theoretical construct.).freeze,
      label: "model".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Movie,
      comment: %(The realization of a moving image.).freeze,
      label: "movie".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:MovingImage".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :MovingImage,
      comment: %(A moving display, either generated dynamically by a computer program or formed from a series of pre-recorded still images imparting an impression of motion when shown in succession.  Examples include animations, cine films, videos, and computational simulations. Expressions of moving images may incorporate synchronized soundtracks.).freeze,
      label: "moving image".freeze,
      "owl:disjointWith": "fabio:StillImage".freeze,
      subClassOf: "fabio:Image".freeze,
      type: "owl:Class".freeze
    term :MusicalComposition,
      comment: %(A piece of music, typically in the form of a composition recorded in musical notation.).freeze,
      label: "musical composition".freeze,
      subClassOf: "fabio:LiteraryArtisticWork".freeze,
      type: "owl:Class".freeze
    term :Nanopublication,
      comment: %(A single, attributable and machine-readable factual assertion - the smallest unit of publishable information that can be uniquely identified and attributed to its author – typically expressed in RDF.  The minimal components of a nanopublication are as follows:
* the factual assertion itself, in the form subject, predicate and object \(e.g. malaria is_a disease\);
* provenance information about the nanopublication, defining its authorship and creation date;
* supporting information \(optional\), providing context for the assertion;
* a unique identifier for the nanopublication, in the form of a URI;
* an integrity key that ensures that the nanopublication is in its original form and has not been altered.
).freeze,
      label: "nanopublication".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :NewsItem,
      comment: %(A published news report.).freeze,
      label: "news item".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:NewsReport".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :NewsReport,
      comment: %(A report of an item of news.).freeze,
      label: "news report".freeze,
      subClassOf: "fabio:Report".freeze,
      type: "owl:Class".freeze
    term :Newspaper,
      comment: %(A non-peer reviewed periodical, usually published daily or weekly, consisting primarily of editorials and news items concerning current or recent events and matters of public interest.).freeze,
      label: "newspaper".freeze,
      subClassOf: ["fabio:Periodical".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:NewspaperIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :NewspaperArticle,
      comment: %(An article written by a journalist and published in a newspaper.).freeze,
      label: "newspaper article".freeze,
      subClassOf: ["fabio:Article".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:NewspaperIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :NewspaperEditorial,
      comment: %(An editorial published in an issue of a newspaper.).freeze,
      label: "newspaper editorial".freeze,
      subClassOf: ["fabio:Editorial".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:NewspaperIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :NewspaperIssue,
      comment: %(A particular published  issue of a newspaper, identified by date, and sometimes also by place or time \(e.g. 'Late London Edition'\).).freeze,
      label: "newspaper issue".freeze,
      subClassOf: ["fabio:PeriodicalIssue".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:Newspaper".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :NewspaperNewsItem,
      comment: %(A news report published in a newspaper issue.).freeze,
      label: "newspaper news item".freeze,
      subClassOf: ["fabio:NewsItem".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:NewspaperIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Notebook,
      comment: %(A book containing personal notes, typically created by writing into a physical book with blank pages.).freeze,
      label: "notebook".freeze,
      subClassOf: "fabio:Book".freeze,
      type: "owl:Class".freeze
    term :NotificationOfReceipt,
      comment: %(A notification of receipt of something, for example of receipt of a book that will later be the subject of a book review.).freeze,
      label: "notification of receipt".freeze,
      subClassOf: "fabio:Announcement".freeze,
      type: "owl:Class".freeze
    term :Novel,
      comment: %(A long fictitious narrative written in literary prose.).freeze,
      label: "novel".freeze,
      subClassOf: "fabio:LiteraryArtisticWork".freeze,
      type: "owl:Class".freeze
    term :Obituary,
      comment: %(A news item reporting the death of a person, typically accompanied by an description of that person's life and contributions to his or her profession and to society at large.).freeze,
      label: "obituary".freeze,
      subClassOf: "fabio:NewsReport".freeze,
      type: "owl:Class".freeze
    term :Ontology,
      comment: %(A formal representation of a set of concepts within a domain of knowledge, and the logical relationships between those concepts.  [Contrast fabio:Folksonomy]).freeze,
      label: "ontology".freeze,
      subClassOf: "fabio:ControlledVocabulary".freeze,
      type: "owl:Class".freeze
    term :OntologyDocument,
      comment: %(A document containing an ontology, for example an OWL \(Web Ontology Language\) file \(http://www.w3.org/TR/owl-features/\).).freeze,
      label: "ontology document".freeze,
      subClassOf: ["fabio:VocabularyDocument".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Ontology".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Opinion,
      comment: %(An expression of a personal or professional opinion on an issue or topic.).freeze,
      label: "opinion".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Oration,
      comment: %(A formal speech, for example one delivered at a ceremonial occasion, or the written transcript of such a speech.).freeze,
      label: "oration".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :Page,
      comment: %(A manifestation that represents pages either in physical \(e.g., one side of a sheet of paper\) or in digital form \(e.g., a page in a PDF, or a web page\).).freeze,
      label: "page".freeze,
      subClassOf: "fabio:Manifestation".freeze,
      type: "owl:Class".freeze
    term :Paperback,
      comment: %(A print object with a flexible cover, usually made of paper or paperboard.).freeze,
      label: "paperback".freeze,
      subClassOf: "fabio:PrintObject".freeze,
      type: "owl:Class".freeze
    term :Patent,
      comment: %(A formal disclosure of a new invention approved by a governmental patent agency, made to register intellectual property rights, and to give exclusive rights to the inventor or assignee to manufacture, use, license or sell the invention for a certain number of years.).freeze,
      label: "patent".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :PatentApplication,
      comment: %(A formal disclosure of a new invention, made in application for a patent.).freeze,
      label: "patent application".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :PatentApplicationDocument,
      comment: %(The physical or electronic realization of a patent application.).freeze,
      label: "patent application document".freeze,
      subClassOf: ["fabio:SpecificationDocument".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:PatentApplication".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :PatentDocument,
      comment: %(The physical or electronic realization of a patent.).freeze,
      label: "patent document".freeze,
      subClassOf: ["fabio:SpecificationDocument".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Patent".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Periodical,
      comment: %(A publication issued on a regular and ongoing basis as a series of issues, each issue comprising separate periodical items, for example editorials, articles, news items and/or other writings.).freeze,
      label: "periodical".freeze,
      subClassOf: ["fabio:ExpressionCollection".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:PeriodicalIssue".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :PeriodicalIssue,
      comment: %(A particular issue of a periodical, identified and distinguished from other issues of the same publication by date and/or issue number and/or volume number, and comprising separate periodical items such as editorials, articles and news items.).freeze,
      label: "periodical issue".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:Periodical".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :PeriodicalItem,
      comment: %(A piece of writing published in a periodical issue, typically accompanied by other items by different authors.).freeze,
      equivalentClass: term(
          intersectionOf: list("fabio:Expression".freeze, term(
            onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
            someValuesFrom: term(
              type: "owl:Class".freeze,
              unionOf: list("fabio:PeriodicalIssue".freeze, "fabio:PeriodicalVolume".freeze)
            ),
            type: "owl:Restriction".freeze
          )),
          type: "owl:Class".freeze
        ),
      label: "periodical item".freeze,
      type: "owl:Class".freeze
    term :PeriodicalVolume,
      comment: %(A particular published volume of a periodical.).freeze,
      label: "periodical volume".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
          someValuesFrom: "fabio:Periodical".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :PersonalCommunication,
      comment: %(Information communicated personally by verbal or written means from one individual to one or more another persons or organizations.).freeze,
      label: "personal communication".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :PhDSymposiumPaper,
      comment: %(A paper, usually presented during a specific session of a conference dedicated to Ph.D. students, that describes ongoing Ph.D. student's research.).freeze,
      label: "Ph.D. symposium paper".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :Play,
      comment: %(A form of literature written by a playwright, usually consisting of scripted dialogue between characters, intended for theatrical performance rather than reading.).freeze,
      label: "play".freeze,
      subClassOf: "fabio:LiteraryArtisticWork".freeze,
      type: "owl:Class".freeze
    term :Poem,
      comment: %(An artistic work written with an intensity or beauty of language more characteristic of poetry than of prose.).freeze,
      label: "poem".freeze,
      subClassOf: "fabio:LiteraryArtisticWork".freeze,
      type: "owl:Class".freeze
    term :Policy,
      comment: %(A description and definition of how something should be done.  Ideally a policy should be both effective in achieving its goals and acceptable to those who have to abide by it.).freeze,
      label: "policy".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :PolicyDocument,
      comment: %(A document embodying a policy that descibes and defines how something should be done. ).freeze,
      label: "policy document".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Policy".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :PositionPaper,
      comment: %(A scholarly work that reports a particular intellectual position or viewpoint regarding a particular scholarly topic. Usually, these papers are dependent on the author's opinion or interpretation, do not have an evaluation, and need to present relevant and novel discussion points in a thorough manner.

E.g. see https://datasciencehub.net/content/guidelines-authors).freeze,
      label: "position paper".freeze,
      subClassOf: ["fabio:Opinion".freeze, "fabio:ScholarlyWork".freeze],
      type: "owl:Class".freeze
    term :PosterPaper,
      comment: %(A paper that typically accompanies a poster describing some preliminary  results of research, usually presented during a conference or a workshop.).freeze,
      label: "poster paper".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :Postprint,
      comment: %(The version of an author's original scholarly work, such as a research paper or a review, re-submitted for publication after revision by the author in the light of comments from reviewers.  [Note: For the version before peer review, use fabio:Preprint. For the final piblished version, use fabio:DefinitiveVersion.]).freeze,
      label: "postprint".freeze,
      subClassOf: "fabio:Manuscript".freeze,
      type: "owl:Class".freeze
    term :Preprint,
      comment: %(The version of an author's original scholarly work, such as a research paper or a review, first submitted to publisher for publication.  [Note: For that version resubmitted after peer-review and revision, use fabio:Postprint. For the final published version use fabio:DefinitiveVersion.]).freeze,
      label: "preprint".freeze,
      subClassOf: "fabio:Manuscript".freeze,
      type: "owl:Class".freeze
    term :Presentation,
      comment: %(A set of slides containing text, tables or figures, designed to communicate ideas or research results, for projection and viewing by an audience at a conference, symposium, seminar, lecture, workshop or other gatherings, typically embodied in a particular manifestation format such as a SlideShare or PowerPoint slideshow.).freeze,
      label: "presentation".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :PressRelease,
      comment: %(A news report published by an organization to provide information to journalists.).freeze,
      label: "press release".freeze,
      subClassOf: "fabio:NewsItem".freeze,
      type: "owl:Class".freeze
    term :PrintObject,
      comment: %(An analog manifestation in physical printed form, typically on paper.).freeze,
      label: "print object".freeze,
      subClassOf: "fabio:AnalogManifestation".freeze,
      type: "owl:Class".freeze
    term :ProceedingsPaper,
      comment: %(A paper, typically the realization of a research paper reporting original research findings, usually published within an academic proceedings volume.).freeze,
      label: "proceedings paper".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :ProductReview,
      comment: %(A written review and critical analysis of the purpose, features, performance and other qualities of a product.).freeze,
      label: "product review".freeze,
      subClassOf: "fabio:Review".freeze,
      type: "owl:Class".freeze
    term :ProjectMetadata,
      comment: %(Metadata describing a project, for example the project name, the names of those who conducted the project, the name of the institution in which the project was conducted, and the project funding information.).freeze,
      label: "project metadata".freeze,
      subClassOf: "fabio:Metadata".freeze,
      type: "owl:Class".freeze
    term :ProjectPlan,
      comment: %(A document used to guide project planning, execution and control, specifying the project's goal and objectives and the activities and resources required to achieve these, setting out the project schedule, and identifying the major workpackages, milestones and deliverables.  A project plan will typically contain a Gantt chart.
).freeze,
      label: "project plan".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :ProjectReport,
      comment: %(A report describing the outcomes of specific project, typically listing 'deliverables' created or 'milestones' achieved during the project.).freeze,
      label: "deliverable report".freeze,
      subClassOf: "fabio:Report".freeze,
      type: "owl:Class".freeze
    term :ProjectReportDocument,
      comment: %(A document containing a project report, intended to be delivered to a customer or funding agency describing the results achieved within a specific project. ).freeze,
      label: "deliverable".freeze,
      subClassOf: ["fabio:ReportDocument".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:ProjectReport".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Proof,
      comment: %(In printing and publishing, a proof copy is the preliminary version of a publication, after the inclusion of any author corrections following review, and after copy editing and formatting to bring the manuscript into the house style, intended for final checking prior to publication to detect and eliminate typographical errors, omissions or transpositions of text, incorrect layout or placement of illustrations and tables, or other formatting errors.  Those who check proofs include the editor, possibly the peer-reviewers \(to ensure that their requested modifications have been included to their satisfaction\), possibly an in-house professional proof-reader, and / or the author, who is ultimately responsible for ensuring the published work says what \(s\)he means it to say.  Substantive changes to the text are not permitted once the manuscript has reached proof stage.).freeze,
      label: "proof".freeze,
      subClassOf: "fabio:Manuscript".freeze,
      type: "owl:Class".freeze
    term :Proposition,
      comment: %(A proposal or proposition of a new conceptualization, hypothesis, idea, theory, activity or organisation.).freeze,
      label: "proposition".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Questionnaire,
      comment: %(A set of questions on a particular topic, usually in the form of multiple choice questions requiring the respondent to select the correct answer, or providing the ability to indicate support for or against a proposal on a numerical scale, designed for rapid numerical analysis of responses and often used in surveying public opinion.).freeze,
      label: "questionnaire".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Quotation,
      comment: %(A passage of speech selected from a larger verbal or written expression for use in another expression, with specific attribution to its original source, and usually demarcated by quotation marks and / or by placing it in a separate indented paragraph. 

[Note: Use fabio:Quotation to indicate a segment or passage selected from another expression that is a passage of speech, and fabio:Excerpt to indicate a segment or passage selected from another expression that is not a passage of speech.]).freeze,
      "dc11:description": "A quotation is a repetition of what someone has said, and is presented \"within quotation marks\", for example:\n\nOn June 4th 1940, Winston Churchill made a speech on the radio that has since become famous, that included the words:\n       \" . . . we shall fight on the beaches, we shall fight on the landing grounds, we shall fight in the fields and in the streets, we shall fight in the hills; we shall never surrender . . .\"\n\nSimilarly, the words \"but Brutus is an honourable man\" from Mark Antony's funeral speech in Shakespeare's play Julius Caesar is a quotation, since Mark Antony says these words in the play.".freeze,
      label: "quotation".freeze,
      "rdfs:seeAlso": "fabio:Excerpt".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :RapidCommunication,
      comment: %(A short rapidly published research article or conference paper, typically reporting significant research results that have been recently discovered, or a brief news item reporting such discoveries.).freeze,
      label: "rapid communication".freeze,
      "rdfs:seeAlso": "fabio:BriefReport".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :ReferenceBook,
      comment: %(A book containing authoritative factual information, such as a dictionary, encyclopaedia, handbook or field guide, which is a realisation of a certain reference work and may contain several reference entries.).freeze,
      label: "reference book".freeze,
      subClassOf: ["fabio:Book".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:ReferenceWork".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :ReferenceEntry,
      comment: %(A particular reference entry containing authoritative factual information on a certain topic, usually contained in a larger expression.).freeze,
      label: "reference entry".freeze,
      subClassOf: ["fabio:Entry".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:ReferenceWork".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :ReferenceWork,
      comment: %(A work to which people refer for authoritative factual information, such as a dictionary, encyclopaedia, entry, handbook or field guide, or an informative web page such as an institutional, research group or project home page.).freeze,
      label: "reference work".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :RelationalDatabase,
      comment: %(A database in which the data are arranged in tables according to their common characteristics, with relationships between the tables being defined by a relational model or schema. A relational database is highly optimized for performance, and is queried using a database query language such as SQL \(Structured Query Language\).  The software used to create a relational database is called a relational database management system \(RDBMS\).).freeze,
      label: "relational database".freeze,
      subClassOf: "fabio:Database".freeze,
      type: "owl:Class".freeze
    term :Reply,
      comment: %(A work that is a reply, either to a letter or other direct communication, or to feedback or comments about a piece of submitted writing.  The latter is typically written by the author of a journal article submitted for publication, or by an applicant making a grant application, in response to reviews of the work from peer reviewers prior to publication \(for the journal article\) or prior to funding decision \(for the grant application\).  Alternatively, it can be written in response to post-publication peer-review of a published journal article, or comments about it.).freeze,
      label: "reply".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Report,
      comment: %(A formal factual, methodological, statistical, technical or research report issued by an individual, group, agency, government body or other institution.).freeze,
      label: "report".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :ReportDocument,
      comment: %(The realization of a report, usually in printed form.).freeze,
      label: "report document".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Report".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :ReportingStandard,
      comment: %(A set of recommendations for the minimum reporting requirements to be employed when reporting a particular type of investigation or project, for example a randomized clinical trial.  A reporting standard may involve a checklist and a flow diagram, offers a standard way for authors to prepare a complete and transparent report of their findings, and aids their critical appraisal and interpretation of their data. [See also fabio:MinimalInformationStandard.]).freeze,
      label: "reporting standard".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :Repository,
      comment: %(A computer system in which information may be stored.).freeze,
      label: "repository".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :ResearchPaper,
      comment: %(A scholarly work that reports original research contributions addressing theoretical, analytical or experimental aspects of a particular scholarly domain.

E.g. see http://iswc2018.semanticweb.org/call-for-research-track-papers/.).freeze,
      label: "research paper".freeze,
      subClassOf: "fabio:ScholarlyWork".freeze,
      type: "owl:Class".freeze
    term :ResourcePaper,
      comment: %(A scholarly work that describes resources developed to provide experimental materials or facilities, support a research hypothesis, to provide answers to a research question, or that have contributed to the generation of novel scientific work. Examples of such resources include, for experimental sciences, mouse mutant lines and large communally used X-ray or neutron sources, and, for computer sciences, datasets, ontologies, vocabularies, ontology design patterns, evaluation benchmarks or methods, services, APIs and software frameworks, workflows, crowdsourcing task designs, protocols and metrics.

E.g. see http://iswc2018.semanticweb.org/call-for-resources-track-papers/).freeze,
      label: "resource paper".freeze,
      subClassOf: "fabio:ScholarlyWork".freeze,
      type: "owl:Class".freeze
    term :Retraction,
      comment: %(A formal statement retracting a statement or publication
A retraction is a public statement made about an earlier statement that withdraws, cancels, refutes, diametrically reverses the original statement or ceases and desists from publishing the original statement. ).freeze,
      label: "retraction".freeze,
      subClassOf: "fabio:Announcement".freeze,
      type: "owl:Class".freeze
    term :Review,
      comment: %(A review of others' work.).freeze,
      label: "review".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :ReviewArticle,
      comment: %(An article that contains a review.).freeze,
      label: "review article".freeze,
      subClassOf: ["fabio:Article".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Review".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :ReviewPaper,
      comment: %(A scholarly work that surveys the state of the art of topics central to a particular subject or relating to a specific domain \(e.g. the scope of a certain journal or conference\). Papers of this kind may contain a selective bibliography listing key papers related to the subject or providing advice on information sources, or they may strive to be comprehensive, covering all contributions to the development of a topic and exploring their different findings or views.

E.g. see http://www.emeraldgrouppublishing.com/products/journals/author_guidelines.htm?id=JD).freeze,
      label: "review paper".freeze,
      subClassOf: ["fabio:Review".freeze, "fabio:ScholarlyWork".freeze],
      type: "owl:Class".freeze
    term :ScholarlyWork,
      comment: %(A work that reports scholarly activity on a particular topic, either published in written form, or delivered orally at a meeting.).freeze,
      label: "scholarly work".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Screenplay,
      comment: %(A written work made especially for a film or television program. Screenplays can be original works or adaptations from existing pieces of writing, for example novels. ).freeze,
      label: "screenplay".freeze,
      subClassOf: "fabio:LiteraryArtisticWork".freeze,
      type: "owl:Class".freeze
    term :Script,
      comment: %(A small computer program written in a scripting language such as JavaScript, PHP or Perl that allows control of one or more software applications.).freeze,
      label: "script".freeze,
      subClassOf: "fabio:ComputerProgram".freeze,
      type: "owl:Class".freeze
    term :Series,
      comment: %(A sequence of expressions having certain characteristics in common that are formally identified together as a group.).freeze,
      label: "series".freeze,
      subClassOf: "fabio:ExpressionCollection".freeze,
      type: "owl:Class".freeze
    term :ShortStory,
      comment: %(A work of fiction that is usually written in prose, often in narrative format. This format tends to be more focused and less elaborate than longer works of fiction such as novels.).freeze,
      label: "short story".freeze,
      subClassOf: "fabio:LiteraryArtisticWork".freeze,
      type: "owl:Class".freeze
    term :Song,
      comment: %(A musical composition that contains vocal parts \('lyrics'\) that are performed \('sung'\).).freeze,
      label: "song".freeze,
      subClassOf: "fabio:MusicalComposition".freeze,
      type: "owl:Class".freeze
    term :SoundRecording,
      comment: %(The creative work of making an electrical or mechanical recording of sounds, such as the spoken voice, singing, instrumental music, animal vocalizations or sound effects. ).freeze,
      label: "sound recording".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Specification,
      comment: %(An explicit description of, or set of requirements to be satisfied by, a material, product, resource, service or standard.).freeze,
      label: "specification".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :SpecificationDocument,
      comment: %(The realization of a specification \(a standard, a workflow, etc.\).).freeze,
      label: "specification document".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Specification".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Spreadsheet,
      comment: %(An electronic form of data storage that displays a grid of rows and columns, in which each editable cell can contain alphanumeric text, a numeric value, or a formula that defines how the content of that cell is to be calculated from the content of another cell or cells.).freeze,
      label: "spreadsheet".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :StandardOperatingProcedure,
      comment: %(Clear and detailed written instructions of a prescribed step-by-step procedure to be routinely followed, and decisions to be made when undertaking a specific task, process or function, to achieve consistent performance, ensure safety and/or assure data quality.  \(Commonly abbreviated 'SOP'.\)).freeze,
      label: "standard operating procedure".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :StillImage,
      comment: %(A recorded static visual representation. This class of image includes diagrams, drawings, graphs, graphic designs, plans, maps, photographs and prints.).freeze,
      label: "still image".freeze,
      subClassOf: "fabio:Image".freeze,
      type: "owl:Class".freeze
    term :StorageMedium,
      comment: %(A device for recording information or storing data.).freeze,
      label: "storage medium".freeze,
      type: "owl:Class".freeze
    term :StructuredSummary,
      comment: %(A structured summary containing essential metadata describing a research investigation and/or the research outputs that have resulted from it, for example datasets and journal articles, structured according to some minimal information standard.  Such a structured summary can be embodied in both human-readable and machine-readable manifestations, e.g. HTML and RDF.  Such a structured summary differs from the Abstract of a journal article, in that the latter is written as a piece of continuous prose, but typically omits vital factual information about the investigation, such as when and where it was conducted, by whom, and on now many specimens or subjects.).freeze,
      label: "structured summary".freeze,
      "rdfs:seeAlso": "fabio:Abstract".freeze,
      subClassOf: ["fabio:SpecificationDocument".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:MinimalInformationStandard".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :SubjectDiscipline,
      comment: %(A concept that identifies a field of knowledge or human activity defined in a controlled vocabulary, such as Computer Science, Biology, Economics, Cookery or Swimming.).freeze,
      label: "subject discipline".freeze,
      subClassOf: ["skos:Concept".freeze, term(
          onProperty: "skos:inScheme".freeze,
          someValuesFrom: "fabio:DisciplineDictionary".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :SubjectTerm,
      comment: %(A concept that defines a term within the controlled vocabulary of a particular classification system, such as the ACM Computing Classification System or MeSH, the Medical Subject Headings, used as an annotation to describe the subject, meaning or content of an entity.).freeze,
      label: "subject term".freeze,
      subClassOf: ["skos:Concept".freeze, term(
          onProperty: "skos:inScheme".freeze,
          someValuesFrom: "fabio:TermDictionary".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Supplement,
      comment: %(A supplement to a publication such as a book, journal, magazine or newspaper, additional to the main publication.  For example, a colour supplement to a sunday newspaper, or a special supplementary issue of a journal or a journal volume containing invited articles on a special topic, or abstracts or papers presented at a scientific conference.).freeze,
      label: "supplement".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :SupplementaryInformation,
      comment: %(A file accompanying a published journal article, containing additional information of relevance to the article, typically available from the publisher's web site via a hyperlink from the journal article itself.).freeze,
      label: "supplementary information file".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :SystematicReview,
      comment: %(A literature review focused on a single question that tries to identify, appraise, select and synthesize all high quality research evidence relevant to that question. Systematic reviews of high-quality randomized controlled trials are crucial to evidence-based medicine. An understanding of systematic reviews and how to implement them in practice is becoming mandatory for all professionals involved in the delivery of health care. Systematic reviews are not limited to medicine,  and are quite common in other sciences such as psychology, educational research and sociology.).freeze,
      label: "systematic review".freeze,
      subClassOf: "fabio:Review".freeze,
      type: "owl:Class".freeze
    term :Table,
      comment: %(A graphical means of presenting data in a grid of rows and columns, within which the cells usually contain alphanumeric text or numeric values.  If included within a publication, a table typically appearing unaligned with the main body of text, with its own descriptive title.).freeze,
      label: "table".freeze,
      subClassOf: "fabio:Expression".freeze,
      type: "owl:Class".freeze
    term :TableOfContents,
      comment: %(A table listing the parts of publication such as a book or technical specification, and the pages on which these content elements start \(if the publication is printed or otherwise organized into pages\), usually listed in order of appearance.  The Table of Contents typically includes first-level headers, such as the chapter titles of a book, and may also include second- and even third-level headers.  In electronic works, the Table of Contents entries are often internally hyperlinked to the content items, so that clicking on the entry takes the reader to that item.).freeze,
      label: "table of contents".freeze,
      subClassOf: "fabio:Table".freeze,
      type: "owl:Class".freeze
    term :Taxonomy,
      comment: %(A classification arranged in a hierarchical structure of classes and subclasses, showing parent-child isA relationships, or broader_than - narrower_than relationships.).freeze,
      label: "taxonomy".freeze,
      subClassOf: "fabio:ControlledVocabulary".freeze,
      type: "owl:Class".freeze
    term :TechnicalReport,
      comment: %(A report of a technical nature.).freeze,
      label: "technical report".freeze,
      subClassOf: "fabio:Report".freeze,
      type: "owl:Class".freeze
    term :TechnicalStandard,
      comment: %(An official or public specification of, or requirement for, a technical method, practice, process or protocol that is involved in, for example, manufacturing, computation, electronic communication, or digital media.).freeze,
      label: "technical standard".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :TermDictionary,
      comment: %(A controlled vocabulary, usually referring to terms within a particular classification system, such as the ACM Computing Classification System or MeSH, the Medical Subject Headings, or a controlled vocabulary of disciplines.).freeze,
      "dc11:description": "A term dictionary is a collection of subject terms.".freeze,
      label: "term dictionary".freeze,
      subClassOf: ["skos:ConceptScheme".freeze, term(
          allValuesFrom: "fabio:SubjectTerm".freeze,
          onProperty: "fabio:isSchemeOf".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Textbook,
      comment: %(A book containing instructional material relating to a particular topic of academic study, designed to be read by students.).freeze,
      label: "textbook".freeze,
      subClassOf: ["fabio:Book".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:InstructionalWork".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :Thesaurus,
      comment: %(A type of controlled vocabulary used in information retrieval applications for indexing or tagging purposes, in which relationships between terms are made explicit. These are normally hierarchical relationships \(is-a, subsumption; e.g. a cow is a mammal\), equivalency relationships relating non-preferred terms to preferred terms \(e.g. pitch and frequency\), or associative relationships, in which the relationship that exists is neither one of hierarchy or equivalence, but rather one of similarity \(e.g. sports and leisure pursuits\).).freeze,
      label: "thesaurus".freeze,
      subClassOf: "fabio:ControlledVocabulary".freeze,
      type: "owl:Class".freeze
    term :Thesis,
      comment: %(A book authored by a student containing a formal presentations of research outputs submitted for examination in completion of a course of study at an institution of higher education, to fulfil the requirements for an academic degree.  Also know as a dissertation.  [For the alternative meaning of the word 'thesis', namely the formulation of a concept, hypothesis, idea, point of view or theory presented for review and/or discussion, use fabio:Proposition.]).freeze,
      label: "thesis".freeze,
      subClassOf: "fabio:Book".freeze,
      type: "owl:Class".freeze
    term :Timetable,
      comment: %(A tabular dataset providing information about the times and locations of a planned series of events.).freeze,
      label: "timetable".freeze,
      subClassOf: "fabio:Dataset".freeze,
      type: "owl:Class".freeze
    term :TrialReport,
      comment: %(The report of a trial, for example an experimental trial or a legal trial.).freeze,
      label: "trial report".freeze,
      subClassOf: "fabio:Report".freeze,
      type: "owl:Class".freeze
    term :Triplestore,
      comment: %(A database specifically designed for the storage and retrieval of Resource Description Framework \(RDF\) data consisting of subject-predicate-object triples.  A triple store is queried using the RDF query language SPARQL.).freeze,
      label: "triplestore".freeze,
      subClassOf: "fabio:Database".freeze,
      type: "owl:Class".freeze
    term :Tweet,
      comment: %(A posting made on the social networking site Twitter. A tweet is a text message limited to 140 characters in length, that is broadcast and readable by anyone who accesses Twitter.).freeze,
      label: "tweet".freeze,
      subClassOf: "fabio:Micropost".freeze,
      type: "owl:Class".freeze
    term :UncontrolledVocabulary,
      comment: %(A non-defined collection of words and phrases relating to a particular domain of knowledge, usually added freely by a community, in which homonyms, synonyms and similar ambiguities of meaning present in natural language are not formally disambiguated.).freeze,
      label: "uncontrolled vocabulary".freeze,
      subClassOf: "fabio:Vocabulary".freeze,
      type: "owl:Class".freeze
    term :Vocabulary,
      comment: %(A set of words, either constituting a language, or more specifically used to describe a particular domain of knowledge.).freeze,
      label: "vocabulary".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :VocabularyDocument,
      comment: %(A document containing a vocabulary).freeze,
      label: "vocabulary document".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:Vocabulary".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :VocabularyMapping,
      comment: %(A mapping of correspondences between two vocabularies.  For controlled vocabularies, such mappings may be expressed using SKOS \(http://www.w3.org/2004/02/skos/\).).freeze,
      label: "vocabulary mapping".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :VocabularyMappingDocument,
      comment: %(A document containing a vocabulary mapping).freeze,
      label: "vocabulary mapping document".freeze,
      subClassOf: ["fabio:SpecificationDocument".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#realizationOf".freeze,
          someValuesFrom: "fabio:VocabularyMapping".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :WebArchive,
      comment: %(A snapshots of \(part of\) the World Wide Web.).freeze,
      label: "web archive".freeze,
      subClassOf: "fabio:Repository".freeze,
      type: "owl:Class".freeze
    term :WebContent,
      comment: %(Information prepared specifically and primarily for manifestation in a web page, comprising text, images, datasets and/or other works.).freeze,
      label: "web content".freeze,
      subClassOf: ["fabio:Expression".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#embodiment".freeze,
          someValuesFrom: "fabio:WebManifestation".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :WebManifestation,
      comment: %(A digital manifestation on the Web, such as a wiki, a web site, a web page or a blog.).freeze,
      label: "web manifestation".freeze,
      subClassOf: "fabio:DigitalManifestation".freeze,
      type: "owl:Class".freeze
    term :WebPage,
      comment: %(A Web manifestation usually identified by a Uniform Resource Identifier \(URI\), and made accessible to a user by means of the Hypertext Transport Protocol \(HTTP\) in a Web browser window. Several interlinked web pages hosted together on a Web server and accessed through a single domain name or IP address constitute a web site.).freeze,
      label: "web page".freeze,
      subClassOf: ["fabio:Page".freeze, "fabio:WebManifestation".freeze],
      type: "owl:Class".freeze
    term :WebSite,
      comment: %(A collection of related web pages containing text, images, videos and/or other digital assets that are addressed relative to a common Uniform Resource Locator \(URL\). A web site is hosted on at least one web server, accessible via a network such as the Internet or a private local area network.).freeze,
      label: "web site".freeze,
      subClassOf: "fabio:WebManifestation".freeze,
      type: "owl:Class".freeze
    term :WhitePaper,
      comment: %(An authoritative report or guide designed to educate readers and help people make decisions, or to explain technical problems and how to solve them. White papers are typically published by governments to propose new legislation for discussion, and by commercial companies to inform readers about products or services, as aids to marketing.).freeze,
      label: "white paper".freeze,
      subClassOf: "fabio:ReportDocument".freeze,
      type: "owl:Class".freeze
    term :Wiki,
      comment: %(A collaborative Web manifestation, usually maintained by a project team or group, providing easy-to-edit pages that can be used to accumulate related information for shared use by the group and/or publication.).freeze,
      label: "wiki".freeze,
      subClassOf: "fabio:WebManifestation".freeze,
      type: "owl:Class".freeze
    term :WikiEntry,
      comment: %(Information manifested in a wiki. ).freeze,
      label: "wiki entry".freeze,
      subClassOf: ["fabio:Entry".freeze, "fabio:WebContent".freeze],
      type: "owl:Class".freeze
    term :WikipediaEntry,
      comment: %(Information about a particular topic in one of the versions of Wikipedia, the online encyclopedia \(http://www.wikipedia.org/\).
).freeze,
      label: "wikipedia entry".freeze,
      subClassOf: "fabio:WikiEntry".freeze,
      type: "owl:Class".freeze
    term :Work,
      comment: %(A subclass of FRBR work, restricted to works that are published or potentially publishable, and that contain or are referred to by bibliographic references, or entities used to define bibliographic references. FaBiO works, and their expressions and manifestations, are primarily textual publications such as books, magazines, newspapers and journals, and items of their content.  However, they also include datasets, computer algorithms, experimental protocols, formal specifications and vocabularies, legal records, governmental papers, technical and commercial reports and similar publications, and also bibliographies, reference lists, library catalogues and similar collections. For this reason, fabio:Work is not an equivalent class to frbr:ScholarlyWork.  An example of a fabio:Work is your latest research paper.).freeze,
      "dc11:description": "A fabio:Work can only have part or be part of another fabio:Work. Moreover, it can be realized only by fabio:Expression(s).".freeze,
      label: "work".freeze,
      subClassOf: ["http://purl.org/vocab/frbr/core#Work".freeze, term(
          allValuesFrom: "fabio:Expression".freeze,
          onProperty: "http://purl.org/vocab/frbr/core#realization".freeze,
          type: "owl:Restriction".freeze
        ), term(
          intersectionOf: list(term(
            allValuesFrom: "http://purl.org/vocab/frbr/core#Work".freeze,
            onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
            type: "owl:Restriction".freeze
          ), term(
            allValuesFrom: "http://purl.org/vocab/frbr/core#Work".freeze,
            onProperty: "http://purl.org/vocab/frbr/core#partOf".freeze,
            type: "owl:Restriction".freeze
          )),
          type: "owl:Class".freeze
        )],
      type: "owl:Class".freeze
    term :WorkCollection,
      "dc11:creator": "A collection of works.".freeze,
      label: "work collection".freeze,
      subClassOf: ["fabio:Work".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:Work".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze
    term :WorkPackage,
      comment: %(A component of the case for support of a grant application, describing a particular aspect of the work to be undertaken.).freeze,
      label: "work package".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :Workflow,
      comment: %(A recorded sequence of connected steps, which may be automated, specifying a reliably repeatable sequence of operations to be undertaken when conducting a particular job, for example an in silico investigation that extracts and processes information from a number of bioinformatics databases.).freeze,
      label: "workflow".freeze,
      subClassOf: "fabio:Specification".freeze,
      type: "owl:Class".freeze
    term :WorkingPaper,
      comment: %(An unpublished paper, usually circulated privately among a small group of peers, to provide information or with a request for comments or editorial improvement.).freeze,
      label: "working paper".freeze,
      subClassOf: "fabio:Work".freeze,
      type: "owl:Class".freeze
    term :WorkshopPaper,
      comment: %(A paper, typically the realization of a research paper reporting original research findings, usually presented at a workshop and published within a workshop proceedings volume.).freeze,
      label: "workshop paper".freeze,
      subClassOf: "fabio:ProceedingsPaper".freeze,
      type: "owl:Class".freeze
    term :WorkshopProceedings,
      comment: %(A document containing the programme and collected workshop papers, or their abstracts, presented at a workshop or similar event.).freeze,
      label: "workshop proceedings".freeze,
      subClassOf: ["fabio:AcademicProceedings".freeze, term(
          onProperty: "http://purl.org/vocab/frbr/core#part".freeze,
          someValuesFrom: "fabio:WorkshopPaper".freeze,
          type: "owl:Restriction".freeze
        )],
      type: "owl:Class".freeze

    # Property definitions
    property :dateLastUpdated,
      comment: %(The date on which a particular endeavour, such as an ontology, was last updated.).freeze,
      label: "date last updated".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasAccessDate,
      comment: %(The date on which a particular digital item, such as a PDF or an HTML file, has been accessed by somebody.).freeze,
      domain: "fabio:Item".freeze,
      label: "has access date".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasArXivId,
      comment: %(An identifier used by the preprint repository ArXiv.).freeze,
      isDefinedBy: "http://arxiv.org/".freeze,
      label: "has ArXiv identifier".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasCODEN,
      comment: %(A CODEN is a six character, alphanumeric bibliographic identification code, that provides concise, unique and unambiguous identification of the titles of serials and non-serial publications.).freeze,
      label: "has CODEN".freeze,
      "rdfs:seeAlso": "http://en.wikipedia.org/wiki/CODEN".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasCharacterCount,
      comment: %(The count of the number of characters in a textual resource.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has character count".freeze,
      range: "xsd:positiveInteger".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasCopyrightYear,
      comment: %(The year in which an entity has been copyrighted.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has copyright year".freeze,
      range: "xsd:gYear".freeze,
      subPropertyOf: "dc:date".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasCorrectionDate,
      comment: %(The date on which something, for example a document, is corrected.).freeze,
      label: "has correction date".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasDateCollected,
      comment: %(The date on which some item has been collected, for example the data gathered by means of questionnaires.).freeze,
      label: "has date collected".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasDateReceived,
      comment: %(The date on which some item is received, for example a document being received by a publisher.).freeze,
      label: "has date received".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasDeadline,
      comment: %(A date by which something has to be done.).freeze,
      label: "has deadline".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasDecisionDate,
      comment: %(The date on which a particular endeavour, such as a grant application, has been or will be approved or rejected by somebody.).freeze,
      label: "has decision date".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasDepositDate,
      comment: %(The date on which an entity has been deposited, for example in a library, repository, supplementary information archive, database or similar place of document or information storage.).freeze,
      domain: "fabio:Item".freeze,
      label: "has deposit date".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasDiscipline,
      comment: %(The discipline to which a subject vocabulary belongs.).freeze,
      domain: term(
          type: "owl:Class".freeze,
          unionOf: list("fabio:TermDictionary".freeze, term(
            type: "owl:Class".freeze
          ))
        ),
      inverseOf: "fabio:isDisciplineOf".freeze,
      label: "has discipline".freeze,
      "owl:propertyDisjointWith": "fabio:isSchemeOf".freeze,
      range: "fabio:SubjectDiscipline".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasDistributionDate,
      comment: %(The date on which something is distributed, for example the date on which a preprint of a document is e-mailed to colleagues and other academics by the author\(s\), or the date on which a printed announcement of forthcoming theatre events is mailed to those those on the theatre's mailing list.).freeze,
      label: "has preprint dissemination date".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasElectronicArticleIdentifier,
      comment: %(A local identifier for an article within an electronic \(i.e. on line, in HTML format\) periodical issue.  Use in preference to prism:startingPage when the article lacks page numbers).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has electronic article identifier".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasEmbargoDate,
      comment: %(The date before which an entity should not be published, or before which a press release should not be reported on.  For open-access journal articles, the embargo date is the date before which availability of the open-access version of the article is restricted by the publisher, following subscription-access availability of the published work.  The duration of the embargo period can be specified by fabio:hasEmbargoDuration.).freeze,
      label: "has embargo date".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasEmbargoDuration,
      comment: %(The time period for which an entity is embargoed.  During this period, the entity should not be published or, in the case of a press release, should not be reported on.  For open-access journal articles, the embargo duration specifies that period of time during which availability of the open-access version of the article is delayed by the publisher, following subscription-access availability of the published work.  The end of the embargo period can be specified by fabio:hasEmbargoDate.).freeze,
      label: "has embargo period".freeze,
      subPropertyOf: "dc:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasHandle,
      comment: %(A persistent identifier of the Handel system for digital objects and other resources on the Internet.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      isDefinedBy: "http://www.handle.net/".freeze,
      label: "has handle".freeze,
      range: "xsd:string".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasIssnL,
      comment: %(A linking International Standard Serial Number.).freeze,
      isDefinedBy: "http://www.issn.org/2-22637-What-is-an-ISSN-L.php".freeze,
      label: "has ISSN-L".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasManifestation,
      comment: %(A property linking a particular work to its manifestations.  This property is additional to the relationships between FRBR endeavours present in the classical FRBR data model.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Work".freeze,
      inverseOf: "fabio:isManifestationOf".freeze,
      label: "has manifestation".freeze,
      "owl:propertyChainAxiom": list(term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#realization\), a property representing an expression that is an intellectual or artistic realization of a work.).freeze,
          label: "has realization".freeze,
          type: "owl:ObjectProperty".freeze
        ), term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#embodiment\), a property representing a manifestation that embodies an expression.).freeze,
          label: "has embodiment".freeze,
          type: "owl:ObjectProperty".freeze
        )),
      range: "http://purl.org/vocab/frbr/core#Manifestation".freeze,
      subPropertyOf: "http://purl.org/vocab/frbr/core#relatedEndeavour".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasNLMJournalTitleAbbreviation,
      comment: %(An internal identifier for the abbreviation of the title of journals available from the National Library of Medicine repository.).freeze,
      label: "has National Library of Medicine journal title abbreviation".freeze,
      subPropertyOf: ["dc:identifier".freeze, "fabio:hasShortTitle".freeze],
      type: "owl:DatatypeProperty".freeze
    property :hasNationalLibraryOfMedicineJournalId,
      comment: %(An internal identifier for journals available from the National Library of Medicine repository.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      isDefinedBy: "http://www.nlm.nih.gov/".freeze,
      label: "has National Library of Medicine journal identifier".freeze,
      range: term(
          "owl:onDatatype": "xsd:string".freeze,
          "owl:withRestrictions": list(term(
            "xsd:pattern": "[0-9]+".freeze
          )),
          type: "rdfs:Datatype".freeze
        ),
      subPropertyOf: "dc:identifier".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasPII,
      comment: %(Has Publisher Item Identifier).freeze,
      label: "has PII".freeze,
      "rdfs:seeAlso": "http://en.wikipedia.org/wiki/Publisher_Item_Identifier".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasPageCount,
      comment: %(The count of the number of pages in a textual resource.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has page count".freeze,
      range: "xsd:positiveInteger".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasPatentNumber,
      comment: %(A unique identifing number issued by a patent authority to identify a patent, displayed at the beginning of the patent document.).freeze,
      label: "has patent number".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasPlaceOfPublication,
      comment: %(The place \(usually, the city\) where the publisher of a particular bibliographic resource is located.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has place of publication".freeze,
      range: "http://purl.org/vocab/frbr/core#Place".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasPortrayal,
      comment: %(A property linking a particular work to its items.  This property is additional to the relationships between FRBR endeavours present in the classical FRBR data model.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Work".freeze,
      inverseOf: "fabio:isPortrayalOf".freeze,
      label: "has portrayal".freeze,
      "owl:propertyChainAxiom": list(term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#realization\), a property representing an expression that is an intellectual or artistic realization of a work.).freeze,
          label: "has realization".freeze,
          type: "owl:ObjectProperty".freeze
        ), term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#embodiment\), a property representing a manifestation that embodies an expression.).freeze,
          label: "has embodiment".freeze,
          type: "owl:ObjectProperty".freeze
        ), term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#exemplar\), a property representing an item that exemplifies a manifestation.).freeze,
          label: "has exemplar".freeze,
          type: "owl:ObjectProperty".freeze
        )),
      range: "http://purl.org/vocab/frbr/core#Item".freeze,
      subPropertyOf: "http://purl.org/vocab/frbr/core#relatedEndeavour".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasPrimarySubjectTerm,
      comment: %(This property is used to associate a frbr:Endeavour to a term in a particular classification system - and the term is considered one of the main topics for the endeavour in consideration.).freeze,
      label: "has primary subject term".freeze,
      subPropertyOf: "fabio:hasSubjectTerm".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasPubMedCentralId,
      comment: %(An identifier for bibliographic entities hosted by the PubMed Central repository.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      isDefinedBy: "http://www.ncbi.nlm.nih.gov/pmc/".freeze,
      label: "has PubMed Central identifier".freeze,
      range: "xsd:string".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasPubMedId,
      comment: %(An identifier for bibliographic records held by the PubMed repository.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      isDefinedBy: "http://www.ncbi.nlm.nih.gov/pubmed/".freeze,
      label: "has PubMed identifier".freeze,
      range: "xsd:string".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasPublicationYear,
      comment: %(The year in which a resource is published.).freeze,
      label: "has publication year".freeze,
      range: "xsd:gYear".freeze,
      subPropertyOf: "dc:issued".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasRepresentation,
      comment: %(A property linking a particular expression to its items.  This property is additional to the relationships between FRBR endeavours present in the classical FRBR data model.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Expression".freeze,
      inverseOf: "fabio:isRepresentationOf".freeze,
      label: "has representation".freeze,
      "owl:propertyChainAxiom": list(term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#embodiment\), a property representing a manifestation that embodies an expression.).freeze,
          label: "has embodiment".freeze,
          type: "owl:ObjectProperty".freeze
        ), term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#exemplar\), a property representing an item that exemplifies a manifestation.).freeze,
          label: "has exemplar".freeze,
          type: "owl:ObjectProperty".freeze
        )),
      range: "http://purl.org/vocab/frbr/core#Item".freeze,
      subPropertyOf: "http://purl.org/vocab/frbr/core#relatedEndeavour".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasRequestDate,
      comment: %(The date on which an agent is requested to do something, for example a reviewer is requested to write a review of a paper submitted to a journal for publication, or an author is requested to supply a revised version of the paper in response to the reviews received.).freeze,
      label: "has request date".freeze,
      subPropertyOf: "dc:date".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasRetractionDate,
      comment: %(The date on which something, for example a claim or a journal article, is retracted.).freeze,
      label: "has retraction date".freeze,
      range: "xsd:dateTime".freeze,
      subPropertyOf: "dc:date".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasSICI,
      comment: %(The Serial Item and Contribution Identifier is a code used to uniquely identify specific volumes, articles or other identifiable parts of a periodical. It is intended primarily for use by those members of the bibliographic community involved in the use or management of serial titles and their contributions.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      isDefinedBy: "http://www.niso.org/apps/group_public/project/details.php?project_id=75".freeze,
      label: ["has SICI".freeze, "has Serial Item and Contribution Identifier".freeze],
      range: "xsd:string".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :hasSeason,
      comment: %(Permits specification of the season of the year, for example spring, summer, autumn and winter in British English.).freeze,
      label: "has season".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasSequenceIdentifier,
      comment: %(A literal \(for example a number or a letter\) that identifies the sequence position of a work within a particular context, for example a book in a book series, a chapter in a document, a volume in a journal.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has number".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasShortTitle,
      comment: %(A short version of the title of an entity, typically used to label or refer to a particular entity in an abbreviated form, for example an abbreviated journal title in a reference, or a short title of a document used as the running title in a page header.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has short title".freeze,
      range: "xsd:string".freeze,
      subPropertyOf: "dc:title".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasStandardNumber,
      comment: %(The number defining an international standard, for example Z39.96 - 201x, identifying NISO JATS, the Journal Article Tag Suite.).freeze,
      label: "has standard number".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasSubjectTerm,
      comment: %(This property is used to associate a frbr:Endeavour to a term in a particular classification system.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has subject term".freeze,
      range: "fabio:SubjectTerm".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :hasSubtitle,
      comment: %(A secondary title that follows the main title of a work.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has subtitle".freeze,
      range: "xsd:string".freeze,
      subPropertyOf: "dc:title".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasTranslatedSubtitle,
      comment: %(A version of the subtitle of an entity translated into another language, which may be specified using the object property dcterms:language.).freeze,
      label: "has translated subtitle".freeze,
      subPropertyOf: "dc:title".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasTranslatedTitle,
      comment: %(A version of the title of an entity translated into another language, which may be specified using the object property dcterms:language.).freeze,
      label: "has translated title".freeze,
      subPropertyOf: "dc:title".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasURL,
      comment: %(An identifier, in form of an HTTP Universal Resource Locator \(URL\), for a particular resource on the World Wide Web.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has URL".freeze,
      range: "xsd:anyURI".freeze,
      subPropertyOf: "dc:identifier".freeze,
      type: "owl:DatatypeProperty".freeze
    property :hasVolumeCount,
      comment: %(The count of the number of volumes a work includes.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Endeavour".freeze,
      label: "has volume count".freeze,
      range: "xsd:nonNegativeInteger".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]
    property :isDisciplineOf,
      comment: %(This property relates a subject vocabulary to the discipline to which it belongs.).freeze,
      domain: "fabio:SubjectDiscipline".freeze,
      label: "is discipline of".freeze,
      "owl:propertyDisjointWith": "skos:inScheme".freeze,
      range: term(
          type: "owl:Class".freeze,
          unionOf: list("fabio:TermDictionary".freeze, term(
            type: "owl:Class".freeze
          ))
        ),
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :isManifestationOf,
      comment: %(A property linking a particular manifestation to the work it is manifesting.  This property is additional to the relationships between FRBR endeavours present in the classical FRBR data model.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Manifestation".freeze,
      label: "is manifestation of".freeze,
      "owl:propertyChainAxiom": list(term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#embodimentOf\), a property representing an expression that is embodied by a manifestation.).freeze,
          label: "is embodiment of".freeze,
          type: "owl:ObjectProperty".freeze
        ), term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#realizationOf\), a property representing the work that has been realized by an expression.).freeze,
          label: "is realization of".freeze,
          type: "owl:ObjectProperty".freeze
        )),
      range: "http://purl.org/vocab/frbr/core#Work".freeze,
      subPropertyOf: "http://purl.org/vocab/frbr/core#relatedEndeavour".freeze,
      type: "owl:ObjectProperty".freeze
    property :isPortrayalOf,
      comment: %(A property linking a particular item to the work it portrays.  This property is additional to the relationships between FRBR endeavours present in the classical FRBR data model.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Item".freeze,
      label: "is portrayal of".freeze,
      "owl:propertyChainAxiom": list(term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#embodimentOf\), a property representing a manifestation that is exemplified by an item.).freeze,
          label: "is exemplar of".freeze,
          type: "owl:ObjectProperty".freeze
        ), term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#embodimentOf\), a property representing an expression that is embodied by a manifestation.).freeze,
          label: "is embodiment of".freeze,
          type: "owl:ObjectProperty".freeze
        ), term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#realizationOf\), a property representing the work that has been realized by an expression.).freeze,
          label: "is realization of".freeze,
          type: "owl:ObjectProperty".freeze
        )),
      range: "http://purl.org/vocab/frbr/core#Work".freeze,
      subPropertyOf: "http://purl.org/vocab/frbr/core#relatedEndeavour".freeze,
      type: "owl:ObjectProperty".freeze
    property :isRepresentationOf,
      comment: %(A property linking a particular item to the expression it represents.  This property is additional to the relationships between FRBR endeavours present in the classical FRBR data model.).freeze,
      domain: "http://purl.org/vocab/frbr/core#Item".freeze,
      label: "is representation of".freeze,
      "owl:propertyChainAxiom": list(term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#embodimentOf\), a property representing a manifestation that is exemplified by an item.).freeze,
          label: "is exemplar of".freeze,
          type: "owl:ObjectProperty".freeze
        ), term(
          comment: %(As defined by FRBR \(http://www.ifla.org/VII/s13/frbr/frbr1.htm; http://purl.org/vocab/frbr/core#embodimentOf\), a property representing an expression that is embodied by a manifestation.).freeze,
          label: "is embodiment of".freeze,
          type: "owl:ObjectProperty".freeze
        )),
      range: "http://purl.org/vocab/frbr/core#Expression".freeze,
      subPropertyOf: "http://purl.org/vocab/frbr/core#relatedEndeavour".freeze,
      type: "owl:ObjectProperty".freeze
    property :isSchemeOf,
      comment: %(This property expresses the fact that a scheme contains a concept.).freeze,
      domain: "skos:ConceptScheme".freeze,
      inverseOf: "skos:inScheme".freeze,
      label: "is scheme of".freeze,
      range: "skos:Concept".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :isStoredOn,
      comment: %(This property relates a fabio:Item to the medium upon which it is stored.).freeze,
      domain: "fabio:Item".freeze,
      inverseOf: "fabio:stores".freeze,
      label: "is stored on".freeze,
      range: "fabio:StorageMedium".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :stores,
      comment: %(This property relates a storage medium to the fabio:Item stored upon it.).freeze,
      domain: "fabio:StorageMedium".freeze,
      label: "stores".freeze,
      range: "fabio:Item".freeze,
      subPropertyOf: "owl:topObjectProperty".freeze,
      type: "owl:ObjectProperty".freeze
    property :usesCalendar,
      comment: %(A property that identifies the calendar system used to specify a date, for example the Chinese, Gregorian, Hebrew, Islamic or Lunar calendar.).freeze,
      label: "uses calendar".freeze,
      subPropertyOf: "owl:topDataProperty".freeze,
      type: ["owl:DatatypeProperty".freeze, "owl:FunctionalProperty".freeze]

    # Extra definitions
    term :SupplementaryInformationFile,
      comment: %(A file accompanying a published journal article, containing additional information of relevance to the article, typically available from the publisher's web site via a hyperlink from the journal article itself.).freeze
    term :"analog-magnetic-tape",
      comment: %(An analog medium for magnetic recording of audio and video information, made of a thin magnetizable coating on a long, narrow plastic tape, typically wound on a spool. ).freeze,
      label: "analog magnetic tape".freeze,
      type: ["fabio:AnalogStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :cd,
      comment: %(A non-rewritable optical disc used to store digital data.).freeze,
      label: ["CD".freeze, "compact disk".freeze],
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :cloud,
      comment: %(A distributed and commoditized Internet-based computing resource, whereby shared services, software programs, and information storage facilities are provided to computers and other devices on demand, at locations of which the user may be unaware, like the electricity grid.).freeze,
      label: "cloud".freeze,
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :"digital-magnetic-tape",
      comment: %(A rewritable digital medium for magnetic recording of audio, video and other data, made of a thin magnetizable coating on a long, narrow strip of plastic, usually wound on a spool.).freeze,
      label: "digital magnetic tape".freeze,
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :dvd,
      comment: %(A non-rewritable optical disc storage medium resembling a compact disc \(CD\), usually used for video and data storage. A DVD has the same physical dimensions as a CD, but is capable of storing more than six times as much data.).freeze,
      label: ["DVD".freeze, "digital versatile disc".freeze, "digital video disc".freeze],
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :film,
      comment: %(A thin flexible strip of plastic or other material coated with light-sensitive emulsion upon which images can be recorded, typically using a camera, usually used to record photographic images or motion pictures.).freeze,
      label: "film".freeze,
      type: ["fabio:AnalogStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :"floppy-disk",
      comment: %(A rewritable data storage medium that is composed of a disk of thin, flexible \(floppy\) magnetic storage medium encased in a square or rectangular  plastic shell.  Data are encoded magnetically by a read/write head that float on a cushion of air in close proximity to the surface of the rotated disk.).freeze,
      label: "floppy disk".freeze,
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :"hard-drive",
      comment: %(A non-volatile storage device for digital data, composed of one or more rigid discs \(platters\) mounted side by side on a motor-driven spindle within a metal case. Data are encoded magnetically by read/write heads that float on cushions of air in close proximity to the surfaces of the rotated platters.).freeze,
      label: ["HD".freeze, "hard drive".freeze],
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :internet,
      comment: %(A global system of interconnected computer networks that uses the standard Internet Protocol Suite \(TCP/IP\) to serve billions of users worldwide.  The internet connects millions of private, public, academic, business and governmental computers, that are individually attached to local networks linked together by a broad array of electronic, radio and optical networking technologies to form the internet. ).freeze,
      label: "internet".freeze,
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :intranet,
      comment: %(A private computer network, unconnected to the internet or separated from it by a firewall,  that uses a network operating system and Internet Protocol technologies to permit an organization's information to be shared securely within that organization.).freeze,
      label: "intranet".freeze,
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :paper,
      comment: %(A thin flat material, typically made from wood pulp, mainly used for writing upon, for printing upon or for packaging.).freeze,
      label: "paper".freeze,
      type: ["fabio:AnalogStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :ram,
      comment: %(Abbreviation of Random Access Memory.  A form of rewritable computer data storage that takes the form of integrated circuits that allow data to be stored and accessed in any order \(i.e. at random\), thereby achieving greater speed than for access of data stored in linear form on digital magnetic tape.).freeze,
      label: ["RAM".freeze, "random access memory".freeze],
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :"solid-state-memory",
      comment: %(A digital storage device built entirely from solid electronic materials with no moving parts, e.g. a USB flash drive.).freeze,
      label: "solid state memory".freeze,
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :"vinyl-disk",
      comment: %(An analog sound storage medium consisting of a flat disc made of moulded vinyl plastic with an inscribed, modulated spiral groove.).freeze,
      label: "vinyl disk".freeze,
      type: ["fabio:AnalogStorageMedium".freeze, "owl:NamedIndividual".freeze]
    term :web,
      comment: %(A system of interlinked hypertext documents written in HTML and accessed using the HTTP protocol via the Internet.).freeze,
      label: ["WWW".freeze, "Web".freeze, "World Wide Web".freeze],
      type: ["fabio:DigitalStorageMedium".freeze, "owl:NamedIndividual".freeze]
  end
end
