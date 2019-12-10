source 'https://rubygems.org'

gem 'activesupport'      # for helpful extension methods
gem 'builder'            # for XML stuff, such as sitemap and atom feeds
gem 'chunky_png'         # for PNG generation of qrcodes
gem 'compass'            # for advanced CSS
gem 'ffi-hunspell',      git: 'https://github.com/postmodern/ffi-hunspell' # for spell-checking
gem 'git',               git: 'https://github.com/muellerj/ruby-git' # for version history and tagging info, temporarily using a fork with fixed options for git describe
gem 'haml'
gem 'html5small'         # for compact HTML
gem 'image_optimizer'    # to compress images
gem 'linkeddata'
gem 'locale'
gem 'nanoc'              # for compiling the site
gem 'nanoc-cachebuster', git: 'https://github.com/cdchapman/nanoc-cachebuster', branch: 'nanoc-4'
gem 'net-ldap'
gem 'nokogiri'           # for parsing HTML
gem 'nokogumbo'          # A Nokogiri extension for parsing HTML5
gem 'pandoc-ruby'        # for benefit reports in ConTeXt
gem 'phonelib'           # for parsing phone numbers
gem 'pragmatic_segmenter'
gem 'rainpress'          # for compact CSS
gem 'rest-client'        # for downloads of external resources
gem 'rqrcode'            # for qrcodes
gem 'rubypants-unicode'
gem 'shortly',           git: 'https://github.com/FLEWID-AB/shortly' # for URL shortening
gem 'uglifier'           # for compact JavaScript
gem 'vcardigan'          # for vCards

group :development, optional: true do
  gem 'adsf'              # for nanoc view
  gem 'ghi'               # for GitHub issues
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-nanoc'
  gem 'guard-rake'
end

group :documentation, optional: true do
  gem 'redcarpet'
  gem 'yard'
end

group :test, optional: true do
  gem 'fuubar'
  gem 'minitest'
  gem 'nanoc-spec'
  gem 'rake'
  gem 'rspec'
  gem 'rspec-its'
  gem 'rspec-mocks'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'tty-command'
  gem 'vcr'
  gem 'w3c_validators'
  gem 'watir'
  gem 'webmock'
end
