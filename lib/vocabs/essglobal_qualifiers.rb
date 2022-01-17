# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/essglobal/standard/qualifiers/
require 'rdf'
module LifePreserver::Vocab
  ESSGlobalQualifiers = Class.new(RDF::Vocabulary("http://purl.org/essglobal/standard/qualifiers/")) do

    # Extra definitions
    term :"#Q01",
      definition: "Products and Services which are developed in a process that is focused on environmental sustainability, like the usage of renewable energy, recycling, ecologic packing, reused inputs, etc.".freeze,
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/".freeze,
      prefLabel: "Ecologically or Environmentally Sustainable".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#Q02",
      definition: "Work relations, structure and conditions which are democratic and decent.".freeze,
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/".freeze,
      prefLabel: "Democratic and decent working conditions".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#Q03",
      definition: "\"Products and Services developed by people normally marginalised from society and the work market, like for example unemployed people, immigrants, disabled, ex-prisonners.\"".freeze,
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Socially fair".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#Q04",
      definition: "\"Products and Services which are democratic and fair in the economic level, bringing autonomy to local SSE enterprises, fair relations along chains and contributing for a sovreign, territorial and solidarity development.\"".freeze,
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Economically democratic and sovereign".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#Q05",
      definition: "Products and Services developped in a way where women are empowered, as in women owned SSE initiatives or initiatives that have an internal charter granting gender equity in all steps of the economic activity.".freeze,
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Gender Equity".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#Q06",
      definition: "SSE initiatives from local and traditional communities, indigenous people, \"campesinat\".".freeze,
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "From original / indigenous people or traditional communities".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#Q07",
      definition: "The outcomes of the work have licenses which allow for reproduction and sharing of knowledge and culture.".freeze,
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Commons and free knowledge/free culture".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :"#Q08",
      definition: "Products and Services that are not industrial, being made in a traditional and artisanal way.".freeze,
      "http://www.w3.org/2004/02/skos/core#scopeNote": "".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Handicraft".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :Agroecological,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q01".freeze,
      definition: "Agriculture Products or Services that ally social justice (no workers exploration) and organic farming.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Agroecological".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :Agroextrativism,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q01".freeze,
      definition: "Extractivism of natural fruits, seeds and other plants that's done in a traditional manner without harming the biodiversity and natural environment".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Agroextrativism".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :Animalwelfare,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q01".freeze,
      definition: "Products and Services which are developped in a process that doesn't do any harm to animals, like animal testing or the usage of animal material as inputs.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/".freeze,
      prefLabel: "Animal Welfare".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :Fairtrade,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q04".freeze,
      definition: "Products and Services which are offered in a trading chain that respects several criteria and code of conducts from production to the consumption, like direct relashionship among consummers and producers, international fair trade, open/transparent price composition, trading process owned by the producers, etc.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Fair trade".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :FreeCulture,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q07".freeze,
      definition: "Artistic and Cultural Products which have licenses like the Creative Commons and similars, where it can be copied and in some times transformed with some conditions that vary, like citing the original author, prohibition of commercial trading, etc.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Free Culture".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :FreeKnowledgeorSoftware,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q07".freeze,
      definition: "Products, like software and machinery, that are licensed in a way that allows the public to know the source code (the way it has been produced) and to produce derivatives, under some conditions like citing the original author and having to also use the same license,as in GPL.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Free Knowledge or Software".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :FromOriginalorIndigenousPeople,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q06".freeze,
      definition: "Products and Services developped by original or indigenous people.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/".freeze,
      prefLabel: "From Original or Indigenous People".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :LocalorFromCommunity,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q04".freeze,
      definition: "Products and Services issued and traded locally.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Local or From Community".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :Madefromrecycledorrecoveredmaterial,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q01".freeze,
      definition: "Products and Services that use inputs that are recovered or recycled, totally or partially.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Made from Recycled or Recovered Material".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :Naturalcosmeticsandherbalmedicines,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q01".freeze,
      definition: "Medicinal os Cosmetic Products and Services that use only natural essences, without human made chemical compounds.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Natural Cosmetics and Herbal Medicines".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :Organic,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q01".freeze,
      definition: "Agricultural Products issued from organic farming, without the usage of agrotoxics and other chemical based seeds, fertilizer or other inputs. It might also be Products and Services that use only organic agricultural products as inputs.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Organic".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :PeasantorFamilyAgriculture,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q06".freeze,
      definition: "Products and Services developped by small farmers, normally organised in the community, and normally families, that might be using traditional ways to do farming.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Peasant or Family Agriculture".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :Selfmanagement,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q02".freeze,
      definition: "SSE enterprise owned by the workers. Decisions about the initiative and the work are done by the same people.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/".freeze,
      prefLabel: "Self-management".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :Socialinsertioninitiatives,
      broader: "http://purl.org/essglobal/standard/qualifiers/Q03".freeze,
      definition: "Unemployed people work during a established timespan in an insertion enterprise to be better qualified for the market.".freeze,
      inScheme: "http://purl.org/essglobal/standard/qualifiers/qualifiers".freeze,
      prefLabel: "Social insertion initiatives".freeze,
      type: "http://www.w3.org/2004/02/skos/core#Concept".freeze
    term :qualifiers,
      hasTopConcept: ["http://purl.org/essglobal/standard/qualifiers/Q01".freeze, "http://purl.org/essglobal/standard/qualifiers/Q02".freeze, "http://purl.org/essglobal/standard/qualifiers/Q03".freeze, "http://purl.org/essglobal/standard/qualifiers/Q04".freeze, "http://purl.org/essglobal/standard/qualifiers/Q05".freeze, "http://purl.org/essglobal/standard/qualifiers/Q06".freeze, "http://purl.org/essglobal/standard/qualifiers/Q07".freeze, "http://purl.org/essglobal/standard/qualifiers/Q08".freeze],
      "http://purl.org/dc/elements/1.1/contributor": ["Ana Alice Baptista (analice@dsi.uminho.pt)".freeze, "Daniel Tygel (dtygel@gmail.com)".freeze, "Jason Nardi (jason.nardi@gmail.com)".freeze, "Marc Alphandery (marc.alphandery@wanadoo.fr)".freeze, "Mariana Malta (mariana@iscap.ipp.pt)".freeze],
      "http://purl.org/dc/elements/1.1/creator": ["Cesar Araujo (cesar_araujo@sapo.pt)".freeze, "Leonardo Cruz (leonardopscruz@gmail.com)".freeze, "Rodrigo Alves (rasalves@gmail.com)".freeze, "Sergio Vale (gks_sergio@hotmail.com)".freeze],
      "http://purl.org/dc/elements/1.1/description": "Qualifiers controlled vocabulary for SSE".freeze,
      "http://purl.org/dc/elements/1.1/language": "en-en".freeze,
      "http://purl.org/dc/elements/1.1/publisher": "http://www.ripess.org/".freeze,
      "http://purl.org/dc/elements/1.1/relation": "http://www.dsi.uminho.pt/".freeze,
      "http://purl.org/dc/elements/1.1/title": "Qualifiers".freeze,
      "http://purl.org/dc/terms/created": "2012-02-20".freeze,
      "http://purl.org/dc/terms/modified": "2014-01-25".freeze,
      "http://purl.org/dc/terms/publisher": "RIPESS-ESSGlobal".freeze,
      type: "http://www.w3.org/2004/02/skos/core#ConceptScheme".freeze
  end
end
