require "rdf"
require "rdf/vocab"

module Vocabulary

  VOCABULARIES = {

                    adms: "http://www.w3.org/ns/adms#",
                 article: "http://ogp.me/ns/article#",
                      cc: "http://creativecommons.org/ns#",
                    ctag: "http://commontag.org/ns#",
                     dbr: "http://dbpedia.org/resource/",
                      dc: "http://purl.org/dc/terms/",
                     deo: "http://purl.org/spar/deo/",
                    doap: "http://usefulinc.com/ns/doap#",
               essglobal: "http://purl.org/essglobal/vocab/",
  "essglobal-activities": "http://purl.org/essglobal/standard/activities/",
   "essglobal-legalform": "http://purl.org/essglobal/standard/legal-form/",
  "essglobal-qualifiers": "http://purl.org/essglobal/standard/qualifiers/",
"essglobal-typeoflabour": "http://purl.org/essglobal/standard/type-of-labour/",
                     fea: "http://vocab.data.gov/def/fea#",
                    foaf: "http://xmlns.com/foaf/0.1/",
                      gr: "http://purl.org/goodrelations/v1#",
                      oa: "http://www.w3.org/ns/oa#",
                      og: "http://ogp.me/ns#",
                     org: "http://www.w3.org/ns/org#",
                     owl: "http://www.w3.org/2002/07/owl#",
                 profile: "http://ogp.me/ns/profile#",
                    prov: "http://www.w3.org/ns/prov#",
                      qb: "http://purl.org/linked-data/cube#",
                     rdf: "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
                    rdfa: "http://www.w3.org/ns/rdfa#",
                    rdfs: "http://www.w3.org/2000/01/rdf-schema#",
                     rov: "http://www.w3.org/ns/regorg#",
                  schema: "http://schema.org/",
                    sioc: "http://rdfs.org/sioc/ns#",
                   sioct: "http://rdfs.org/sioc/types#",
                    skos: "http://www.w3.org/2004/02/skos/core#",
                   vcard: "http://www.w3.org/2006/vcard/ns#",
                     xhv: "http://www.w3.org/1999/xhtml/vocab#",
                     xsd: "http://www.w3.org/2001/XMLSchema#",

              #pentandra: "#{@config[:base_url]}#{@config[:company][:page_url]}#",
       #"pentandra-blog": "#{@config[:base_url]}#{@config[:blog][:url]}#",
    #"pentandra-website": "#{@config[:base_url]}#"

  }

  def prefixes_for(*prefixes)
    prefixes.map { |prefix| "#{prefix}: #{VOCABULARIES[prefix]}" }.join(" ")
  end

  def standard_prefixes
    [ :cc, :ctag, :dc, :foaf, :owl, :prov, :rdf, :rdfa, :rdfs, :schema, :sioc, :skos, :xhv, :xsd ]
  end

  def company_prefixes
    [ :essglobal, :pentandra, :"pentandra-blog", :"pentandra-website", :rov ]
  end

  def open_graph_prefixes
    [ :article, :og, :profile ]
  end

end
