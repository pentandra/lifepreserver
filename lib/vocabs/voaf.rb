# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/vocommons/voaf#
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/vocommons/voaf#>
  #   class VOAF < RDF::StrictVocabulary
  #   end
  class VOAF < RDF::StrictVocabulary("http://purl.org/vocommons/voaf#")

    # Ontology definition
    ontology :"http://purl.org/vocommons/voaf",
      :"cc:license" => %(http://creativecommons.org/licenses/by/3.0/).freeze,
      :"dc:contributor" => [%(http://data.semanticweb.org/person/lise-rozat).freeze, %(http://data.semanticweb.org/person/pierre-yves-vandenbussche).freeze],
      :"dc:creator" => %(http://data.semanticweb.org/person/bernard-vatant).freeze,
      :"dc:description" => %(A vocabulary to describe linked data vocabularies and their relations.).freeze,
      :"dc:issued" => %(2011-03-11).freeze,
      :"dc:modified" => %(2013-05-24).freeze,
      :"dc:publisher" => %(http://dbpedia.org/resource/Open_Knowledge_Foundation).freeze,
      :"dc:title" => %(Vocabulary of a Friend).freeze,
      :"http://purl.org/vocab/frbr/core#realization" => [%(http://purl.org/vocommons/voaf/v1.0).freeze, %(http://purl.org/vocommons/voaf/v1.1).freeze, %(http://purl.org/vocommons/voaf/v2.0).freeze, %(http://purl.org/vocommons/voaf/v2.1).freeze, %(http://purl.org/vocommons/voaf/v2.2).freeze, %(http://purl.org/vocommons/voaf/v2.3).freeze],
      :"http://purl.org/vocab/vann/preferredNamespacePrefix" => %(voaf).freeze,
      :"http://purl.org/vocab/vann/preferredNamespaceUri" => %(http://purl.org/vocommons/voaf#).freeze,
      type: ["owl:Ontology".freeze, "voaf:Vocabulary".freeze],
      :"voaf:exampleDataset" => %(http://lov.okfn.org/dataset/lov/lov.rdf).freeze

    # Class definitions
    term :DatasetOccurrences,
      comment: %(Class used to store the number of occurences of a vocabulary in a particular dataset).freeze,
      label: "Dataset occurrences".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:Class".freeze,
      :"vs:term_status" => %(testing).freeze
    term :Vocabulary,
      comment: %(A vocabulary used in the linked data cloud. An instance of voaf:Vocabulary relies on or is used by at least another instance of voaf:Vocabulary).freeze,
      label: "Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      subClassOf: ["http://purl.org/vocab/frbr/core#Work".freeze, "void:Dataset".freeze],
      type: "owl:Class".freeze,
      :"vs:term_status" => %(stable).freeze
    term :VocabularySpace,
      comment: %(A vocabulary space defines any relevant grouping of vocabularies e.g., designed for similar purposes or domains, or designed by the same publisher or the same project, etc.
          A vocabulary can belong to zero, one or more vocabulary spaces.Dublin Core properties isPartOf and hasPart are used to link a vocabulary to a vocabulary space.).freeze,
      label: "Vocabulary Space".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:Class".freeze,
      :"vs:term_status" => %(testing).freeze

    # Property definitions
    property :classNumber,
      comment: %(The number of classes defined in the vocabulary namespace. Classes imported from other namespaces are not taken into account.).freeze,
      :"dc:description" => %(
		PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
		PREFIX owl:<http://www.w3.org/2002/07/owl#>
		PREFIX voaf:<http://purl.org/vocommons/voaf#>
		
		CONSTRUCT{
		?vocab voaf:classNumber ?nbClass
		}
		WHERE{
			SELECT \(COUNT\(distinct ?class\) AS ?nbClass\) ?vocab
			WHERE{
				{?class a rdfs:Class.}
				UNION{?class a owl:Class.}
				?class a ?type.
				FILTER\(?type!=owl:DeprecatedClass\)
				?class rdfs:isDefinedBy ?vocab.
				?vocab a voaf:Vocabulary.
			}GROUP BY ?vocab
		}
	).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "number of classes".freeze,
      range: "xsd:integer".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:DatatypeProperty".freeze,
      :"vs:term_status" => %(stable).freeze
    property :dataset,
      comment: %(Deprecated since v2.4).freeze,
      :"dc:isReplacedBy" => %(voaf:DatasetOccurrences).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "dataset".freeze,
      :"owl:inverseOf" => %(void:vocabulary).freeze,
      range: "void:Dataset".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(deprecated).freeze
    property :exampleDataset,
      comment: %(Deprecated since v1.1).freeze,
      :"dc:isReplacedBy" => %(voaf:dataset).freeze,
      label: "example dataset".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(deprecated).freeze
    property :extends,
      comment: %(Indicates that the subject vocabulary extends the expressivity of the object vocabulary by declaring subsumption relationships, using object vocabulary class as domain or range of a subject vocabulary property, defining local restrictions etc ...).freeze,
      :"dc:description" => %(
		PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
		PREFIX owl:<http://www.w3.org/2002/07/owl#>
		PREFIX voaf:<http://purl.org/vocommons/voaf#>

		CONSTRUCT{
			?vocab1 voaf:extends ?vocab2
		}
		WHERE{
			{?elem1 owl:inverseOf ?elem2. FILTER\(!isBlank\(?elem2\)\)}
			UNION{?elem1 rdfs:domain ?elem2. FILTER\(!isBlank\(?elem2\)\)}
			UNION{?elem1 rdfs:range ?elem2. FILTER\(!isBlank\(?elem2\)\)}
			UNION{?elem2 rdfs:domain ?elem1. FILTER\(!isBlank\(?elem1\)\)}
			UNION{?elem2 rdfs:range ?elem1. FILTER\(!isBlank\(?elem1\)\)}
			?elem1 rdfs:isDefinedBy ?vocab1.
			?vocab1 a voaf:Vocabulary.
			?elem2 rdfs:isDefinedBy ?vocab2.
			?vocab2 a voaf:Vocabulary.
			FILTER\(?vocab1!=?vocab2\)
		}
	).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "extends".freeze,
      range: "voaf:Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      subPropertyOf: "voaf:reliesOn".freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(stable).freeze
    property :generalizes,
      comment: %(Indicates that the subject vocabulary generalizes by some superclasses or superproperties the object vocabulary.).freeze,
      :"dc:description" => %(
		PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>
		PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
		PREFIX owl:<http://www.w3.org/2002/07/owl#>
		PREFIX voaf:<http://purl.org/vocommons/voaf#>
		PREFIX skos:<http://www.w3.org/2004/02/skos/core#>
		
		CONSTRUCT{
			?vocab1 voaf:generalizes ?vocab2
		}
		WHERE{
			{?elem1 skos:narrowMatch ?elem2. FILTER\(!isBlank\(?elem2\)\)}
			UNION{?elem2 rdfs:subPropertyOf ?elem1.}
			UNION{?elem1 a owl:Class. ?elem1 owl:unionOf ?union. ?union rdf:first ?elem2.}
			UNION{?elem1 a owl:Class. ?elem1 owl:unionOf ?union. ?union rdf:rest ?union2. ?union2 rdf:first ?elem2.}
			UNION{?elem1 a owl:Class. ?elem1 owl:unionOf ?union. ?union rdf:rest ?union2. ?union2 rdf:rest ?union3. ?union3 rdf:first ?elem2.}
			UNION{?elem1 a owl:Class. ?elem1 owl:unionOf ?union. ?union rdf:rest ?union2. ?union2 rdf:rest ?union3. ?union3 rdf:rest ?union4. ?union4 rdf:first ?elem2.}
			UNION{?elem1 a owl:Class. ?elem1 owl:unionOf ?union. ?union rdf:rest ?union2. ?union2 rdf:rest ?union3. ?union3 rdf:rest ?union4. ?union4 rdf:rest ?union5. ?union5 rdf:first ?elem2.}
			FILTER\(!isBlank\(?elem2\)\)
			?elem1 rdfs:isDefinedBy ?vocab1.
			?vocab1 a voaf:Vocabulary.
			?elem2 rdfs:isDefinedBy ?vocab2.
			?vocab2 a voaf:Vocabulary.
			FILTER\(?vocab1!=?vocab2\)
		}
	).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "generalizes".freeze,
      range: "voaf:Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      subPropertyOf: "voaf:reliesOn".freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(stable).freeze
    property :hasDisjunctionsWith,
      comment: %(Indicates that the subject vocabulary contains some declaration of disjoint classes with the object vocabulary.).freeze,
      :"dc:description" => %(
		PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
		PREFIX owl:<http://www.w3.org/2002/07/owl#>
		PREFIX voaf:<http://purl.org/vocommons/voaf#>
		
		CONSTRUCT{
			?vocab1 voaf:hasDisjunctionsWith ?vocab2
		}
		WHERE{
			?elem1 owl:disjointWith ?elem2. FILTER\(!isBlank\(?elem2\)\)
			?elem1 rdfs:isDefinedBy ?vocab1.
			?vocab1 a voaf:Vocabulary.
			?elem2 rdfs:isDefinedBy ?vocab2.
			?vocab2 a voaf:Vocabulary.
			FILTER\(?vocab1!=?vocab2\)
		}
	).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "has disjunctions with".freeze,
      range: "voaf:Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      subPropertyOf: "voaf:reliesOn".freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(testing).freeze
    property :hasEquivalencesWith,
      comment: %(Indicates that the subject vocabulary declares some equivalent classes or properties with the object vocabulary.).freeze,
      :"dc:description" => %(
		PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
		PREFIX owl:<http://www.w3.org/2002/07/owl#>
		PREFIX voaf:<http://purl.org/vocommons/voaf#>
		PREFIX skos:<http://www.w3.org/2004/02/skos/core#>
		
		CONSTRUCT{
			?vocab1 voaf:hasEquivalencesWith ?vocab2
		}
		WHERE{
			{?elem1 owl:equivalentProperty ?elem2.}
			UNION{?elem1 owl:sameAs ?elem2.}
			UNION{?elem1 owl:equivalentClass ?elem2.}
			UNION{?elem2 owl:equivalentProperty ?elem1.}
			UNION{?elem2 owl:equivalentClass ?elem1.}
			UNION{?elem1 skos:exactMatch ?elem2.}
			UNION{?elem2 skos:exactMatch ?elem1.}
			FILTER\(!isBlank\(?elem2\)\)
			?elem1 rdfs:isDefinedBy ?vocab1.
			?vocab1 a voaf:Vocabulary.
			?elem2 rdfs:isDefinedBy ?vocab2.
			?vocab2 a voaf:Vocabulary.
			FILTER\(?vocab1!=?vocab2\)
		}
	).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "has equivalences with".freeze,
      range: "voaf:Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      subPropertyOf: "voaf:reliesOn".freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(testing).freeze
    property :inDataset,
      comment: %(dataset in which a vocabulary occurred).freeze,
      domain: "voaf:DatasetOccurrences".freeze,
      label: "in dataset".freeze,
      range: "void:Dataset".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(testing).freeze
    property :metadataVoc,
      comment: %(Indicates that the subject vocabulary uses the object vocabulary in metadata at global vocabulary level or at element level).freeze,
      :"dc:description" => %(
		PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
		PREFIX owl:<http://www.w3.org/2002/07/owl#>
		PREFIX voaf:<http://purl.org/vocommons/voaf#>

		CONSTRUCT{
			?vocab1 voaf:metadataVoc ?vocab2
		}
		WHERE{
			?elem1 ?elem2 ?o.
			?elem1 rdfs:isDefinedBy ?vocab1.
			?vocab1 a voaf:Vocabulary.
			?elem2 rdfs:isDefinedBy ?vocab2.
			?vocab2 a voaf:Vocabulary.
			FILTER\(?vocab1!=?vocab2\)
		}
	).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "metadata vocabulary".freeze,
      range: "voaf:Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      subPropertyOf: "voaf:reliesOn".freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(stable).freeze
    property :occurrences,
      comment: %(Number of occurrences of a vocabulary in a dataset).freeze,
      domain: "voaf:DatasetOccurrences".freeze,
      label: "occurrences".freeze,
      range: "xsd:integer".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(testing).freeze
    property :occurrencesInDatasets,
      comment: %(Number of datasets using a resource.).freeze,
      label: "occurrences in datasets".freeze,
      range: "xsd:integer".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:DatatypeProperty".freeze,
      :"vs:term_status" => %(testing).freeze
    property :occurrencesInVocabularies,
      comment: %(Number of vocabularies using a resource).freeze,
      label: "occurrences in vocabularies".freeze,
      range: "xsd:integer".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:DatatypeProperty".freeze,
      :"vs:term_status" => %(testing).freeze
    property :propertyNumber,
      comment: %(The number of properties defined in the vocabulary namespace. Properties imported from other namespaces are not taken into account.).freeze,
      :"dc:description" => %(
		PREFIX rdf:<http://www.w3.org/1999/02/22-rdf-syntax-ns#>
		PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
		PREFIX owl:<http://www.w3.org/2002/07/owl#>
		PREFIX voaf:<http://purl.org/vocommons/voaf#>
		
		CONSTRUCT{
		?vocab voaf:propertyNumber ?nbProp
		}
		WHERE{
			SELECT \(COUNT\(distinct ?prop\) AS ?nbProp\) ?vocab
			WHERE{
				{?prop a rdf:Property.}
				UNION{?prop a owl:ObjectProperty.}
				UNION{?prop a owl:DatatypeProperty.}
				UNION{?prop a owl:AnnotationProperty.}
				UNION{?prop a owl:FunctionalProperty.}
				UNION{?prop a owl:OntologyProperty.}
				UNION{?prop a owl:AsymmetricProperty.}
				UNION{?prop a owl:InverseFunctionalProperty.}
				UNION{?prop a owl:IrreflexiveProperty.}
				UNION{?prop a owl:ReflexiveProperty.}
				UNION{?prop a owl:SymmetricProperty.}
				UNION{?prop a owl:TransitiveProperty.}
				?prop a ?type.
				FILTER\(?type!=owl:DeprecatedProperty\)
				?prop rdfs:isDefinedBy ?vocab.
				?vocab a voaf:Vocabulary.
			}GROUP BY ?vocab
		}
	).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "number of properties".freeze,
      range: "xsd:integer".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:DatatypeProperty".freeze,
      :"vs:term_status" => %(stable).freeze
    property :reliesOn,
      comment: %(Indicates that the subject vocabulary uses or extends some class or property of the object vocabulary).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "relies on".freeze,
      range: "voaf:Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      subPropertyOf: ["dc:references".freeze, "void:vocabulary".freeze],
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(stable).freeze
    property :reusedByDatasets,
      comment: %(Distinct number of datasets reusing a resource.).freeze,
      label: "reused by datasets".freeze,
      range: "xsd:integer".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:DatatypeProperty".freeze,
      :"vs:term_status" => %(testing).freeze
    property :reusedByVocabularies,
      comment: %(Distinct number of vocabularies reusing a resource.).freeze,
      label: "reused by vocabularies".freeze,
      range: "xsd:integer".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:DatatypeProperty".freeze,
      :"vs:term_status" => %(testing).freeze
    property :similar,
      comment: %(Used to assert that two vocabularies are similar in scope and objectives, independently of the fact that they otherwise refer to each other.).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "similar".freeze,
      range: "voaf:Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: ["owl:ObjectProperty".freeze, "owl:SymmetricProperty".freeze],
      :"vs:term_status" => %(testing).freeze
    property :specializes,
      comment: %(Indicates that the subject vocabulary defines some subclasses or subproperties of the object vocabulary, or local restrictions on those.).freeze,
      :"dc:description" => %(
		PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
		PREFIX voaf:<http://purl.org/vocommons/voaf#>
		PREFIX skos:<http://www.w3.org/2004/02/skos/core#>
		
		CONSTRUCT{
			?vocab1 voaf:specializes ?vocab2
		}
		WHERE{
			{?elem1 rdfs:subPropertyOf ?elem2. FILTER\(!isBlank\(?elem2\)\)}
			UNION{?elem1 rdfs:subClassOf ?elem2. FILTER\(!isBlank\(?elem2\)\)}
			UNION{?elem1 skos:broadMatch ?elem2. FILTER\(!isBlank\(?elem2\)\)}
			?elem1 rdfs:isDefinedBy ?vocab1.
			?vocab1 a voaf:Vocabulary.
			?elem2 rdfs:isDefinedBy ?vocab2.
			?vocab2 a voaf:Vocabulary.
			FILTER\(?vocab1!=?vocab2\)
		}
	).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "specializes".freeze,
      range: "voaf:Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      subPropertyOf: "voaf:reliesOn".freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(stable).freeze
    property :toDoList,
      comment: %(Describes future tasks planned by a resource curator. This property is primarily intended to be used for vocabularies or datasets, but the domain is left open, it can be used for any resource. Use iCalendar Vtodo class and its properties to further describe the task calendar, priorities etc.).freeze,
      label: "to-do list".freeze,
      range: "http://www.w3.org/2002/12/cal/ical#Vtodo".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(stable).freeze
    property :usageInDataset,
      comment: %(usage statistics in a dataset).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "usage in dataset".freeze,
      range: "voaf:DatasetOccurrences".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(testing).freeze
    property :usedBy,
      comment: %(Indicates that the subject vocabulary is used by the object vocabulary).freeze,
      domain: "voaf:Vocabulary".freeze,
      label: "used by".freeze,
      :"owl:inverseOf" => %(voaf:reliesOn).freeze,
      range: "voaf:Vocabulary".freeze,
      :"rdfs:isDefinedBy" => %(http://purl.org/vocommons/voaf).freeze,
      type: "owl:ObjectProperty".freeze,
      :"vs:term_status" => %(stable).freeze
  end
end
