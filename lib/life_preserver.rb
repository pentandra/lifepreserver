# frozen_string_literal: true

module LifePreserver
end

require 'html5small/nanoc'
require 'nanoc/cachebuster'
require 'erb'

# Helpers to include in a global context
include Nanoc::Helpers::Capturing
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::XMLSitemap
include Nanoc::Helpers::CacheBusting
include Nanoc::Helpers::Filtering
include ERB::Util

include LifePreserver::Articles
include LifePreserver::Blogging
include LifePreserver::Weblog
include LifePreserver::Dates
include LifePreserver::Company
include LifePreserver::UrlShortener
include LifePreserver::Search
include LifePreserver::Functional
include Breadcrumbs
include LifePreserver::Text
include LifePreserver::Vocabulary
include LifePreserver::Tagging
include LifePreserver::LinkTo
include LifePreserver::Reporting
include LifePreserver::Meta
include LifePreserver::AtomFeed
include LifePreserver::Dictionaries
include LifePreserver::Dependencies
include LifePreserver::Proposals
include LifePreserver::ChildParent
include LifePreserver::People

require 'phonelib'

Phonelib.extension_separator = ';ext='
Phonelib.extension_separate_symbols = %w(x ext # ; extension)
