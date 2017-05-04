# Weblog index

compile '/static/blog/{index,recent}.erb' do
  filter :erb, @config[:erb]
  layout '/blog/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

# Weblog feeds

compile '/static/**/feed.erb' do
  filter :erb
  write item.identifier.without_ext + '.atom'
end

# Weblog tags, authors, and archives

compile '/static/{tags,authors,archives}/**/*' do
  filter :erb, @config[:erb]
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

# Weblog postings

compile '/static/blog/posts/**/*.md' do
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
  layout "/blog/#{@item[:kind]}.*"
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
  write item.identifier.without_ext.sub('/posts', '') + '.html'
end

compile '/static/blog/posts/**/*.md', rep: :feed_entry do
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

compile '/static/blog/posts/**/*.{jpg,jpeg,png,gif}' do
  filter :image_optimizer if @config[:production]
end

route '/static/blog/posts/**/*' do
  item.identifier.to_s.sub('/posts', '')
end
