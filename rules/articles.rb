# Formal articles
compile '/static/articles/*/*.md' do
  filter :erb, @config[:erb]
  filter :pandoc, args: [
    { from: :"markdown+emoji", to: :html5 },
    { base_header_level: 2 },
    :section_divs,
    :normalize,
    :smart,
  ]
  filter :absolutify_paths, type: :html
  filter :spellchecker, type: :html
  filter :abbreviate, type: :html
  snapshot :pre_identifier_links
  filter :identifier_links
  layout '/articles/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

compile '/static/articles/*/*.md', rep: :feed_entry do
  filter :erb, @config[:erb]
  filter :pandoc, args: [
    { from: :"markdown+emoji", to: :html5 },
    { base_header_level: 2 },
    :section_divs,
    :normalize,
    :smart,
  ]
  filter :absolutify_paths, type: :html, global: true
  filter :rubypantsunicode
end
