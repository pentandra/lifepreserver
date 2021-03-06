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
    ontology :"https://pentandra.com/company",
      :"cc:attributionName" => %(Pentandra Research Solutions, Inc.).freeze,
      :"cc:attributionURL" => %(https://pentandra.com).freeze,
      :"cc:license" => %(http://creativecommons.org/licenses/by/4.0/).freeze,
      :"cc:useGuidelines" => %(https://pentandra.com/policy/).freeze,
      :"foaf:primaryTopic" => %(pentandra:company).freeze,
      :"og:description" => %(Who we are and what we stand for.).freeze,
      :"og:locale" => %(en_US).freeze,
      :"og:site_name" => %(Pentandra).freeze,
      :"og:title" => %(Company).freeze,
      :"og:type" => %(website).freeze,
      :"og:url" => %(https://pentandra.com/company/).freeze,
      :"schema:copyrightHolder" => %(pentandra:company).freeze,
      :"schema:copyrightYear" => %(2011).freeze,
      :"schema:hasPart" => %(pentandra-blog:latest-articles).freeze,
      :"schema:isPartOf" => %(pentandra-website:website).freeze,
      :"schema:potentialAction" => %(pentandra:donating).freeze,
      :"schema:publisher" => %(pentandra:company).freeze,
      type: ["cc:Work".freeze, "prov:Entity".freeze, "schema:WebPage".freeze]

    # Extra definitions
    term :"chris-chapman",
      :"foaf:account" => [%(https://github.com/cdchapman).freeze, %(https://plus.google.com/102332274449851755462?prsrc=3).freeze, %(https://twitter.com/cd_chapman).freeze],
      :"foaf:img" => %(https://pentandra.com/images/chris-chapman.jpg).freeze,
      :"foaf:isPrimaryTopicOf" => %(pentandra:chris-chapman).freeze,
      :"foaf:mbox" => %(mailto:chris@pentandra.com).freeze,
      :"foaf:name" => %(Chris Chapman).freeze,
      label: "chris-chapman".freeze,
      :"schema:description" => %(Chris loves to tackle difficult problems and dreams \(literally\) about making research easier. He is our systems thinker.).freeze,
      :"schema:email" => %(mailto:chris@pentandra.com).freeze,
      :"schema:image" => %(https://pentandra.com/images/chris-chapman.jpg).freeze,
      :"schema:jobTitle" => %(Co-founder and Super Coder).freeze,
      :"schema:name" => %(Chris Chapman).freeze,
      :"schema:worksFor" => %(pentandra:company).freeze,
      type: ["foaf:Person".freeze, "schema:Person".freeze, "vcard:Individual".freeze],
      :"vcard:fn" => %(Chris Chapman).freeze,
      :"vcard:hasEmail" => %(mailto:chris@pentandra.com).freeze,
      :"vcard:hasGender" => %(vcard:Male).freeze,
      :"vcard:hasPhoto" => %(https://pentandra.com/images/chris-chapman.jpg).freeze,
      :"vcard:rev" => %(2017-03-28).freeze,
      :"vcard:title" => %(Co-founder and Super Coder).freeze
    term :company,
      :"foaf:homepage" => %(https://pentandra.com/).freeze,
      :"http://purl.org/essglobal/vocab/economicSector" => [%(essglobal-activities:A10).freeze, %(essglobal-activities:A13).freeze, %(essglobal-activities:A16).freeze],
      :"http://purl.org/essglobal/vocab/legalForm" => %(essglobal-legalform:L5).freeze,
      :"http://purl.org/essglobal/vocab/mission" => %(

      Pentandra’s mission is to open up the knowledge of the world, so that light and understanding will be more accessible to everyone.
      
        
        We hope that the effect of our mission will be to help bring open
          research into the mainstream, so that human, enterprise, and
        organizational silos will be opened and true research collaboration will take
        place, making it easier for anyone to participate in the research
        process, seeking truth in a spirit of mutual cooperation, across
        disciplines, subjects, and skill levels, allowing knowledge to be
        shared with clarity and in context,
        so that the bringing together and organization of the knowledge of the
        world will be accelerated.

      
    ).freeze,
      :"http://purl.org/essglobal/vocab/objective" => [%(Creating, implementing,
          and promoting open standards that further open research and help
          transition research to the World Wide Web.).freeze, %(Developing open-source infrastructures
          and tools that preserve the process of knowledge creation and make
          open, transparent, real-time, collaborative, cross-discipline
          research possible.).freeze, %(Educating interest groups,
          governments, and the general public about the short- and long-term
          benefits of open research, and supporting their efforts as they work
          to expand the influence of open research on the world.).freeze, %(Helping researchers, organizations,
          and funding agencies discover and transition to policies and
          incentives that reward collaborative open research, providing
          consulting services and technical or moral support when needed.).freeze, %(Lowering the barrier of entry for the
          common man and practitioners to participate meaningfully in
          high-quality research projects, throughout the entire research
          process.).freeze],
      :"http://purl.org/essglobal/vocab/qualifier" => %(essglobal-qualifiers:Q07).freeze,
      :"http://vocab.data.gov/def/fea#hasIntent" => %(pentandra:mission).freeze,
      :"http://www.w3.org/ns/regorg#legalName" => %(Pentandra Research Solutions, Inc.).freeze,
      label: "company".freeze,
      :"schema:description" => %(

          We are small company of research addicts trying to promote quality
          research and make collaboration possible throughout the research
          process.

        ).freeze,
      :"schema:email" => %(mailto:hello@pentandra.com).freeze,
      :"schema:employee" => [%(pentandra:chris-chapman).freeze, %(pentandra:katie-chapman).freeze],
      :"schema:legalName" => %(Pentandra Research Solutions, Inc.).freeze,
      :"schema:logo" => %(https://pentandra.com/images/pentandra-logo.png).freeze,
      :"schema:name" => %(Pentandra Research Solutions, Inc.).freeze,
      :"schema:sameAs" => [%(http://www.facebook.com/PentandraInc).freeze, %(https://plus.google.com/+Pentandra).freeze, %(https://twitter.com/PentandraInc).freeze],
      :"schema:telephone" => %(tel:+14352942964).freeze,
      :"schema:url" => %(https://pentandra.com/).freeze,
      type: ["foaf:Organization".freeze, "http://purl.org/essglobal/vocab/SSEInitiative".freeze, "http://vocab.data.gov/def/fea#Company".freeze, "http://www.w3.org/ns/regorg#RegisteredOrganization".freeze, "schema:Corporation".freeze, "vcard:Organization".freeze],
      :"vcard:hasEmail" => %(mailto:hello@pentandra.com).freeze,
      :"vcard:hasLogo" => %(https://pentandra.com/images/pentandra-logo.png).freeze,
      :"vcard:hasTelephone" => %(tel:+14352942964).freeze,
      :"vcard:hasURL" => %(https://pentandra.com/).freeze,
      :"vcard:rev" => %(2017-03-28).freeze
    term :contact,
      label: "contact".freeze,
      type: "schema:ContactPage".freeze
    term :"core-team",
      :"foaf:member" => [%(pentandra:chris-chapman).freeze, %(pentandra:katie-chapman).freeze],
      :"foaf:name" => %(Core Team).freeze,
      label: "core-team".freeze,
      type: "foaf:Group".freeze,
      :"vcard:hasMember" => [%(pentandra:chris-chapman).freeze, %(pentandra:katie-chapman).freeze]
    term :donating,
      label: "donating".freeze,
      :"schema:description" => %(
          

            If you like what we’re doing, but are not
            interested in the technicalities of investing, please consider
            donating. As we’ve started out, we’ve relied on the generous contributions of many to
            keep us going while we work to reach sustained profitability.

          
        ).freeze,
      :"schema:name" => %(Donating).freeze,
      :"schema:recipient" => %(pentandra:company).freeze,
      :"schema:target" => %(https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MP56WPL8KFLH8).freeze,
      type: "schema:DonateAction".freeze
    term :"katie-chapman",
      :"foaf:account" => [%(https://plus.google.com/104975395018953249008?prsrc=3).freeze, %(https://twitter.com/KAMChapman).freeze],
      :"foaf:img" => %(https://pentandra.com/images/katie-chapman.jpg).freeze,
      :"foaf:isPrimaryTopicOf" => %(pentandra:katie-chapman).freeze,
      :"foaf:mbox" => %(mailto:katie@pentandra.com).freeze,
      :"foaf:name" => %(Katie Chapman).freeze,
      label: "katie-chapman".freeze,
      :"schema:description" => %(Katie loves to solve a good puzzle and thrives on the details. She is also our finance and tax geek and actually enjoys it.).freeze,
      :"schema:email" => %(mailto:katie@pentandra.com).freeze,
      :"schema:image" => %(https://pentandra.com/images/katie-chapman.jpg).freeze,
      :"schema:jobTitle" => %(Co-founder and Exception Thinker).freeze,
      :"schema:name" => %(Katie Chapman).freeze,
      :"schema:worksFor" => %(pentandra:company).freeze,
      type: ["foaf:Person".freeze, "schema:Person".freeze, "vcard:Individual".freeze],
      :"vcard:fn" => %(Katie Chapman).freeze,
      :"vcard:hasEmail" => %(mailto:katie@pentandra.com).freeze,
      :"vcard:hasGender" => %(vcard:Female).freeze,
      :"vcard:hasPhoto" => %(https://pentandra.com/images/katie-chapman.jpg).freeze,
      :"vcard:rev" => %(2017-03-28).freeze,
      :"vcard:title" => %(Co-founder and Exception Thinker).freeze
    term :mission,
      :"http://vocab.data.gov/def/fea#description" => %(Pentandra’s mission is to open up the knowledge of the world, so that light and understanding will be more accessible to everyone.).freeze,
      label: "mission".freeze,
      type: "http://vocab.data.gov/def/fea#Mission".freeze
  end
end
