# -*- encoding: utf-8 -*-
# frozen_string_literal: true
# This file generated automatically using rdf vocabulary format from http://rdfs.org/sioc/types#
require 'rdf'
module Vocab
  # @!parse
  #   # Vocabulary for <http://rdfs.org/sioc/types#>
  #   class SIOCT < RDF::StrictVocabulary
  #   end
  class SIOCT < RDF::StrictVocabulary("http://rdfs.org/sioc/types#")

    # Class definitions
    term :AddressBook,
      comment: %(Describes a collection of personal or organisational addresses.).freeze,
      label: "Address Book".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :AnnotationSet,
      comment: %(Describes a set of annotations, for example, those created by a particular user or related to a particular topic.).freeze,
      label: "Annotation Set".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Answer,
      comment: %(A Post that provides an answer in reply to a Question.).freeze,
      label: "Answer".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :ArgumentativeDiscussion,
      comment: %(Describes a discussion area where logical arguments can take place.).freeze,
      label: "Argumentative Discussion".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :AudioChannel,
      comment: %(Describes a channel for distributing audio or sound files, for example, a podcast.).freeze,
      label: "Audio Channel".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :BestAnswer,
      comment: %(A Post that is the best answer to a Question, as chosen by the UserAccount who asked the Question or as voted by a Community of UserAccounts.).freeze,
      label: "Best Answer".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :BlogPost,
      comment: %(Describes a post that is specifically made on a weblog.).freeze,
      label: "Blog Post".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :BoardPost,
      comment: %(Describes a post that is specifically made on a message board.).freeze,
      label: "Board Post".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :BookmarkFolder,
      comment: %(Describes a shared collection of bookmarks.).freeze,
      label: "Bookmark Folder".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Briefcase,
      comment: %(Describes a briefcase or file service.).freeze,
      label: "Briefcase".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Category,
      comment: %(Category is used on the object of sioc:topic to indicate that this resource is a category on a site.).freeze,
      label: "Category".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "http://www.w3.org/2008/05/skos#Concept".freeze,
      type: "owl:Class".freeze
    term :ChatChannel,
      comment: %(Describes a channel for chat or instant messages, for example, via IRC or IM.).freeze,
      label: "Chat Channel".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :Comment,
      comment: %(Comment is a subtype of sioc:Post and allows one to explicitly indicate that this SIOC post is a comment.  Note that comments have a narrower scope than sioc:Post and may not apply to all types of community site.).freeze,
      label: "Comment".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :EventCalendar,
      comment: %(Describes a calendar of events.).freeze,
      label: "Event Calendar".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :FavouriteThings,
      comment: %(Describes a list or a collection of one's favourite things.).freeze,
      label: "Favourite Things".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :ImageGallery,
      comment: %(Describes an image gallery, for example, a photo album.).freeze,
      label: "Image Gallery".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :InstantMessage,
      comment: %(Describes an instant message, e.g. sent via Jabber.).freeze,
      label: "Instant Message".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :MailMessage,
      comment: %(Describes an electronic mail message, e.g. a post sent to a mailing list.).freeze,
      label: "Mail Message".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :MailingList,
      comment: %(Describes an electronic mailing list.).freeze,
      label: "Mailing List".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :MessageBoard,
      comment: %(Describes a message board, also known as an online bulletin board or discussion forum.).freeze,
      label: "Message Board".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :Microblog,
      comment: %(Describes a microblog, i.e. a blog consisting of short text messages.).freeze,
      label: "Microblog".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :MicroblogPost,
      comment: %(Describes a post that is specifically made on a microblog.).freeze,
      label: "Microblog Post".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :OfferList,
      comment: %(Describes a list of the items someone has available to offer.).freeze,
      label: "Offer List".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Playlist,
      comment: %(Describes a list of media items that have been played or can be played.).freeze,
      label: "Playlist".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Poll,
      comment: %(Describes a posted item that contains a poll or survey content.).freeze,
      label: "Poll".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Item".freeze,
      type: "owl:Class".freeze
    term :ProjectDirectory,
      comment: %(Describes a project directory.).freeze,
      label: "Project Directory".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Question,
      comment: %(A Post that asks a Question.).freeze,
      label: "Question".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "sioc:Post".freeze,
      type: "owl:Class".freeze
    term :ReadingList,
      comment: %(Describes a list of books or other materials that have been read or are suggested for reading.).freeze,
      label: "Reading List".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :ResumeBank,
      comment: %(Describes a collection of resumes.).freeze,
      label: "Resume Bank".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :ReviewArea,
      comment: %(Describes an area where reviews are posted.).freeze,
      label: "Review Area".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :SubscriptionList,
      comment: %(Describes a shared set of feed subscriptions.).freeze,
      label: "Subscription List".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :SurveyCollection,
      comment: %(Describes an area where survey data can be collected, e.g. from polls.).freeze,
      label: "Survey Collection".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Tag,
      comment: %(Tag is used on the object of sioc:topic to indicate that this resource is a tag on a site.).freeze,
      label: "Tag".freeze,
      :"rdfs:isDefinedBy" => [],
      type: "owl:Class".freeze
    term :VideoChannel,
      comment: %(Describes a channel for distributing videos \(moving image\) files, for example, a video podcast.).freeze,
      label: "Video Channel".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :Weblog,
      comment: %(Describes a weblog \(blog\), i.e. an online journal.).freeze,
      label: "Weblog".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Forum".freeze,
      type: "owl:Class".freeze
    term :Wiki,
      comment: %(Describes a wiki space.).freeze,
      label: "Wiki".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze
    term :WikiArticle,
      comment: %(Describes a wiki article.).freeze,
      label: "Wiki Article".freeze,
      :"rdfs:isDefinedBy" => [],
      :"rdfs:seeAlso" => [],
      subClassOf: "sioc:Item".freeze,
      type: "owl:Class".freeze
    term :WishList,
      comment: %(Describes a list of the items someone wishes to get.).freeze,
      label: "Wish List".freeze,
      :"rdfs:isDefinedBy" => [],
      subClassOf: "sioc:Container".freeze,
      type: "owl:Class".freeze

    # Extra definitions
    term :"",
      :"dc:description" => [],
      :"dc:title" => [],
      label: "".freeze,
      :"owl:imports" => [],
      :"rdfs:seeAlso" => [],
      type: ["owl:Ontology".freeze, "owl:Thing".freeze]
  end
end
