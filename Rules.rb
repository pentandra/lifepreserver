include_rules 'rules/preprocessing'

# Things to ignore globally
ignore '/**/_*'
ignore '/_*/**/*'
ignore '/lifepreserver/**/*'
ignore '/**/README.md'
ignore '/**/LICENSE'

include_rules 'rules/javascripts'
include_rules 'rules/stylesheets'
include_rules 'rules/other_assets'
include_rules 'rules/meta_files'
include_rules 'rules/company'
include_rules 'rules/blog'
include_rules 'rules/solutions'
include_rules 'rules/articles'

include_rules 'rules/dynamic'

# This should always be last
include_rules 'rules/catch_all'
