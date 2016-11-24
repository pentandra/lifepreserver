source 'https://rubygems.org'

gem 'nanoc'              # for compiling the site
gem 'compass'            # for advanced CSS
gem 'kramdown'           # for advanced markdown
gem 'nokogiri'           # for parsing HTML
gem 'rainpress'          # for compact CSS
gem 'uglifier'           # for compact JavaScript
gem 'html5small'         # for compact HTML
gem 'activesupport'      # for helpful extension methods
gem 'vcardigan'          # for vCards
gem 'rqrcode'            # for qrcodes
gem 'chunky_png'         # for PNG generation of qrcodes
gem 'image_optimizer'    # to compress images
gem 'shortly'            # for URL shortening
gem 'rest-client'        # for downloads of external resources
gem 'rubypants-unicode'
gem 'linkeddata'
gem 'rdf-vocab',         git: 'https://github.com/ruby-rdf/rdf-vocab.git',      branch: 'develop' # for latest code (included in `linkeddata` gem)
gem 'rdf',               git: 'https://github.com/ruby-rdf/rdf.git',            branch: 'develop' # for latest code (included in `linkeddata` gem)
gem 'nanoc-cachebuster', git: 'https://github.com/cdchapman/nanoc-cachebuster', branch: 'nanoc-4'
gem 'rouge'
gem 'haml'
gem 'pandoc-ruby'        # for benefit reports in ConTeXt
gem 'git'                # for version history and tagging info
gem 'builder'            # for XML stuff, such as sitemap and atom feeds
gem 'ffi-hunspell',      git: 'https://github.com/cdchapman/ffi-hunspell'       # for spellchecking

group :development, optional: true do
  gem 'guard'
  gem 'guard-nanoc'
  gem 'guard-livereload'
  gem 'adsf'              # for nanoc view
  gem 'ghi'               # for GitHub issues
end

group :test, optional: true do
  gem 'rspec'
  gem 'rspec-mocks'
  gem 'rake'
  gem 'rubocop'
end
