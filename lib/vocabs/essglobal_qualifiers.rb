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
      label: "#Q01".freeze,
      :"skos:definition" => %(Products and Services which are developed in a process that is focused on environmental sustainability, like the usage of renewable energy, recycling, ecologic packing, reused inputs, etc.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:).freeze,
      :"skos:prefLabel" => %(Ecologically or Environmentally Sustainable).freeze,
      :"skos:scopeNote" => %().freeze,
      type: "skos:Concept".freeze
    term :"#Q02",
      label: "#Q02".freeze,
      :"skos:definition" => %(Work relations, structure and conditions which are democratic and decent.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:).freeze,
      :"skos:prefLabel" => %(Democratic and decent working conditions).freeze,
      :"skos:scopeNote" => %().freeze,
      type: "skos:Concept".freeze
    term :"#Q03",
      label: "#Q03".freeze,
      :"skos:definition" => %("Products and Services developed by people normally marginalised from society and the work market, like for example unemployed people, immigrants, disabled, ex-prisonners.").freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Socially fair).freeze,
      :"skos:scopeNote" => %().freeze,
      type: "skos:Concept".freeze
    term :"#Q04",
      label: "#Q04".freeze,
      :"skos:definition" => %("Products and Services which are democratic and fair in the economic level, bringing autonomy to local SSE enterprises, fair relations along chains and contributing for a sovreign, territorial and solidarity development.").freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Economically democratic and sovereign).freeze,
      :"skos:scopeNote" => %().freeze,
      type: "skos:Concept".freeze
    term :"#Q05",
      label: "#Q05".freeze,
      :"skos:definition" => %(Products and Services developped in a way where women are empowered, as in women owned SSE initiatives or initiatives that have an internal charter granting gender equity in all steps of the economic activity.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Gender Equity).freeze,
      :"skos:scopeNote" => %().freeze,
      type: "skos:Concept".freeze
    term :"#Q06",
      label: "#Q06".freeze,
      :"skos:definition" => %(SSE initiatives from local and traditional communities, indigenous people, "campesinat".).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(From original / indigenous people or traditional communities).freeze,
      :"skos:scopeNote" => %().freeze,
      type: "skos:Concept".freeze
    term :"#Q07",
      label: "#Q07".freeze,
      :"skos:definition" => %(The outcomes of the work have licenses which allow for reproduction and sharing of knowledge and culture.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Commons and free knowledge/free culture).freeze,
      :"skos:scopeNote" => %().freeze,
      type: "skos:Concept".freeze
    term :"#Q08",
      label: "#Q08".freeze,
      :"skos:definition" => %(Products and Services that are not industrial, being made in a traditional and artisanal way.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Handicraft).freeze,
      :"skos:scopeNote" => %().freeze,
      type: "skos:Concept".freeze
    term :Agroecological,
      label: "Agroecological".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q01).freeze,
      :"skos:definition" => %(Agriculture Products or Services that ally social justice \(no workers exploration\) and organic farming.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Agroecological).freeze,
      type: "skos:Concept".freeze
    term :Agroextrativism,
      label: "Agroextrativism".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q01).freeze,
      :"skos:definition" => %(Extractivism of natural fruits, seeds and other plants that's done in a traditional manner without harming the biodiversity and natural environment).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Agroextrativism).freeze,
      type: "skos:Concept".freeze
    term :Animalwelfare,
      label: "Animalwelfare".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q01).freeze,
      :"skos:definition" => %(Products and Services which are developped in a process that doesn't do any harm to animals, like animal testing or the usage of animal material as inputs.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:).freeze,
      :"skos:prefLabel" => %(Animal Welfare).freeze,
      type: "skos:Concept".freeze
    term :Fairtrade,
      label: "Fairtrade".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q04).freeze,
      :"skos:definition" => %(Products and Services which are offered in a trading chain that respects several criteria and code of conducts from production to the consumption, like direct relashionship among consummers and producers, international fair trade, open/transparent price composition, trading process owned by the producers, etc.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Fair trade).freeze,
      type: "skos:Concept".freeze
    term :FreeCulture,
      label: "FreeCulture".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q07).freeze,
      :"skos:definition" => %(Artistic and Cultural Products which have licenses like the Creative Commons and similars, where it can be copied and in some times transformed with some conditions that vary, like citing the original author, prohibition of commercial trading, etc.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Free Culture).freeze,
      type: "skos:Concept".freeze
    term :FreeKnowledgeorSoftware,
      label: "FreeKnowledgeorSoftware".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q07).freeze,
      :"skos:definition" => %(Products, like software and machinery, that are licensed in a way that allows the public to know the source code \(the way it has been produced\) and to produce derivatives, under some conditions like citing the original author and having to also use the same license,as in GPL.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Free Knowledge or Software).freeze,
      type: "skos:Concept".freeze
    term :FromOriginalorIndigenousPeople,
      label: "FromOriginalorIndigenousPeople".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q06).freeze,
      :"skos:definition" => %(Products and Services developped by original or indigenous people.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:).freeze,
      :"skos:prefLabel" => %(From Original or Indigenous People).freeze,
      type: "skos:Concept".freeze
    term :LocalorFromCommunity,
      label: "LocalorFromCommunity".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q04).freeze,
      :"skos:definition" => %(Products and Services issued and traded locally.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Local or From Community).freeze,
      type: "skos:Concept".freeze
    term :Madefromrecycledorrecoveredmaterial,
      label: "Madefromrecycledorrecoveredmaterial".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q01).freeze,
      :"skos:definition" => %(Products and Services that use inputs that are recovered or recycled, totally or partially.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Made from Recycled or Recovered Material).freeze,
      type: "skos:Concept".freeze
    term :Naturalcosmeticsandherbalmedicines,
      label: "Naturalcosmeticsandherbalmedicines".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q01).freeze,
      :"skos:definition" => %(Medicinal os Cosmetic Products and Services that use only natural essences, without human made chemical compounds.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Natural Cosmetics and Herbal Medicines).freeze,
      type: "skos:Concept".freeze
    term :Organic,
      label: "Organic".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q01).freeze,
      :"skos:definition" => %(Agricultural Products issued from organic farming, without the usage of agrotoxics and other chemical based seeds, fertilizer or other inputs. It might also be Products and Services that use only organic agricultural products as inputs.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Organic).freeze,
      type: "skos:Concept".freeze
    term :PeasantorFamilyAgriculture,
      label: "PeasantorFamilyAgriculture".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q06).freeze,
      :"skos:definition" => %(Products and Services developped by small farmers, normally organised in the community, and normally families, that might be using traditional ways to do farming.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Peasant or Family Agriculture).freeze,
      type: "skos:Concept".freeze
    term :Selfmanagement,
      label: "Selfmanagement".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q02).freeze,
      :"skos:definition" => %(SSE enterprise owned by the workers. Decisions about the initiative and the work are done by the same people.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:).freeze,
      :"skos:prefLabel" => %(Self-management).freeze,
      type: "skos:Concept".freeze
    term :Socialinsertioninitiatives,
      label: "Socialinsertioninitiatives".freeze,
      :"skos:broader" => %(essglobalqualifiers:Q03).freeze,
      :"skos:definition" => %(Unemployed people work during a established timespan in an insertion enterprise to be better qualified for the market.).freeze,
      :"skos:inScheme" => %(essglobalqualifiers:qualifiers).freeze,
      :"skos:prefLabel" => %(Social insertion initiatives).freeze,
      type: "skos:Concept".freeze
    term :qualifiers,
      :"dc11:contributor" => [%(Ana Alice Baptista \(analice@dsi.uminho.pt\)).freeze, %(Daniel Tygel \(dtygel@gmail.com\)).freeze, %(Jason Nardi \(jason.nardi@gmail.com\)).freeze, %(Marc Alphandery \(marc.alphandery@wanadoo.fr\)).freeze, %(Mariana Malta \(mariana@iscap.ipp.pt\)).freeze],
      :"dc11:creator" => [%(Cesar Araujo \(cesar_araujo@sapo.pt\)).freeze, %(Leonardo Cruz \(leonardopscruz@gmail.com\)).freeze, %(Rodrigo Alves \(rasalves@gmail.com\)).freeze, %(Sergio Vale \(gks_sergio@hotmail.com\)).freeze],
      :"dc11:description" => %(Qualifiers controlled vocabulary for SSE).freeze,
      :"dc11:language" => %(en-en).freeze,
      :"dc11:publisher" => %(http://www.ripess.org/).freeze,
      :"dc11:relation" => %(http://www.dsi.uminho.pt/).freeze,
      :"dc11:title" => %(Qualifiers).freeze,
      :"dc:created" => %(2012-02-20).freeze,
      :"dc:modified" => %(2014-01-25).freeze,
      :"dc:publisher" => %(RIPESS-ESSGlobal).freeze,
      label: "qualifiers".freeze,
      :"skos:hasTopConcept" => [%(essglobalqualifiers:Q01).freeze, %(essglobalqualifiers:Q02).freeze, %(essglobalqualifiers:Q03).freeze, %(essglobalqualifiers:Q04).freeze, %(essglobalqualifiers:Q05).freeze, %(essglobalqualifiers:Q06).freeze, %(essglobalqualifiers:Q07).freeze, %(essglobalqualifiers:Q08).freeze],
      type: "skos:ConceptScheme".freeze
  end
end
