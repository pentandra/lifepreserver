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
      altLabel: ["A".freeze, "Agriculture, forestry and fishing".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Agriculture and environment".freeze,
      "skos:scopeNote": "Integrates the sectors of agriculture, forestry and fishing".freeze,
      type: "skos:Concept".freeze
    term :"#A02",
      altLabel: ["B".freeze, "Mining and quarrying".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Mining and quarrying".freeze,
      "skos:scopeNote": "Integra sectors of the extractive industry".freeze,
      type: "skos:Concept".freeze
    term :"#A03",
      altLabel: ["C".freeze, "Manufacturing".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Craftmanship and manufacturing".freeze,
      "skos:scopeNote": "Integrates the manufacturing sectors".freeze,
      type: "skos:Concept".freeze
    term :"#A04",
      altLabel: ["D".freeze, "Electricity, gas, steam and air conditioning supply".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Energy production and distribution".freeze,
      "skos:scopeNote": "Includes the sectors of electricity, gas, steam and air conditioning".freeze,
      type: "skos:Concept".freeze
    term :"#A05",
      altLabel: ["E".freeze, "Water supply; sewerage, waste management and remediation activities".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Recycling, waste treatment, water cycle and ecological restoration".freeze,
      "skos:scopeNote": "Includes the sectors of water supply sanitation activities, waste management and remediation".freeze,
      type: "skos:Concept".freeze
    term :"#A06",
      altLabel: ["Construction".freeze, "F".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Construction, public works and refurbishing".freeze,
      "skos:scopeNote": "Includes the sectors of construction".freeze,
      type: "skos:Concept".freeze
    term :"#A07",
      altLabel: ["G".freeze, "Wholesale and retail trade; repair of motor vehicles and motorcycles".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Trade and distribution".freeze,
      "skos:scopeNote": "Includes the sectors of trade and retail trade, repair of motor vehicles and motorcycles".freeze,
      type: "skos:Concept".freeze
    term :"#A08",
      altLabel: ["H".freeze, "Transportation and storage".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Transport, logistics and storage".freeze,
      "skos:scopeNote": "Includes the sectors of transport and storage".freeze,
      type: "skos:Concept".freeze
    term :"#A09",
      altLabel: ["Accommodation and food service activities".freeze, "I".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Hospitality and food service activities".freeze,
      "skos:scopeNote": "Integrates the industry sectors of accommodation and food services".freeze,
      type: "skos:Concept".freeze
    term :"#A10",
      altLabel: ["Information and communication".freeze, "J".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Information, communication and technologies".freeze,
      "skos:scopeNote": "Integrates information and communication sectors".freeze,
      type: "skos:Concept".freeze
    term :"#A11",
      altLabel: ["Financial and insurance activities".freeze, "K".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Financial, insurance and related activities".freeze,
      "skos:scopeNote": "Includes the sectors of financial and insurance activities".freeze,
      type: "skos:Concept".freeze
    term :"#A12",
      altLabel: ["L".freeze, "Real estate activities".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Habitat and housing".freeze,
      "skos:scopeNote": "Includes the sectors of real estate activities".freeze,
      type: "skos:Concept".freeze
    term :"#A13",
      altLabel: ["M".freeze, "Professional, scientific and technical activities".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Professional, scientific and technical activities".freeze,
      "skos:scopeNote": "Integrates the sectors of professional, scientific and technical".freeze,
      type: "skos:Concept".freeze
    term :"#A14",
      altLabel: ["Administrative and support service activities".freeze, "N".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Administration and management, tourism, rentals".freeze,
      "skos:scopeNote": "Includes the sectors of administrative and support service activities".freeze,
      type: "skos:Concept".freeze
    term :"#A15",
      altLabel: ["O".freeze, "Public administration and defence; compulsory social security".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Public administration and social security".freeze,
      "skos:scopeNote": "Includes the sectors of public administration, defense and compulsory social security".freeze,
      type: "skos:Concept".freeze
    term :"#A16",
      altLabel: ["Education".freeze, "P".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Education and training".freeze,
      "skos:scopeNote": "Integrates education sectors".freeze,
      type: "skos:Concept".freeze
    term :"#A17",
      altLabel: ["Human health and social work activities".freeze, "Q".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Social services, health and employment".freeze,
      "skos:scopeNote": "Includes the sectors of health and social".freeze,
      type: "skos:Concept".freeze
    term :"#A18",
      altLabel: ["Arts, entertainment and recreation".freeze, "R".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: "Arts, culture, recreation and sports".freeze,
      "skos:scopeNote": "Includes the sectors of arts, entertainment and recreation".freeze,
      type: "skos:Concept".freeze
    term :"#A19",
      altLabel: ["Other service activities".freeze, "S".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: ["".freeze, "Membership activities, repairing and wellness".freeze],
      "skos:scopeNote": "Integrates the activities of other sectors of services".freeze,
      type: "skos:Concept".freeze
    term :"#A20",
      altLabel: ["Activities of households as employers; undifferentiated goods- and services-producing activities of households for own use".freeze, "T".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: ["".freeze, "Household activities, self-production, domestic work".freeze],
      "skos:scopeNote": "Integra sectors of activities of households as employers".freeze,
      type: "skos:Concept".freeze
    term :"#A21",
      altLabel: ["Activities of extraterritorial organizations and bodies".freeze, "U".freeze],
      inScheme: "essglobalactivities:activities".freeze,
      prefLabel: ["".freeze, "International diplomacy and cooperation".freeze],
      "skos:scopeNote": "Integra sectors of activities of organizations and bodies".freeze,
      type: "skos:Concept".freeze
    term :activities,
      "dc11:contributor": ["Ana Alice Baptista (analice@dsi.uminho.pt)".freeze, "Daniel Tygel (dtygel@gmail.com)".freeze, "Jason Nardi (jason.nardi@gmail.com)".freeze, "Marc Alphandery (marc.alphandery@wanadoo.fr)".freeze, "Mariana Malta (mariana@iscap.ipp.pt)".freeze],
      "dc11:creator": ["César Araújo (cesar_araujo@sapo.pt)".freeze, "Leonardo Cruz (leonardopscruz@gmail.com)".freeze, "Rodrigo Alves (rasalves@gmail.com)".freeze, "Sérgio Vale (gks_sergio@hotmail.com)".freeze],
      "dc11:description": "Activities controlled vocabulary for SSE".freeze,
      "dc11:language": "en-en".freeze,
      "dc11:modified": "2014-01-25".freeze,
      "dc11:publisher": "http://www.ripess.org/".freeze,
      "dc11:relation": "http://www.dsi.uminho.pt/".freeze,
      "dc11:title": "Activities".freeze,
      "dc:created": "2012-02-20".freeze,
      "dc:publisher": "RIPESS - ESSGlobal".freeze,
      type: "skos:ConceptScheme".freeze
  end
end
