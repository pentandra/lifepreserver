# frozen_string_literal: true

require 'compass/import-once/activate'
# Require any additional compass plugins here.

add_import_path 'static/assets/components/retina.js/src'

http_path             = '/'
project_path          = File.expand_path(File.join(File.dirname(__FILE__), '../../'))
css_dir               = 'static/assets/stylesheets'
sass_dir              = 'static/assets/stylesheets'
images_dir            = 'static/assets/images'
javascripts_dir       = 'static/assets/scripts'
fonts_dir             = 'static/assets/fonts'
http_javascripts_path = 'js'
http_stylesheets_path = 'css'
http_images_path      = 'images'
http_fonts_dir        = 'fonts'

# when using SCSS:
sass_options = { syntax: :scss }

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
output_style = ENV['NANOC_ENV'] == 'development' ? :expanded : :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false

# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
