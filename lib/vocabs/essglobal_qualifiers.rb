# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/essglobal/standard/qualifiers/
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/essglobal/standard/qualifiers/>
  #   class ESSGLOBALQualifiers < RDF::Vocabulary
  #   end
  class ESSGLOBALQualifiers < RDF::Vocabulary("http://purl.org/essglobal/standard/qualifiers/")

    # Extra definitions
    term :"#Q01",
      definition: %(Products and Services which are developed in a process that is focused on environmental sustainability, like the usage of renewable energy, recycling, ecologic packing, reused inputs, etc.).freeze,
      inScheme: "essglobalqualifiers:".freeze,
      prefLabel: "Ecologically or Environmentally Sustainable".freeze,
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#Q02",
      definition: %(Work relations, structure and conditions which are democratic and decent.).freeze,
      inScheme: "essglobalqualifiers:".freeze,
      prefLabel: "Democratic and decent working conditions".freeze,
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#Q03",
      definition: %("Products and Services developed by people normally marginalised from society and the work market, like for example unemployed people, immigrants, disabled, ex-prisonners.").freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Socially fair".freeze,
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#Q04",
      definition: %("Products and Services which are democratic and fair in the economic level, bringing autonomy to local SSE enterprises, fair relations along chains and contributing for a sovreign, territorial and solidarity development.").freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Economically democratic and sovereign".freeze,
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#Q05",
      definition: %(Products and Services developped in a way where women are empowered, as in women owned SSE initiatives or initiatives that have an internal charter granting gender equity in all steps of the economic activity.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Gender Equity".freeze,
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#Q06",
      definition: %(SSE initiatives from local and traditional communities, indigenous people, "campesinat".).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "From original / indigenous people or traditional communities".freeze,
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#Q07",
      definition: %(The outcomes of the work have licenses which allow for reproduction and sharing of knowledge and culture.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Commons and free knowledge/free culture".freeze,
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :"#Q08",
      definition: %(Products and Services that are not industrial, being made in a traditional and artisanal way.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Handicraft".freeze,
      "skos:scopeNote": "".freeze,
      type: "skos:Concept".freeze
    term :Agroecological,
      broader: "essglobalqualifiers:Q01".freeze,
      definition: %(Agriculture Products or Services that ally social justice \(no workers exploration\) and organic farming.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Agroecological".freeze,
      type: "skos:Concept".freeze
    term :Agroextrativism,
      broader: "essglobalqualifiers:Q01".freeze,
      definition: %(Extractivism of natural fruits, seeds and other plants that's done in a traditional manner without harming the biodiversity and natural environment).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Agroextrativism".freeze,
      type: "skos:Concept".freeze
    term :Animalwelfare,
      broader: "essglobalqualifiers:Q01".freeze,
      definition: %(Products and Services which are developped in a process that doesn't do any harm to animals, like animal testing or the usage of animal material as inputs.).freeze,
      inScheme: "essglobalqualifiers:".freeze,
      prefLabel: "Animal Welfare".freeze,
      type: "skos:Concept".freeze
    term :Fairtrade,
      broader: "essglobalqualifiers:Q04".freeze,
      definition: %(Products and Services which are offered in a trading chain that respects several criteria and code of conducts from production to the consumption, like direct relashionship among consummers and producers, international fair trade, open/transparent price composition, trading process owned by the producers, etc.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Fair trade".freeze,
      type: "skos:Concept".freeze
    term :FreeCulture,
      broader: "essglobalqualifiers:Q07".freeze,
      definition: %(Artistic and Cultural Products which have licenses like the Creative Commons and similars, where it can be copied and in some times transformed with some conditions that vary, like citing the original author, prohibition of commercial trading, etc.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Free Culture".freeze,
      type: "skos:Concept".freeze
    term :FreeKnowledgeorSoftware,
      broader: "essglobalqualifiers:Q07".freeze,
      definition: %(Products, like software and machinery, that are licensed in a way that allows the public to know the source code \(the way it has been produced\) and to produce derivatives, under some conditions like citing the original author and having to also use the same license,as in GPL.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Free Knowledge or Software".freeze,
      type: "skos:Concept".freeze
    term :FromOriginalorIndigenousPeople,
      broader: "essglobalqualifiers:Q06".freeze,
      definition: %(Products and Services developped by original or indigenous people.).freeze,
      inScheme: "essglobalqualifiers:".freeze,
      prefLabel: "From Original or Indigenous People".freeze,
      type: "skos:Concept".freeze
    term :LocalorFromCommunity,
      broader: "essglobalqualifiers:Q04".freeze,
      definition: %(Products and Services issued and traded locally.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Local or From Community".freeze,
      type: "skos:Concept".freeze
    term :Madefromrecycledorrecoveredmaterial,
      broader: "essglobalqualifiers:Q01".freeze,
      definition: %(Products and Services that use inputs that are recovered or recycled, totally or partially.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Made from Recycled or Recovered Material".freeze,
      type: "skos:Concept".freeze
    term :Naturalcosmeticsandherbalmedicines,
      broader: "essglobalqualifiers:Q01".freeze,
      definition: %(Medicinal os Cosmetic Products and Services that use only natural essences, without human made chemical compounds.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Natural Cosmetics and Herbal Medicines".freeze,
      type: "skos:Concept".freeze
    term :Organic,
      broader: "essglobalqualifiers:Q01".freeze,
      definition: %(Agricultural Products issued from organic farming, without the usage of agrotoxics and other chemical based seeds, fertilizer or other inputs. It might also be Products and Services that use only organic agricultural products as inputs.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Organic".freeze,
      type: "skos:Concept".freeze
    term :PeasantorFamilyAgriculture,
      broader: "essglobalqualifiers:Q06".freeze,
      definition: %(Products and Services developped by small farmers, normally organised in the community, and normally families, that might be using traditional ways to do farming.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Peasant or Family Agriculture".freeze,
      type: "skos:Concept".freeze
    term :Selfmanagement,
      broader: "essglobalqualifiers:Q02".freeze,
      definition: %(SSE enterprise owned by the workers. Decisions about the initiative and the work are done by the same people.).freeze,
      inScheme: "essglobalqualifiers:".freeze,
      prefLabel: "Self-management".freeze,
      type: "skos:Concept".freeze
    term :Socialinsertioninitiatives,
      broader: "essglobalqualifiers:Q03".freeze,
      definition: %(Unemployed people work during a established timespan in an insertion enterprise to be better qualified for the market.).freeze,
      inScheme: "essglobalqualifiers:qualifiers".freeze,
      prefLabel: "Social insertion initiatives".freeze,
      type: "skos:Concept".freeze
    term :qualifiers,
      "dc11:contributor": ["Ana Alice Baptista (analice@dsi.uminho.pt)".freeze, "Daniel Tygel (dtygel@gmail.com)".freeze, "Jason Nardi (jason.nardi@gmail.com)".freeze, "Marc Alphandery (marc.alphandery@wanadoo.fr)".freeze, "Mariana Malta (mariana@iscap.ipp.pt)".freeze],
      "dc11:creator": ["Cesar Araujo (cesar_araujo@sapo.pt)".freeze, "Leonardo Cruz (leonardopscruz@gmail.com)".freeze, "Rodrigo Alves (rasalves@gmail.com)".freeze, "Sergio Vale (gks_sergio@hotmail.com)".freeze],
      "dc11:description": "Qualifiers controlled vocabulary for SSE".freeze,
      "dc11:language": "en-en".freeze,
      "dc11:publisher": "http://www.ripess.org/".freeze,
      "dc11:relation": "http://www.dsi.uminho.pt/".freeze,
      "dc11:title": "Qualifiers".freeze,
      "dc:created": "2012-02-20".freeze,
      "dc:modified": "2014-01-25".freeze,
      "dc:publisher": "RIPESS-ESSGlobal".freeze,
      hasTopConcept: ["essglobalqualifiers:Q01".freeze, "essglobalqualifiers:Q02".freeze, "essglobalqualifiers:Q03".freeze, "essglobalqualifiers:Q04".freeze, "essglobalqualifiers:Q05".freeze, "essglobalqualifiers:Q06".freeze, "essglobalqualifiers:Q07".freeze, "essglobalqualifiers:Q08".freeze],
      type: "skos:ConceptScheme".freeze
  end
end
