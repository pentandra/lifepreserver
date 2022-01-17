# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from https://pentandra.com/company#
require 'rdf'
module LifePreserver::Vocab
  Pentandra = Class.new(RDF::Vocabulary("https://pentandra.com/company#")) do

    # Ontology definition
    ontology :"https://pentandra.com/company#",
      "http://creativecommons.org/ns#attributionName": "Pentandra Research Solutions, Inc.".freeze,
      "http://creativecommons.org/ns#attributionURL": "https://pentandra.com".freeze,
      "http://creativecommons.org/ns#license": "http://creativecommons.org/licenses/by/4.0/".freeze,
      "http://creativecommons.org/ns#useGuidelines": "https://pentandra.com/policy/".freeze,
      "http://ogp.me/ns#description": "Pentandra is a small company of research addicts trying to promote quality research and make collaboration possible throughout the research process.".freeze,
      "http://ogp.me/ns#locale": "en".freeze,
      "http://ogp.me/ns#site_name": "Pentandra".freeze,
      "http://ogp.me/ns#title": "Company".freeze,
      "http://ogp.me/ns#type": "website".freeze,
      "http://ogp.me/ns#url": "https://pentandra.com/company/".freeze,
      "http://schema.org/copyrightHolder": "https://pentandra.com/company#company".freeze,
      "http://schema.org/copyrightYear": "2011".freeze,
      "http://schema.org/hasPart": "pentandra-blog:latest-articles".freeze,
      "http://schema.org/isPartOf": "pentandra-website:website".freeze,
      "http://schema.org/potentialAction": "https://pentandra.com/company#donating".freeze,
      "http://schema.org/publisher": "https://pentandra.com/company#company".freeze,
      "http://xmlns.com/foaf/0.1/primaryTopic": "https://pentandra.com/company#company".freeze,
      type: ["http://creativecommons.org/ns#Work".freeze, "http://schema.org/WebPage".freeze, "http://www.w3.org/ns/prov#Entity".freeze]

    # Extra definitions
    term :company,
      "http://purl.org/essglobal/vocab/economicSector": ["essglobal-activities:A10".freeze, "essglobal-activities:A13".freeze, "essglobal-activities:A16".freeze],
      "http://purl.org/essglobal/vocab/legalForm": "essglobal-legalform:L5".freeze,
      "http://purl.org/essglobal/vocab/mission": "\n\n      Pentandra’s mission is to open up the knowledge of the world, so that light and understanding will be more accessible to everyone.\n      \n\n        We hope that the effect of our mission will be to help bring open\n          research into the mainstream, so that human, enterprise, and\n        organizational silos will be opened and true research collaboration will take\n        place, making it easier for anyone to participate in the research\n        process, seeking truth in a spirit of mutual cooperation, across\n        disciplines, subjects, and skill levels, allowing knowledge to be\n        shared with clarity and in context,\n        so that the bringing together and organization of the knowledge of the\n        world will be accelerated.\n\n      \n    ".freeze,
      "http://purl.org/essglobal/vocab/objective": ["Creating, implementing,\n          and promoting open standards that further open research and help\n          transition research to the World Wide Web.".freeze, "Developing open-source infrastructures\n          and tools that preserve the process of knowledge creation and make\n          open, transparent, real-time, collaborative, cross-discipline\n          research possible.".freeze, "Educating interest groups,\n          governments, and the general public about the short- and long-term\n          benefits of open research, and supporting their efforts as they work\n          to expand the influence of open research on the world.".freeze, "Helping researchers, organizations,\n          and funding agencies discover and transition to policies and\n          incentives that reward collaborative open research, providing\n          consulting services and technical or moral support when needed.".freeze, "Lowering the barrier of entry for the\n          common man and practitioners to participate meaningfully in\n          high-quality research projects, throughout the entire research\n          process.".freeze],
      "http://purl.org/essglobal/vocab/qualifier": "essglobal-qualifiers:Q07".freeze,
      "http://schema.org/description": "\n\n          We are small company of research addicts trying to promote quality\n          research and make collaboration possible throughout the research\n          process.\n\n        ".freeze,
      "http://schema.org/email": "mailto:hello@pentandra.com".freeze,
      "http://schema.org/employee": ["https://pentandra.com/people/chris-chapman/#me".freeze, "https://pentandra.com/people/katie-chapman/#me".freeze],
      "http://schema.org/legalName": "Pentandra Research Solutions, Inc.".freeze,
      "http://schema.org/location": term(
          "http://schema.org/addressCountry": "US".freeze,
          "http://schema.org/addressLocality": "Logan".freeze,
          "http://schema.org/addressRegion": "Utah".freeze,
          "http://schema.org/postalCode": "84341".freeze,
          "http://schema.org/streetAddress": "1475 N 420 W #104".freeze,
          "http://www.w3.org/2006/vcard/ns#country-name": "US".freeze,
          "http://www.w3.org/2006/vcard/ns#locality": "Logan".freeze,
          "http://www.w3.org/2006/vcard/ns#postal-code": "84341".freeze,
          "http://www.w3.org/2006/vcard/ns#region": "Utah".freeze,
          "http://www.w3.org/2006/vcard/ns#street-address": "1475 N 420 W #104".freeze,
          type: ["http://schema.org/PostalAddress".freeze,"http://www.w3.org/2006/vcard/ns#Address".freeze]
        ),
      "http://schema.org/logo": "https://pentandra.com/images/pentandra-logo.png".freeze,
      "http://schema.org/name": "Pentandra Research Solutions, Inc.".freeze,
      "http://schema.org/telephone": "tel:+14352942964".freeze,
      "http://schema.org/url": "https://pentandra.com/".freeze,
      "http://vocab.data.gov/def/fea#hasIntent": "https://pentandra.com/company#mission".freeze,
      "http://www.w3.org/2006/vcard/ns#hasAddress": term(
          "http://schema.org/addressCountry": "US".freeze,
          "http://schema.org/addressLocality": "Logan".freeze,
          "http://schema.org/addressRegion": "Utah".freeze,
          "http://schema.org/postalCode": "84341".freeze,
          "http://schema.org/streetAddress": "1475 N 420 W #104".freeze,
          "http://www.w3.org/2006/vcard/ns#country-name": "US".freeze,
          "http://www.w3.org/2006/vcard/ns#locality": "Logan".freeze,
          "http://www.w3.org/2006/vcard/ns#postal-code": "84341".freeze,
          "http://www.w3.org/2006/vcard/ns#region": "Utah".freeze,
          "http://www.w3.org/2006/vcard/ns#street-address": "1475 N 420 W #104".freeze,
          type: ["http://schema.org/PostalAddress".freeze,"http://www.w3.org/2006/vcard/ns#Address".freeze]
        ),
      "http://www.w3.org/2006/vcard/ns#hasEmail": "mailto:hello@pentandra.com".freeze,
      "http://www.w3.org/2006/vcard/ns#hasLogo": "https://pentandra.com/images/pentandra-logo.png".freeze,
      "http://www.w3.org/2006/vcard/ns#hasTelephone": "tel:+14352942964".freeze,
      "http://www.w3.org/2006/vcard/ns#hasURL": "https://pentandra.com/".freeze,
      "http://www.w3.org/2006/vcard/ns#rev": "2019-11-12T03:43:27Z".freeze,
      "http://www.w3.org/ns/org#purpose": "Pentandra’s mission is to open up the knowledge of the world, so that light and understanding will be more accessible to everyone.".freeze,
      "http://www.w3.org/ns/regorg#legalName": "Pentandra Research Solutions, Inc.".freeze,
      "http://xmlns.com/foaf/0.1/account": [term(
          "http://xmlns.com/foaf/0.1/accountName": "PentandraInc".freeze,
          "http://xmlns.com/foaf/0.1/accountServiceHomepage": "https://twitter.com/".freeze,
          type: "http://xmlns.com/foaf/0.1/OnlineAccount".freeze
        ), term(
          "http://xmlns.com/foaf/0.1/accountName": "PentandraInc".freeze,
          "http://xmlns.com/foaf/0.1/accountServiceHomepage": "https://www.facebook.com/".freeze,
          type: "http://xmlns.com/foaf/0.1/OnlineAccount".freeze
        )],
      "http://xmlns.com/foaf/0.1/homepage": "https://pentandra.com/".freeze,
      type: ["http://purl.org/essglobal/vocab/SSEInitiative".freeze, "http://schema.org/Corporation".freeze, "http://vocab.data.gov/def/fea#Company".freeze, "http://www.w3.org/2006/vcard/ns#Organization".freeze, "http://www.w3.org/ns/org#FormalOrganization".freeze, "http://www.w3.org/ns/regorg#RegisteredOrganization".freeze, "http://xmlns.com/foaf/0.1/Organization".freeze]
    term :contact,
      type: "http://schema.org/ContactPage".freeze
    term :"core-team",
      "http://www.w3.org/2006/vcard/ns#hasMember": ["https://pentandra.com/people/chris-chapman/#me".freeze, "https://pentandra.com/people/katie-chapman/#me".freeze],
      "http://xmlns.com/foaf/0.1/member": ["https://pentandra.com/people/chris-chapman/#me".freeze, "https://pentandra.com/people/katie-chapman/#me".freeze],
      "http://xmlns.com/foaf/0.1/name": "Core Team".freeze,
      type: "http://xmlns.com/foaf/0.1/Group".freeze
    term :donating,
      "http://schema.org/description": "\n          \n\n            If you like what we’re doing, but are not\n            interested in the technicalities of investing, please consider\n            donating. As we’ve started out, we’ve relied on the generous contributions of many to\n            keep us going while we work to reach sustained profitability.\n\n          \n        ".freeze,
      "http://schema.org/name": "Donating".freeze,
      "http://schema.org/recipient": "https://pentandra.com/company#company".freeze,
      "http://schema.org/target": "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MP56WPL8KFLH8".freeze,
      type: "http://schema.org/DonateAction".freeze
    term :mission,
      "http://vocab.data.gov/def/fea#description": "Pentandra’s mission is to open up the knowledge of the world, so that light and understanding will be more accessible to everyone.".freeze,
      type: "http://vocab.data.gov/def/fea#Mission".freeze
  end
end
