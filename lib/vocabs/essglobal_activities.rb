# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://purl.org/essglobal/standard/activities/
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://purl.org/essglobal/standard/activities/>
  #   class ESSGLOBALActivities < RDF::Vocabulary
  #   end
  class ESSGLOBALActivities < RDF::Vocabulary("http://purl.org/essglobal/standard/activities/")

    # Extra definitions
    term :"#A01",
      label: "#A01".freeze,
      :"skos:altLabel" => [%(A).freeze, %(Agriculture, forestry and fishing).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Agriculture and environment).freeze,
      :"skos:scopeNote" => %(Integrates the sectors of agriculture, forestry and fishing).freeze,
      type: "skos:Concept".freeze
    term :"#A02",
      label: "#A02".freeze,
      :"skos:altLabel" => [%(B).freeze, %(Mining and quarrying).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Mining and quarrying).freeze,
      :"skos:scopeNote" => %(Integra sectors of the extractive industry).freeze,
      type: "skos:Concept".freeze
    term :"#A03",
      label: "#A03".freeze,
      :"skos:altLabel" => [%(C).freeze, %(Manufacturing).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Craftmanship and manufacturing).freeze,
      :"skos:scopeNote" => %(Integrates the manufacturing sectors).freeze,
      type: "skos:Concept".freeze
    term :"#A04",
      label: "#A04".freeze,
      :"skos:altLabel" => [%(D).freeze, %(Electricity, gas, steam and air conditioning supply).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Energy production and distribution).freeze,
      :"skos:scopeNote" => %(Includes the sectors of electricity, gas, steam and air conditioning).freeze,
      type: "skos:Concept".freeze
    term :"#A05",
      label: "#A05".freeze,
      :"skos:altLabel" => [%(E).freeze, %(Water supply; sewerage, waste management and remediation activities).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Recycling, waste treatment, water cycle and ecological restoration).freeze,
      :"skos:scopeNote" => %(Includes the sectors of water supply sanitation activities, waste management and remediation).freeze,
      type: "skos:Concept".freeze
    term :"#A06",
      label: "#A06".freeze,
      :"skos:altLabel" => [%(Construction).freeze, %(F).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Construction, public works and refurbishing).freeze,
      :"skos:scopeNote" => %(Includes the sectors of construction).freeze,
      type: "skos:Concept".freeze
    term :"#A07",
      label: "#A07".freeze,
      :"skos:altLabel" => [%(G).freeze, %(Wholesale and retail trade; repair of motor vehicles and motorcycles).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Trade and distribution).freeze,
      :"skos:scopeNote" => %(Includes the sectors of trade and retail trade, repair of motor vehicles and motorcycles).freeze,
      type: "skos:Concept".freeze
    term :"#A08",
      label: "#A08".freeze,
      :"skos:altLabel" => [%(H).freeze, %(Transportation and storage).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Transport, logistics and storage).freeze,
      :"skos:scopeNote" => %(Includes the sectors of transport and storage).freeze,
      type: "skos:Concept".freeze
    term :"#A09",
      label: "#A09".freeze,
      :"skos:altLabel" => [%(Accommodation and food service activities).freeze, %(I).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Hospitality and food service activities).freeze,
      :"skos:scopeNote" => %(Integrates the industry sectors of accommodation and food services).freeze,
      type: "skos:Concept".freeze
    term :"#A10",
      label: "#A10".freeze,
      :"skos:altLabel" => [%(Information and communication).freeze, %(J).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Information, communication and technologies).freeze,
      :"skos:scopeNote" => %(Integrates information and communication sectors).freeze,
      type: "skos:Concept".freeze
    term :"#A11",
      label: "#A11".freeze,
      :"skos:altLabel" => [%(Financial and insurance activities).freeze, %(K).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Financial, insurance and related activities).freeze,
      :"skos:scopeNote" => %(Includes the sectors of financial and insurance activities).freeze,
      type: "skos:Concept".freeze
    term :"#A12",
      label: "#A12".freeze,
      :"skos:altLabel" => [%(L).freeze, %(Real estate activities).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Habitat and housing).freeze,
      :"skos:scopeNote" => %(Includes the sectors of real estate activities).freeze,
      type: "skos:Concept".freeze
    term :"#A13",
      label: "#A13".freeze,
      :"skos:altLabel" => [%(M).freeze, %(Professional, scientific and technical activities).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Professional, scientific and technical activities).freeze,
      :"skos:scopeNote" => %(Integrates the sectors of professional, scientific and technical).freeze,
      type: "skos:Concept".freeze
    term :"#A14",
      label: "#A14".freeze,
      :"skos:altLabel" => [%(Administrative and support service activities).freeze, %(N).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Administration and management, tourism, rentals).freeze,
      :"skos:scopeNote" => %(Includes the sectors of administrative and support service activities).freeze,
      type: "skos:Concept".freeze
    term :"#A15",
      label: "#A15".freeze,
      :"skos:altLabel" => [%(O).freeze, %(Public administration and defence; compulsory social security).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Public administration and social security).freeze,
      :"skos:scopeNote" => %(Includes the sectors of public administration, defense and compulsory social security).freeze,
      type: "skos:Concept".freeze
    term :"#A16",
      label: "#A16".freeze,
      :"skos:altLabel" => [%(Education).freeze, %(P).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Education and training).freeze,
      :"skos:scopeNote" => %(Integrates education sectors).freeze,
      type: "skos:Concept".freeze
    term :"#A17",
      label: "#A17".freeze,
      :"skos:altLabel" => [%(Human health and social work activities).freeze, %(Q).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Social services, health and employment).freeze,
      :"skos:scopeNote" => %(Includes the sectors of health and social).freeze,
      type: "skos:Concept".freeze
    term :"#A18",
      label: "#A18".freeze,
      :"skos:altLabel" => [%(Arts, entertainment and recreation).freeze, %(R).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => %(Arts, culture, recreation and sports).freeze,
      :"skos:scopeNote" => %(Includes the sectors of arts, entertainment and recreation).freeze,
      type: "skos:Concept".freeze
    term :"#A19",
      label: "#A19".freeze,
      :"skos:altLabel" => [%(Other service activities).freeze, %(S).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => [%().freeze, %(Membership activities, repairing and wellness).freeze],
      :"skos:scopeNote" => %(Integrates the activities of other sectors of services).freeze,
      type: "skos:Concept".freeze
    term :"#A20",
      label: "#A20".freeze,
      :"skos:altLabel" => [%(Activities of households as employers; undifferentiated goods- and services-producing activities of households for own use).freeze, %(T).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => [%().freeze, %(Household activities, self-production, domestic work).freeze],
      :"skos:scopeNote" => %(Integra sectors of activities of households as employers).freeze,
      type: "skos:Concept".freeze
    term :"#A21",
      label: "#A21".freeze,
      :"skos:altLabel" => [%(Activities of extraterritorial organizations and bodies).freeze, %(U).freeze],
      :"skos:inScheme" => %(essglobalactivities:activities).freeze,
      :"skos:prefLabel" => [%().freeze, %(International diplomacy and cooperation).freeze],
      :"skos:scopeNote" => %(Integra sectors of activities of organizations and bodies).freeze,
      type: "skos:Concept".freeze
    term :activities,
      :"dc11:contributor" => [%(Ana Alice Baptista \(analice@dsi.uminho.pt\)).freeze, %(Daniel Tygel \(dtygel@gmail.com\)).freeze, %(Jason Nardi \(jason.nardi@gmail.com\)).freeze, %(Marc Alphandery \(marc.alphandery@wanadoo.fr\)).freeze, %(Mariana Malta \(mariana@iscap.ipp.pt\)).freeze],
      :"dc11:creator" => [%(César Araújo \(cesar_araujo@sapo.pt\)).freeze, %(Leonardo Cruz \(leonardopscruz@gmail.com\)).freeze, %(Rodrigo Alves \(rasalves@gmail.com\)).freeze, %(Sérgio Vale \(gks_sergio@hotmail.com\)).freeze],
      :"dc11:description" => %(Activities controlled vocabulary for SSE).freeze,
      :"dc11:language" => %(en-en).freeze,
      :"dc11:modified" => %(2014-01-25).freeze,
      :"dc11:publisher" => %(http://www.ripess.org/).freeze,
      :"dc11:relation" => %(http://www.dsi.uminho.pt/).freeze,
      :"dc11:title" => %(Activities).freeze,
      :"dc:created" => %(2012-02-20).freeze,
      :"dc:publisher" => %(RIPESS - ESSGlobal).freeze,
      label: "activities".freeze,
      type: "skos:ConceptScheme".freeze
  end
end
