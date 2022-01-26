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
use_helper Nanoc::Helpers::Capturing
use_helper Nanoc::Helpers::Rendering
use_helper Nanoc::Helpers::CacheBusting
use_helper Nanoc::Helpers::Filtering

module LifePreserver
end

# Project helpers to include in a global context
use_helper LifePreserver::Helpers::Blogging
use_helper LifePreserver::Helpers::Weblog
use_helper LifePreserver::Helpers::Dates
use_helper LifePreserver::Helpers::Company
use_helper LifePreserver::Helpers::UrlShortener
use_helper LifePreserver::Helpers::Search
use_helper LifePreserver::Helpers::Functional
use_helper LifePreserver::Helpers::Breadcrumbs
use_helper LifePreserver::Helpers::Text
use_helper LifePreserver::Helpers::Vocabulary
use_helper LifePreserver::Helpers::Tagging
use_helper LifePreserver::Helpers::LinkTo
use_helper LifePreserver::Helpers::Reporting
use_helper LifePreserver::Helpers::Meta
use_helper LifePreserver::Helpers::AtomFeed
use_helper LifePreserver::Helpers::Dictionaries
use_helper LifePreserver::Helpers::Dependencies
use_helper LifePreserver::Helpers::Proposals
use_helper LifePreserver::Helpers::ChildParent
use_helper LifePreserver::Helpers::People
use_helper LifePreserver::Helpers::XMLSitemap

require 'phonelib'

Phonelib.extension_separator = ';ext='
Phonelib.extension_separate_symbols = %w[x ext # ; extension]
