# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from https://pentandra.com/company#
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <https://pentandra.com/company#>
  #   class PENTANDRA < RDF::Vocabulary
  #   end
  class PENTANDRA < RDF::Vocabulary("https://pentandra.com/company#")

    # Ontology definition
    ontology :"https://pentandra.com/company#",
      "cc:attributionName": "Pentandra Research Solutions, Inc.".freeze,
      "cc:attributionURL": "https://pentandra.com".freeze,
      "cc:license": "http://creativecommons.org/licenses/by/4.0/".freeze,
      "cc:useGuidelines": "https://pentandra.com/policy/".freeze,
      "foaf:primaryTopic": "pentandra:company".freeze,
      "og:description": "Who we are and what we stand for.".freeze,
      "og:locale": "en_US".freeze,
      "og:site_name": "Pentandra".freeze,
      "og:title": "Company".freeze,
      "og:type": "website".freeze,
      "og:url": "https://pentandra.com/company/".freeze,
      "schema:copyrightHolder": "pentandra:company".freeze,
      "schema:copyrightYear": "2011".freeze,
      "schema:hasPart": "pentandra-blog:latest-articles".freeze,
      "schema:isPartOf": "pentandra-website:website".freeze,
      "schema:potentialAction": "pentandra:donating".freeze,
      "schema:publisher": "pentandra:company".freeze,
      type: ["cc:Work".freeze, "prov:Entity".freeze, "schema:WebPage".freeze]

    # Extra definitions
    term :company,
      "foaf:homepage": "https://pentandra.com/".freeze,
      "http://purl.org/essglobal/vocab/economicSector": ["essglobal-activities:A10".freeze, "essglobal-activities:A13".freeze, "essglobal-activities:A16".freeze],
      "http://purl.org/essglobal/vocab/legalForm": "essglobal-legalform:L5".freeze,
      "http://purl.org/essglobal/vocab/mission": "\n\n      Pentandra’s mission is to open up the knowledge of the world, so that light and understanding will be more accessible to everyone.\n      \n\n        We hope that the effect of our mission will be to help bring open\n          research into the mainstream, so that human, enterprise, and\n        organizational silos will be opened and true research collaboration will take\n        place, making it easier for anyone to participate in the research\n        process, seeking truth in a spirit of mutual cooperation, across\n        disciplines, subjects, and skill levels, allowing knowledge to be\n        shared with clarity and in context,\n        so that the bringing together and organization of the knowledge of the\n        world will be accelerated.\n\n      \n    ".freeze,
      "http://purl.org/essglobal/vocab/objective": ["Creating, implementing,\n          and promoting open standards that further open research and help\n          transition research to the World Wide Web.".freeze, "Developing open-source infrastructures\n          and tools that preserve the process of knowledge creation and make\n          open, transparent, real-time, collaborative, cross-discipline\n          research possible.".freeze, "Educating interest groups,\n          governments, and the general public about the short- and long-term\n          benefits of open research, and supporting their efforts as they work\n          to expand the influence of open research on the world.".freeze, "Helping researchers, organizations,\n          and funding agencies discover and transition to policies and\n          incentives that reward collaborative open research, providing\n          consulting services and technical or moral support when needed.".freeze, "Lowering the barrier of entry for the\n          common man and practitioners to participate meaningfully in\n          high-quality research projects, throughout the entire research\n          process.".freeze],
      "http://purl.org/essglobal/vocab/qualifier": "essglobal-qualifiers:Q07".freeze,
      "http://vocab.data.gov/def/fea#hasIntent": "pentandra:mission".freeze,
      "http://www.w3.org/ns/regorg#legalName": "Pentandra Research Solutions, Inc.".freeze,
      "org:purpose": "Pentandra’s mission is to open up the knowledge of the world, so that light and understanding will be more accessible to everyone.".freeze,
      "schema:description": "\n\n          We are small company of research addicts trying to promote quality\n          research and make collaboration possible throughout the research\n          process.\n\n        ".freeze,
      "schema:email": "mailto:hello@pentandra.com".freeze,
      "schema:employee": ["https://pentandra.com/people/chris-chapman/#me".freeze, "https://pentandra.com/people/katie-chapman/#me".freeze],
      "schema:legalName": "Pentandra Research Solutions, Inc.".freeze,
      "schema:location": term(
          "schema:addressCountry": "USA".freeze,
          "schema:addressLocality": "Logan".freeze,
          "schema:addressRegion": "UT".freeze,
          type: ["schema:PostalAddress".freeze,"vcard:Address".freeze],
          "vcard:country-name": "USA".freeze,
          "vcard:locality": "Logan".freeze,
          "vcard:region": "UT".freeze
        ),
      "schema:logo": "https://pentandra.com/images/pentandra-logo.png".freeze,
      "schema:name": "Pentandra Research Solutions, Inc.".freeze,
      "schema:sameAs": ["http://www.facebook.com/PentandraInc".freeze, "https://twitter.com/PentandraInc".freeze],
      "schema:telephone": "tel:+14352942964".freeze,
      "schema:url": "https://pentandra.com/".freeze,
      type: ["foaf:Organization".freeze, "http://purl.org/essglobal/vocab/SSEInitiative".freeze, "http://vocab.data.gov/def/fea#Company".freeze, "http://www.w3.org/ns/regorg#RegisteredOrganization".freeze, "org:FormalOrganization".freeze, "schema:Corporation".freeze, "vcard:Organization".freeze],
      "vcard:hasAddress": term(
          "schema:addressCountry": "USA".freeze,
          "schema:addressLocality": "Logan".freeze,
          "schema:addressRegion": "UT".freeze,
          type: ["schema:PostalAddress".freeze,"vcard:Address".freeze],
          "vcard:country-name": "USA".freeze,
          "vcard:locality": "Logan".freeze,
          "vcard:region": "UT".freeze
        ),
      "vcard:hasEmail": "mailto:hello@pentandra.com".freeze,
      "vcard:hasLogo": "https://pentandra.com/images/pentandra-logo.png".freeze,
      "vcard:hasTelephone": "tel:+14352942964".freeze,
      "vcard:hasURL": "https://pentandra.com/".freeze,
      "vcard:rev": "2019-10-08".freeze
    term :contact,
      type: "schema:ContactPage".freeze
    term :"core-team",
      "foaf:member": ["https://pentandra.com/people/chris-chapman/#me".freeze, "https://pentandra.com/people/katie-chapman/#me".freeze],
      "foaf:name": "Core Team".freeze,
      type: "foaf:Group".freeze,
      "vcard:hasMember": ["https://pentandra.com/people/chris-chapman/#me".freeze, "https://pentandra.com/people/katie-chapman/#me".freeze]
    term :donating,
      "schema:description": "\n          \n\n            If you like what we’re doing, but are not\n            interested in the technicalities of investing, please consider\n            donating. As we’ve started out, we’ve relied on the generous contributions of many to\n            keep us going while we work to reach sustained profitability.\n\n          \n        ".freeze,
      "schema:name": "Donating".freeze,
      "schema:recipient": "pentandra:company".freeze,
      "schema:target": "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MP56WPL8KFLH8".freeze,
      type: "schema:DonateAction".freeze
    term :mission,
      "http://vocab.data.gov/def/fea#description": "Pentandra’s mission is to open up the knowledge of the world, so that light and understanding will be more accessible to everyone.".freeze,
      type: "http://vocab.data.gov/def/fea#Mission".freeze
  end
end
