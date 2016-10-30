module LifePreserver
end

require 'html5small/nanoc'
require 'nanoc/cachebuster'
require 'erb'

# Helpers to include in a global context
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Capturing
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::XMLSitemap
include Nanoc::Helpers::CacheBusting
include ERB::Util

include LifePreserver::Blogging
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
include History
include LifePreserver::Filtering
