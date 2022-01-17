# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/spar/doco/
require 'rdf'
module LifePreserver::Vocab
  DOCO = Class.new(RDF::StrictVocabulary("http://purl.org/spar/doco/")) do

    # Ontology definition
    ontology :"http://purl.org/spar/doco/",
      comment: ["The Document Components Ontology (DoCO) in an ontology that provides a structured vocabulary written of document components, both structural (e.g., block, inline, paragraph, section, chapter) and rhetorical (e.g., introduction, discussion, acknowledgements, reference list, figure, appendix).\n\n**URL:** http://purl.org/spar/doco\n\n**Creators**: [David Shotton](http://orcid.org/0000-0001-5506-523X), [Silvio Peroni](http://orcid.org/0000-0003-0530-4305)\n\n**License:** [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/legalcode)\n\n**Website:** http://www.sparontologies.net/ontologies/doco\n\n**Cite as:** Constantin, A., Peroni, S., Pettifer, S., Shotton, D., Vitali, F. (2016). The Document Components Ontology (DoCO). In Semantic Web, 7 (2): 167-181. DOI: http://dx.doi.org/10.3233/SW-150177".freeze, "This ontology is available at http://purl.org/spar/doco, and uses the namespace prefix doco.".freeze],
      "http://purl.org/dc/elements/1.1/creator": ["David Shotton".freeze, "Silvio Peroni".freeze],
      "http://purl.org/dc/elements/1.1/date": "2015-07-03".freeze,
      "http://purl.org/dc/elements/1.1/description": ["DoCO, the Document Components Ontology, provides a structured vocabulary written in OWL 2 DL of document components, both structural (e.g. block, inline, paragraph, section, chapter) and rhetorical (e.g. introduction, discussion, acknowledgements, reference list, figure, appendix), enabling these components, and documents composed of them, to be described in RDF. It imports the Discourse Elements Ontology (http://purl.org/spar/deo) and the Document Structural Patterns Ontology (http://purl.org/spar/po), and uses seven rhetorical block elements abstracted from the SALT Rhetorical Ontology and the Ontology of Rhetorical Blocks (ORB).".freeze, "http://purl.org/spar/doco/doco%20architecture.png".freeze],
      "http://purl.org/dc/elements/1.1/rights": "This work is distributed under a Creative Commons Attribution License (http://creativecommons.org/licenses/by/3.0/).".freeze,
      "http://purl.org/dc/elements/1.1/title": "DoCO, the Document Components Ontology".freeze,
      "http://www.w3.org/2002/07/owl#imports": ["http://purl.org/spar/deo".freeze, "http://purl.org/spar/po".freeze],
      "http://www.w3.org/2002/07/owl#priorVersion": "https://svn.code.sf.net/p/sempublishing/code/DoCO/2014-05-14_doco-1_2.owl".freeze,
      "http://www.w3.org/2002/07/owl#versionIRI": "http://purl.org/spar/doco/2015-07-03".freeze,
      "http://www.w3.org/2002/07/owl#versionInfo": "1.3".freeze,
      type: "http://www.w3.org/2002/07/owl#Ontology".freeze

    # Class definitions
    term :Abstract,
      comment: "A brief summary of a book, a research article, thesis, review, conference proceeding or any in-depth analysis of a particular subject or discipline, the purpose of which is to help the reader quickly ascertain the publication's purpose.".freeze,
      equivalentClass: "http://salt.semanticauthoring.org/ontologies/sro#Abstract".freeze,
      label: "abstract".freeze,
      subClassOf: term(
          intersectionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze,
            unionOf: list("http://purl.org/spar/doco/Chapter".freeze, "http://purl.org/spar/doco/Section".freeze)
          ), term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze,
              unionOf: list("http://purl.org/spar/doco/BodyMatter".freeze, "http://purl.org/spar/doco/FrontMatter".freeze)
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Afterword,
      comment: "A literary device that is often found at the end of a piece of literature. It generally covers the story of how the book came into being, or how the idea for the book was developed. Alternatively, it may be written by someone other than the author of the book, and may discuss the work's historical or cultural context, if the work is being reissued many years after its original publication.".freeze,
      label: "afterword".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: "http://purl.org/spar/doco/BackMatter".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Appendix,
      comment: "A supplemental addition to the main work. It may contain data, more detailed information about methods and materials, or provide additional detail concerning the information found in the main work.".freeze,
      label: "appendix".freeze,
      subClassOf: term(
          intersectionOf: list(term(
            intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: "http://purl.org/spar/doco/BackMatter".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :BackMatter,
      comment: "The final principle part of a document, in which is usually found the bibliography, index, appendixes, etc.".freeze,
      label: "back matter".freeze,
      subClassOf: [term(
          allValuesFrom: term(
            "http://www.w3.org/2002/07/owl#complementOf": term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze,
              unionOf: list("http://purl.org/spar/doco/BackMatter".freeze, "http://purl.org/spar/doco/BodyMatter".freeze, "http://purl.org/spar/doco/FrontMatter".freeze)
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          onProperty: "http://www.essepuntato.it/2008/12/pattern#isContainedBy".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          intersectionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :BibliographicReferenceList,
      comment: "A list, usually within a bibliography, of all the references within the citing document that refer to  journal articles, books, book chapters, Web sites or similar publications.".freeze,
      label: "bibliographic reference list".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/ListOfReferences".freeze, term(
            onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
            someValuesFrom: "http://purl.org/spar/deo/BibliographicReference".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Bibliography,
      comment: "A document section containing a list of bibliographic references.".freeze,
      label: "bibliography".freeze,
      subClassOf: term(
          intersectionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze,
            unionOf: list("http://purl.org/spar/doco/Chapter".freeze, "http://purl.org/spar/doco/Section".freeze)
          ), term(
            onProperty: "http://purl.org/dc/terms/hasPart".freeze,
            someValuesFrom: "http://purl.org/spar/deo/BibliographicReference".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :BlockQuotation,
      comment: "A block quotation (also known as a long quotation or extract) is a quotation in a written document which is set off from the main text as a container for distinct paragraphs, which is typically distinguished visually using indentation, a different font, or smaller size. Block quotations are used for longer passages than run-in quotations (which are set off with quotation marks).".freeze,
      label: "block quotation".freeze,
      subClassOf: "http://www.essepuntato.it/2008/12/pattern#Container".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :BodyMatter,
      comment: "The central principle part of a document, that contains the real content. It may be subdivided hierarchically by the use of chapters and sections.".freeze,
      label: "body matter".freeze,
      subClassOf: [term(
          allValuesFrom: term(
            "http://www.w3.org/2002/07/owl#complementOf": term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze,
              unionOf: list("http://purl.org/spar/doco/BackMatter".freeze, "http://purl.org/spar/doco/BodyMatter".freeze, "http://purl.org/spar/doco/FrontMatter".freeze)
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          onProperty: "http://www.essepuntato.it/2008/12/pattern#isContainedBy".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          intersectionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :CaptionedBox,
      comment: "A rectangle space within a page that contains an object and its related caption.".freeze,
      label: "captioned box".freeze,
      subClassOf: term(
          intersectionOf: list(term(
            intersectionOf: list(term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ), term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            onProperty: "http://purl.org/dc/terms/hasPart".freeze,
            someValuesFrom: "http://purl.org/spar/deo/Caption".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Chapter,
      comment: "A principle division of the body matter of a large document, such as a book, a report or a legislative document.".freeze,
      label: "chapter".freeze,
      subClassOf: [term(
          intersectionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ), term(
          onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
          someValuesFrom: term(
            "http://www.w3.org/2002/07/owl#complementOf": "http://purl.org/spar/doco/Chapter".freeze,
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
          someValuesFrom: term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze,
            unionOf: list("http://purl.org/spar/doco/Paragraph".freeze, "http://purl.org/spar/doco/Section".freeze)
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ChapterLabel,
      comment: "A block containing a label for the chapter, that may include the chapter number.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/spar/doco/SectionLabel".freeze,
      label: "chapter label".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/Label".freeze, term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: "http://purl.org/spar/doco/Chapter".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ChapterSubtitle,
      comment: "The subtitle of a chapter.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/spar/doco/SectionSubtitle".freeze,
      label: "chapter subtitle".freeze,
      subClassOf: ["http://purl.org/spar/doco/Subtitle".freeze, term(
          onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
          someValuesFrom: "http://purl.org/spar/doco/Chapter".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ChapterTitle,
      comment: "The title of a chapter.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/spar/doco/SectionTitle".freeze,
      label: "chapter title".freeze,
      subClassOf: ["http://purl.org/spar/doco/Title".freeze, term(
          onProperty: "http://www.essepuntato.it/2008/12/pattern#isContainedByAsHeader".freeze,
          someValuesFrom: "http://purl.org/spar/doco/Chapter".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Colophon,
      comment: "A brief description of publication or production notes relevant to the document.".freeze,
      label: "colophon".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze,
              unionOf: list("http://purl.org/spar/doco/BackMatter".freeze, "http://purl.org/spar/doco/FrontMatter".freeze)
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ComplexRunInQuotation,
      comment: "A quotation with a complex structure, that is included inline and is usually enclosed within quotation marks.".freeze,
      label: "complex run-in quotation".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, "http://www.essepuntato.it/2008/12/pattern#Popup".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Figure,
      comment: "A communication object comprising one or more graphics, drawings, images, or other visual representations..".freeze,
      label: "figure".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ))
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :FigureBox,
      comment: "A space within a document that contains a figure and its caption.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/spar/doco/TableBox".freeze,
      label: "figure box".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/CaptionedBox".freeze, term(
            onProperty: "http://purl.org/dc/terms/hasPart".freeze,
            someValuesFrom: "http://purl.org/spar/doco/Figure".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :FigureLabel,
      comment: "A block containing a label for the figure box, that may include the figure number.".freeze,
      label: "figure label".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/Label".freeze, term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: "http://purl.org/spar/doco/FigureBox".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Footnote,
      comment: "A structure within a sentence that permits the author to make a comment or to cite another publication in support of the text, or both. A footnote is normally flagged by a superscript number immediately following that portion of the text to which it relates. For convenience of reading, the text of the footnote is usually printed at the bottom of the page or at the end of a text.".freeze,
      label: "footnote".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ))
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Foreword,
      comment: "A section in a book or report, usually written by someone other than the author, that introduces or commends the document to the reader. It may include description of the interaction between the writer of the foreword and the author.".freeze,
      label: "foreword".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: "http://purl.org/spar/doco/FrontMatter".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Formula,
      comment: "A unit of information expressed in mathematical, chemical or logical symbols and language.".freeze,
      label: "formula".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, "http://www.essepuntato.it/2008/12/pattern#Popup".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :FormulaBox,
      comment: "A space within a document that contains one or more formulae.".freeze,
      label: "formula box".freeze,
      subClassOf: term(
          intersectionOf: list(term(
            intersectionOf: list(term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ), term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            onProperty: "http://purl.org/dc/terms/hasPart".freeze,
            someValuesFrom: "http://purl.org/spar/doco/Formula".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :FrontMatter,
      comment: "The initial principle part of a document, usually containing self-referential metadata. In a book, this typically includes its title, authors, publisher, publication date, ISBN and copyright declaration, together with the preface, foreword, table of content, etc. In a journal article, the front matter is normally restricted to the title, authors and the authors' affiliation details, although the latter may alternatively be included in a footnote or the back matter. In books, the front matter pages may be numbered in lowercase Roman numerals.".freeze,
      equivalentClass: "http://purl.org/orb/1.0/Header".freeze,
      label: "front matter".freeze,
      subClassOf: [term(
          allValuesFrom: term(
            "http://www.w3.org/2002/07/owl#complementOf": term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze,
              unionOf: list("http://purl.org/spar/doco/BackMatter".freeze, "http://purl.org/spar/doco/BodyMatter".freeze, "http://purl.org/spar/doco/FrontMatter".freeze)
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          onProperty: "http://www.essepuntato.it/2008/12/pattern#isContainedBy".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          intersectionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Glossary,
      comment: "A set of definitions of words or phrases of importance to the work, normally alphabetized. In longer works of fiction, the entries may contains places and characters.".freeze,
      label: "glossary".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze,
              unionOf: list("http://purl.org/spar/doco/BackMatter".freeze, "http://purl.org/spar/doco/FrontMatter".freeze)
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Index,
      comment: "A section containing a list of references to information on the named topic of importance to the content of the document. The references may be to page numbers, paragraph numbers, section numbers or chapter numbers within the document.".freeze,
      label: "index".freeze,
      subClassOf: [term(
          intersectionOf: list(term(
            intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: "http://purl.org/spar/doco/BackMatter".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ), term(
          onProperty: "http://purl.org/dc/terms/hasPart".freeze,
          someValuesFrom: term(
            intersectionOf: list("http://purl.org/spar/doco/ListOfReferences".freeze, term(
              allValuesFrom: term(
                onProperty: "http://purl.org/dc/terms/relation".freeze,
                someValuesFrom: "http://purl.org/spar/doco/TextChunk".freeze,
                type: "http://www.w3.org/2002/07/owl#Restriction".freeze
              ).freeze,
              onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
              type: "http://www.w3.org/2002/07/owl#Restriction".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Label,
      comment: "A block containing text, that may include a number (e.g., \"Chapter Three\", \"3.2\", \"Figure 1\", \"Table\"), used to identify an item within the document, for example a chapter, a figure, a section or a table.".freeze,
      label: "label".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, term(
          onProperty: "http://www.essepuntato.it/2008/12/pattern#isContainedBy".freeze,
          someValuesFrom: term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze,
            unionOf: list(term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ), term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ))
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Line,
      comment: "A line in poetry is a unit of language into which a poem is divided which operates on principles which are distinct from and not necessarily coincident with grammatical structures, such as the sentence or clauses in sentences.\n\nA distinct numbered group of lines in verse is normally called a stanza.".freeze,
      label: "line".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, "http://www.essepuntato.it/2008/12/pattern#Block".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :List,
      comment: "An enumeration of items.".freeze,
      label: "list".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, term(
          allValuesFrom: term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze,
            unionOf: list(term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ), term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ), term(
              intersectionOf: list(term(
                type: "http://www.w3.org/2002/07/owl#Class".freeze
              ), term(
                "http://www.w3.org/2002/07/owl#complementOf": term(
                  type: "http://www.w3.org/2002/07/owl#Class".freeze,
                  unionOf: list(term(
                    type: "http://www.w3.org/2002/07/owl#Class".freeze
                  ), term(
                    type: "http://www.w3.org/2002/07/owl#Class".freeze
                  ))
                ).freeze,
                type: "http://www.w3.org/2002/07/owl#Class".freeze
              )),
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ))
          ).freeze,
          onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          intersectionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
            someValuesFrom: "http://www.essepuntato.it/2008/12/pattern#Pattern".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ListOfAgents,
      comment: "A list of items each denoting an agent, such as an author, a contributor or an organization, related to a particular publication.".freeze,
      "http://www.w3.org/2002/07/owl#disjointWith": "http://purl.org/spar/doco/ListOfReferences".freeze,
      label: "list of agents".freeze,
      subClassOf: "http://purl.org/spar/doco/List".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ListOfAuthors,
      comment: "A list of items each denoting an author of a particular publication.".freeze,
      label: "list of authors".freeze,
      subClassOf: "http://purl.org/spar/doco/ListOfAgents".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ListOfContributors,
      comment: "A list of items, each denoting a contributor to a publication such as an encyclopedia or a text book, where such contributions are insufficient to warrant classification as author.".freeze,
      label: "list of contributors".freeze,
      subClassOf: "http://purl.org/spar/doco/ListOfAgents".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ListOfFigures,
      comment: "A section of the document listing all the figures, identified by their titles and referenced to their locations in the document. May also be referred to as 'List of illustrations'.".freeze,
      label: "list of figures".freeze,
      subClassOf: [term(
          intersectionOf: list(term(
            intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze,
              unionOf: list("http://purl.org/spar/doco/BackMatter".freeze, "http://purl.org/spar/doco/FrontMatter".freeze)
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ), term(
          onProperty: "http://purl.org/dc/terms/hasPart".freeze,
          someValuesFrom: term(
            intersectionOf: list("http://purl.org/spar/doco/ListOfReferences".freeze, term(
              allValuesFrom: term(
                onProperty: "http://purl.org/dc/terms/relation".freeze,
                someValuesFrom: "http://purl.org/spar/doco/FigureBox".freeze,
                type: "http://www.w3.org/2002/07/owl#Restriction".freeze
              ).freeze,
              onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
              type: "http://www.w3.org/2002/07/owl#Restriction".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ListOfOrganizations,
      comment: "A list of items, each denoting an organization or institution related to the publication, for example the authors' affiliations, or the suppliers of information, software, equipment or consumables used in the work described in the publication.".freeze,
      label: "list of organizations".freeze,
      subClassOf: "http://purl.org/spar/doco/ListOfAgents".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ListOfReferences,
      comment: "A list of items each representing a reference to a specific part of the same document, or to another publication.".freeze,
      label: "list of references".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/List".freeze, term(
            allValuesFrom: "http://purl.org/spar/deo/Reference".freeze,
            onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :ListOfTables,
      comment: "A section of the document listing all the tables, identified by their titles and referenced to their locations in the document.".freeze,
      label: "list of tables".freeze,
      subClassOf: [term(
          intersectionOf: list(term(
            intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze,
              unionOf: list("http://purl.org/spar/doco/BackMatter".freeze, "http://purl.org/spar/doco/FrontMatter".freeze)
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ), term(
          onProperty: "http://purl.org/dc/terms/hasPart".freeze,
          someValuesFrom: term(
            intersectionOf: list("http://purl.org/spar/doco/ListOfReferences".freeze, term(
              allValuesFrom: term(
                onProperty: "http://purl.org/dc/terms/relation".freeze,
                someValuesFrom: "http://purl.org/spar/doco/TableBox".freeze,
                type: "http://www.w3.org/2002/07/owl#Restriction".freeze
              ).freeze,
              onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
              type: "http://www.w3.org/2002/07/owl#Restriction".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Paragraph,
      comment: "A self-contained unit of discourse that deals with a particular point or idea. Paragraphs contains one or more sentences. The start of a paragraph is indicated by beginning on a new line, which may be indented or separated by a small vertical space by the preceding paragraph. ".freeze,
      label: "paragraph".freeze,
      subClassOf: term(
          intersectionOf: list(term(
            intersectionOf: list(term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ), term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
            someValuesFrom: "http://purl.org/spar/doco/Sentence".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Part,
      comment: "A container of a semantic subdivision of a document. For example, chapters of a novel may be grouped into distinct parts that may be named 'Part 1', 'Part 2', etc., 'Book 1', 'Book 2', etc., or 'Genesis', 'Exodus', etc.".freeze,
      label: "part".freeze,
      subClassOf: term(
          intersectionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Preface,
      comment: "A section describing how the document came into being, or how the idea for it was developed. The preface may contains acknowledgements. The preface to a later edition of the work often explains in what respect that edition differs from previous ones.".freeze,
      label: "preface".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: "http://purl.org/spar/doco/FrontMatter".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Section,
      comment: "A logical division of the text, usually numbered and/or titled, which may contain subsections.".freeze,
      label: "section".freeze,
      subClassOf: [term(
          intersectionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ), term(
          onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
          someValuesFrom: term(
            "http://www.w3.org/2002/07/owl#complementOf": "http://purl.org/spar/doco/Chapter".freeze,
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
          someValuesFrom: term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze,
            unionOf: list("http://purl.org/spar/doco/Paragraph".freeze, "http://purl.org/spar/doco/Section".freeze)
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SectionLabel,
      comment: "A block containing a label for the section, that may include the section number.".freeze,
      label: "section label".freeze,
      subClassOf: ["http://purl.org/spar/doco/Label".freeze, term(
          onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
          someValuesFrom: "http://purl.org/spar/doco/Section".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SectionSubtitle,
      comment: "The subtitle of a section.".freeze,
      label: "section subtitle".freeze,
      subClassOf: ["http://purl.org/spar/doco/Subtitle".freeze, term(
          onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
          someValuesFrom: "http://purl.org/spar/doco/Section".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SectionTitle,
      comment: "The title of a section.".freeze,
      label: "section title".freeze,
      subClassOf: ["http://purl.org/spar/doco/Title".freeze, term(
          onProperty: "http://www.essepuntato.it/2008/12/pattern#isContainedByAsHeader".freeze,
          someValuesFrom: "http://purl.org/spar/doco/Section".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Sentence,
      comment: "An expression in natural language forming a single grammatical unit. A sentence minimally consists of a subject and an intransitive verb, or a subject, a transitive verb and an object, and may include additional dependent clauses. In written text, a sentence is always terminated by a full stop. A sentence can include words grouped meaningfully to express a statement, a question, an exclamation, a request or a command.".freeze,
      label: "sentence".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, "http://www.essepuntato.it/2008/12/pattern#Inline".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :SimpleRunInQuotation,
      comment: "A textual quotation that is included inline and is usually enclosed within quotation marks.".freeze,
      label: "simple run-in quotation".freeze,
      subClassOf: "http://www.essepuntato.it/2008/12/pattern#Inline".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Stanza,
      comment: "A unit within a larger poem. A stanza consists of a grouping of lines, set off by a vertical space from other stanzas, that usually has a set pattern of meter and rhyme.".freeze,
      label: "stanza".freeze,
      subClassOf: term(
          intersectionOf: list(term(
            intersectionOf: list(term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            ), term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            allValuesFrom: "http://purl.org/spar/doco/Line".freeze,
            onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Subtitle,
      comment: "An explanatory or alternative title of a publication. For example, Mary Shelley uses the alternative title 'The Modern Prometheus' to hint at the theme of her most famous novel 'Frankenstein'; Nick Efford uses the subtitle 'a practical introduction using Java' to qualify the title of his book 'Digital Image Processing'.".freeze,
      label: "subtitle".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, "http://www.essepuntato.it/2008/12/pattern#Block".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Table,
      comment: "A set of data arranged in cells within rows and columns.".freeze,
      label: "table".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, "http://www.essepuntato.it/2008/12/pattern#Table".freeze, term(
          onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
          someValuesFrom: "http://www.essepuntato.it/2008/12/pattern#Container".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :TableBox,
      comment: "A space within a document that contains a table and its caption.".freeze,
      label: "table box".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/CaptionedBox".freeze, term(
            onProperty: "http://purl.org/dc/terms/hasPart".freeze,
            someValuesFrom: "http://purl.org/spar/doco/Table".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :TableLabel,
      comment: "A block containing a label for the table box, that may include the table number.".freeze,
      label: "table label".freeze,
      subClassOf: term(
          intersectionOf: list("http://purl.org/spar/doco/Label".freeze, term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: "http://purl.org/spar/doco/TableBox".freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ),
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :TableOfContents,
      comment: "A section of the document listing all the chapters and sections, identified by their titles and referenced to their locations in the document. The table of contents may include a list of the front-matter and back-matter items, in addition to the body-matter items.  Where the document is a journal or magazine issue, the table of content lists the constituent items contained in that issue, typically by title, authors and first page number.".freeze,
      label: "table of contents".freeze,
      subClassOf: [term(
          intersectionOf: list("http://purl.org/spar/doco/Section".freeze, term(
            onProperty: "http://purl.org/dc/terms/isPartOf".freeze,
            someValuesFrom: term(
              type: "http://www.w3.org/2002/07/owl#Class".freeze,
              unionOf: list("http://purl.org/spar/doco/BackMatter".freeze, "http://purl.org/spar/doco/FrontMatter".freeze)
            ).freeze,
            type: "http://www.w3.org/2002/07/owl#Restriction".freeze
          )),
          type: "http://www.w3.org/2002/07/owl#Class".freeze
        ), term(
          onProperty: "http://purl.org/dc/terms/hasPart".freeze,
          someValuesFrom: term(
            intersectionOf: list("http://purl.org/spar/doco/ListOfReferences".freeze, term(
              allValuesFrom: term(
                onProperty: "http://purl.org/dc/terms/relation".freeze,
                someValuesFrom: "http://purl.org/spar/doco/Section".freeze,
                type: "http://www.w3.org/2002/07/owl#Restriction".freeze
              ).freeze,
              onProperty: "http://www.essepuntato.it/2008/12/pattern#contains".freeze,
              type: "http://www.w3.org/2002/07/owl#Restriction".freeze
            )),
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ).freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :TextBox,
      comment: "A space within a document that contains textual content relating to, quoting from or expanding upon the main text. Usually a textbox is delimited by a border or use of a background colour distinct from that of the main text.".freeze,
      label: "text box".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, "http://www.essepuntato.it/2008/12/pattern#Container".freeze],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :TextChunk,
      comment: "A piece of text defined by a start point and an end point.".freeze,
      label: "text chunk".freeze,
      subClassOf: "http://www.essepuntato.it/2008/12/pattern#Inline".freeze,
      type: "http://www.w3.org/2002/07/owl#Class".freeze
    term :Title,
      comment: "A word, phrase or sentence that precedes and indicates the subject of a document or a document component - e.g., a book, a report, a news article, a chapter, a section or a table.".freeze,
      label: "title".freeze,
      subClassOf: ["http://purl.org/spar/deo/DiscourseElement".freeze, term(
          onProperty: "http://www.essepuntato.it/2008/12/pattern#isContainedByAsHeader".freeze,
          someValuesFrom: "http://www.essepuntato.it/2008/12/pattern#HeadedContainer".freeze,
          type: "http://www.w3.org/2002/07/owl#Restriction".freeze
        ), term(
          type: "http://www.w3.org/2002/07/owl#Class".freeze,
          unionOf: list(term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ), term(
            type: "http://www.w3.org/2002/07/owl#Class".freeze
          ))
        )],
      type: "http://www.w3.org/2002/07/owl#Class".freeze
  end
end
