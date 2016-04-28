require 'compass/import-once/activate'
# Require any additional compass plugins here.

http_path             = "/"
project_path          = File.expand_path(File.join(File.dirname(__FILE__), '../../'))
css_dir               = "content/assets/stylesheets"
sass_dir              = "content/assets/stylesheets"
images_dir            = "content/assets/images"
javascripts_dir       = "content/assets/scripts"
fonts_dir             = "content/assets/fonts"
http_javascripts_path = "js"
http_stylesheets_path = "css"
http_images_path      = "images"
http_fonts_dir        = "fonts"

# when using SCSS:
sass_options = {
  :syntax => :scss
}

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
output_style = (ENV['NANOC_ENV'] == 'production') ? :compressed : :expanded

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false

# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
