include_rules 'rules/preprocessing'

# Things to ignore globally
ignore '/**/_*'
ignore '/_*/**/*'
ignore '/**/README.md'

include_rules 'rules/javascripts'
include_rules 'rules/stylesheets'
include_rules 'rules/other_assets'
include_rules 'rules/meta_files'
include_rules 'rules/specifications'
include_rules 'rules/company'
include_rules 'rules/blog'

include_rules 'rules/dynamic'

# This should always be last
include_rules 'rules/catch_all'
