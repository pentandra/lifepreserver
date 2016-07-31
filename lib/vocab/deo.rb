# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/spar/deo/
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/spar/deo/>
  #   class DEO < RDF::StrictVocabulary
  #   end
  class DEO < RDF::StrictVocabulary("http://purl.org/spar/deo/")

    # Class definitions
    term :Acknowledgements,
      comment: %(Usually part of the preface, or a separate section in its own right, often as part of the back matter, it acknowledges those, including funding agencies, who contributed to the undertaking of a research project described in a publication, or to the creation of the work in some way. In scientific articles, the acknowledgements are usually placed as a separated section immediately following the Discussion or Conclusions.).freeze,
      label: "acknowledgements".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :AuthorContribution,
      comment: %(A description of the roles played by an author in the publication.).freeze,
      label: "author contribution".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Background,
      comment: %(Presentation of information that is essential for understanding the situation or problem that is the subject of the publication. In a journal article, the background is usually part of the Introduction, but may be present as separated section.).freeze,
      label: "background".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :BibliographicReference,
      comment: %(A reference, usually contained in a footnote or a bibliographic reference list, that refer to another publication, such as a journal article, a book, a book chapter or a Web site. The inclusion of the bibliographic reference in a publication constitutes the performative act of bibliographic citation.).freeze,
      label: "bibliographic reference".freeze,
      subClassOf: ["deo:Reference".freeze, "http://purl.org/orb/1.0/References".freeze],
      type: "owl:Class".freeze
    term :Biography,
      comment: %(Information describing a person and his or her life history and contributions.).freeze,
      label: "biography".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Caption,
      comment: %(Text accompanying another item, such as a picture.).freeze,
      label: "caption".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Conclusion,
      comment: %(A reflection on the preceding text, summarizing the evidence, arguments or premises presented in the document and their logical outcomes. Conclusions are a fundamental feature in academic research publications, and may be included in the Discussion section.).freeze,
      label: "conclusion".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Contribution,
      comment: %(A description of the part that this publication plays in the overall field.).freeze,
      label: "contribution".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Data,
      comment: %(A textual description of data used or produced in the work which the document describes, or the data themselves.).freeze,
      label: "data".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :DatasetDescription,
      comment: %(Information describing a dataset held in an external database or repository and including a reference to it, such as a database ID or an accession number.).freeze,
      label: "dataset description".freeze,
      subClassOf: "deo:ExternalResourceDescription".freeze,
      type: "owl:Class".freeze
    term :Dedication,
      comment: %(Text in which the author names the person or people for whom he/she has written the document, or to whose memory it is dedicated.).freeze,
      label: "dedication".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :DiscourseElement,
      comment: %(An element of a document that carries out a rhetorical function.).freeze,
      label: "discourse element".freeze,
      subClassOf: "owl:Thing".freeze,
      type: "owl:Class".freeze
    term :Discussion,
      comment: %(An interpretation and discussion of the results obtained and an analysis of their significance, in support of conclusions. These conclusions may be part of this discussion or may be included in a separate section of the document.).freeze,
      label: "discussion".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Epilogue,
      comment: %(A piece of writing at the end of a work of literature or drama, usually used to bring closure to the work.).freeze,
      label: "epilogue".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Evaluation,
      comment: %(A consideration of the value, meaning and significance of the results obtained.).freeze,
      label: "evaluation".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :ExternalResourceDescription,
      comment: %(Information describing an external resource and including a reference to that resource.).freeze,
      label: "external resource description".freeze,
      type: "owl:Class".freeze
    term :FutureWork,
      comment: %(A proposal for new investigation to be undertaken in order to continue and advance the work described in the publication.).freeze,
      label: "future work".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Introduction,
      comment: %(An initial description which states the purpose and goals of the following writing, and, in the case of journal articles, typically includes background information on the research topic and a review of related work in the area.).freeze,
      label: "introduction".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Legend,
      comment: %(Informative text that explicitly explains another item, such as a figure or a table.).freeze,
      label: "legend".freeze,
      subClassOf: "deo:Caption".freeze,
      type: "owl:Class".freeze
    term :Materials,
      comment: %(A description in a research paper documenting the specialized materials used in the work described. This description is often combined with a description of the methods used, in a section entitled 'Methods and Materials', 'Experimental' or a related term.).freeze,
      label: "materials".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Methods,
      comment: %(A description in a research paper documenting the specialized methods used in the work described. This description is often combined with a description of the materials used, in a section entitled 'Methods and Materials', 'Experimental' or a related term.).freeze,
      label: "methods".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Model,
      comment: %(A description of a model used or produced by the work described in the publication.).freeze,
      label: "model".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Motivation,
      comment: %(A description of the justification for undertaking the work described in the publication.).freeze,
      label: "motivation".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Postscript,
      comment: %(Text added after the signature of a letter, or sometimes after the main body of an essay or book.).freeze,
      label: "postscript".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :ProblemStatement,
      :"dc11:description" => [],
      label: "problem statement".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Prologue,
      comment: %(A piece of writing at the beginning of a work of literature or drama, usually used to set the scene or to introduce the work.).freeze,
      label: "prologue".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Reference,
      comment: %(A reference to a specific part of the document, or to another publication.).freeze,
      label: "reference".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :RelatedWork,
      comment: %(The authors' critical review of current knowledge by specific reference to others' work, both in terms of substantive findings and theoretical and methodological contributions to a particular topic. This description is often included within the introduction section.).freeze,
      label: "related work".freeze,
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Results,
      comment: %(The report of the specific findings of an investigation, given without discussion or conclusion being drawn.).freeze,
      label: "results".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :Scenario,
      comment: %(A presentation of a use case or test, based on a real or hypothetical situation, used to help someone think through a complex problem or system.).freeze,
      label: "scenario".freeze,
      :"owl:equivalentClass" => [],
      subClassOf: "deo:DiscourseElement".freeze,
      type: "owl:Class".freeze
    term :SupplementaryInformationDescription,
      comment: %(Information describing supplementary information relating to the document, including references or links to the relevant supplementary information.).freeze,
      label: "supplementary information description".freeze,
      subClassOf: "deo:ExternalResourceDescription".freeze,
      type: "owl:Class".freeze
  end
end
