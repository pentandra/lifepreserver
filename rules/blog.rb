# Blog index

compile '/static/blog/{index,recent}.erb' do
  filter :erb, @config[:erb]
  filter :abbreviate, type: :html
  layout '/blog/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

# Blog feeds

compile '/static/**/feed.erb' do
  filter :erb
  write item.identifier.without_ext + '.atom'
end

# Blog tags, authors, and archives

compile '/static/{tags,authors,archives}/**/*' do
  filter :erb, @config[:erb]
  filter :abbreviate, type: :html
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

# Blog posts

compile '/static/blog/**/*.md' do
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
  layout '/blog/article.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

compile '/static/blog/**/*.md', rep: :feed_entry do
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

compile '/static/blog/**/*.{jpg,jpeg,png,gif}' do
  filter :image_optimizer if @config[:production]
end
