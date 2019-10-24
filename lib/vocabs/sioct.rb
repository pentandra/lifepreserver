# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://rdfs.org/sioc/types#
require 'rdf'
module RDF::Vocab
  # @!parse
  #   # Vocabulary for <http://rdfs.org/sioc/types#>
  #   class SIOCT < RDF::StrictVocabulary
  #   end
  class SIOCT < RDF::StrictVocabulary("http://rdfs.org/sioc/types#")

    # Ontology definition
    ontology :"http://rdfs.org/sioc/types#",
      "dc:description": "Extends the SIOC Core Ontology (Semantically-Interlinked Online Communities) by defining subclasses and subproperties of SIOC terms.".freeze,
      "dc:title": "SIOC Types Ontology Module Namespace".freeze,
      "owl:imports": "sioc:".freeze,
      "rdfs:seeAlso": "http://rdfs.org/sioc/spec/#sec-modules".freeze,
      type: ["owl:Ontology".freeze, "owl:Thing".freeze]

    # Class definitions
    term :AddressBook,
      comment: %(Describes a collection of personal or organisational addresses.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Address Book".freeze,
      "rdfs:seeAlso": "foaf:Agent".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :AnnotationSet,
      comment: %(Describes a set of annotations, for example, those created by a particular user or related to a particular topic.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Annotation Set".freeze,
      "rdfs:seeAlso": "http://www.w3.org/2000/10/annotation-ns#Annotation".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Answer,
      comment: %(A Post that provides an answer in reply to a Question.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Answer".freeze,
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :ArgumentativeDiscussion,
      comment: %(Describes a discussion area where logical arguments can take place.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Argumentative Discussion".freeze,
      "rdfs:seeAlso": "http://purl.org/ibis#Idea".freeze,
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :AudioChannel,
      comment: %(Describes a channel for distributing audio or sound files, for example, a podcast.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Audio Channel".freeze,
      "rdfs:seeAlso": "dcmitype:Sound".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :BestAnswer,
      comment: %(A Post that is the best answer to a Question, as chosen by the UserAccount who asked the Question or as voted by a Community of UserAccounts.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Best Answer".freeze,
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :BlogPost,
      comment: %(Describes a post that is specifically made on a weblog.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Blog Post".freeze,
      "rdfs:seeAlso": "sioct:Weblog".freeze,
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :BoardPost,
      comment: %(Describes a post that is specifically made on a message board.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Board Post".freeze,
      "rdfs:seeAlso": "sioct:MessageBoard".freeze,
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :BookmarkFolder,
      comment: %(Describes a shared collection of bookmarks.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Bookmark Folder".freeze,
      "rdfs:seeAlso": "http://www.w3.org/2002/01/bookmark#Bookmark".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Briefcase,
      comment: %(Describes a briefcase or file service.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Briefcase".freeze,
      "rdfs:seeAlso": "foaf:Document".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Category,
      comment: %(Category is used on the object of sioc:topic to indicate that this resource is a category on a site.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Category".freeze,
      subClassOf: "http://www.w3.org/2008/05/skos#Concept".freeze,
      type: "owl:Class".freeze
    term :ChatChannel,
      comment: %(Describes a channel for chat or instant messages, for example, via IRC or IM.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Chat Channel".freeze,
      "rdfs:seeAlso": "sioct:InstantMessage".freeze,
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :Comment,
      comment: %(Comment is a subtype of sioc:Post and allows one to explicitly indicate that this SIOC post is a comment.  Note that comments have a narrower scope than sioc:Post and may not apply to all types of community site.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Comment".freeze,
      "rdfs:seeAlso": "sioct:Forum".freeze,
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :EventCalendar,
      comment: %(Describes a calendar of events.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Event Calendar".freeze,
      "rdfs:seeAlso": "ical:VEVENT".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :FavouriteThings,
      comment: %(Describes a list or a collection of one's favourite things.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Favourite Things".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :ImageGallery,
      comment: %(Describes an image gallery, for example, a photo album.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Image Gallery".freeze,
      "rdfs:seeAlso": "http://www.w3.org/2003/12/exif/ns/IFD".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :InstantMessage,
      comment: %(Describes an instant message, e.g. sent via Jabber.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Instant Message".freeze,
      "rdfs:seeAlso": "sioct:ChatChannel".freeze,
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :MailMessage,
      comment: %(Describes an electronic mail message, e.g. a post sent to a mailing list.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Mail Message".freeze,
      "rdfs:seeAlso": "sioct:MailingList".freeze,
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :MailingList,
      comment: %(Describes an electronic mailing list.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Mailing List".freeze,
      "rdfs:seeAlso": "sioct:MailMessage".freeze,
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :MessageBoard,
      comment: %(Describes a message board, also known as an online bulletin board or discussion forum.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Message Board".freeze,
      "rdfs:seeAlso": "sioct:BoardPost".freeze,
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :Microblog,
      comment: %(Describes a microblog, i.e. a blog consisting of short text messages.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Microblog".freeze,
      "rdfs:seeAlso": "sioct:MicroblogPost".freeze,
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :MicroblogPost,
      comment: %(Describes a post that is specifically made on a microblog.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Microblog Post".freeze,
      "rdfs:seeAlso": "sioct:Microblog".freeze,
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :OfferList,
      comment: %(Describes a list of the items someone has available to offer.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Offer List".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Playlist,
      comment: %(Describes a list of media items that have been played or can be played.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Playlist".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Poll,
      comment: %(Describes a posted item that contains a poll or survey content.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Poll".freeze,
      "rdfs:seeAlso": "sioct:SurveyCollection".freeze,
      subClassOf: "sioc:Item".freeze,
      type: "owl:Class".freeze
    term :ProjectDirectory,
      comment: %(Describes a project directory.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Project Directory".freeze,
      "rdfs:seeAlso": "doap:Project".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Question,
      comment: %(A Post that asks a Question.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Question".freeze,
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :ReadingList,
      comment: %(Describes a list of books or other materials that have been read or are suggested for reading.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Reading List".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :ResumeBank,
      comment: %(Describes a collection of resumes.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Resume Bank".freeze,
      "rdfs:seeAlso": "http://captsolo.net/semweb/resume/cv.rdfs#Resume".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :ReviewArea,
      comment: %(Describes an area where reviews are posted.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Review Area".freeze,
      "rdfs:seeAlso": ["http://purl.org/stuff/rev#Review".freeze, "http://www.isi.edu/webscripter/communityreview/abstract-review-o#Review".freeze],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :SubscriptionList,
      comment: %(Describes a shared set of feed subscriptions.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Subscription List".freeze,
      "rdfs:seeAlso": "http://atomowl.org/ontologies/atomrdf#Feed".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :SurveyCollection,
      comment: %(Describes an area where survey data can be collected, e.g. from polls.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Survey Collection".freeze,
      "rdfs:seeAlso": "sioct:Poll".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Tag,
      comment: %(Tag is used on the object of sioc:topic to indicate that this resource is a tag on a site.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Tag".freeze,
      type: "owl:Class".freeze
    term :VideoChannel,
      comment: %(Describes a channel for distributing videos \(moving image\) files, for example, a video podcast.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Video Channel".freeze,
      "rdfs:seeAlso": "dcmitype:MovingImage".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Weblog,
      comment: %(Describes a weblog \(blog\), i.e. an online journal.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Weblog".freeze,
      "rdfs:seeAlso": "sioct:BlogPost".freeze,
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :Wiki,
      comment: %(Describes a wiki space.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Wiki".freeze,
      "rdfs:seeAlso": "sioct:WikiArticle".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :WikiArticle,
      comment: %(Describes a wiki article.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Wiki Article".freeze,
      "rdfs:seeAlso": "sioct:Wiki".freeze,
      subClassOf: "sioc:Item".freeze,
      type: "owl:Class".freeze
    term :WishList,
      comment: %(Describes a list of the items someone wishes to get.).freeze,
      isDefinedBy: "sioct:".freeze,
      label: "Wish List".freeze,
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
  end
end
