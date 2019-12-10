# frozen_string_literal: true

# Ruby stdlib
require 'erb'
require 'uri'

# External gems
require 'locale'

# Ruby stdlib utility functions
include ERB::Util

# Third-party Nanoc filters
require 'html5small/nanoc'
require 'nanoc/cachebuster'

# Nanoc helpers to include in a global context
include Nanoc::Helpers::Capturing
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::XMLSitemap
include Nanoc::Helpers::CacheBusting
include Nanoc::Helpers::Filtering

module LifePreserver
end

# Project helpers to include in a global context
include LifePreserver::Helpers::Articles
include LifePreserver::Helpers::Blogging
include LifePreserver::Helpers::Weblog
include LifePreserver::Helpers::Dates
include LifePreserver::Helpers::Company
include LifePreserver::Helpers::UrlShortener
include LifePreserver::Helpers::Search
include LifePreserver::Helpers::Functional
include LifePreserver::Helpers::Breadcrumbs
include LifePreserver::Helpers::Text
include LifePreserver::Helpers::Vocabulary
include LifePreserver::Helpers::Tagging
include LifePreserver::Helpers::LinkTo
include LifePreserver::Helpers::Reporting
include LifePreserver::Helpers::Meta
include LifePreserver::Helpers::AtomFeed
include LifePreserver::Helpers::Dictionaries
include LifePreserver::Helpers::Dependencies
include LifePreserver::Helpers::Proposals
include LifePreserver::Helpers::ChildParent
include LifePreserver::Helpers::People

require 'phonelib'

Phonelib.extension_separator = ';ext='
Phonelib.extension_separate_symbols = %w[x ext # ; extension]
