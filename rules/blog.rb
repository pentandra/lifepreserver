# Blog index

compile '/static/blog/{index,recent}.erb' do
  filter :erb, @config[:erb]
  layout '/blog/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

# Blog feeds

compile '/static/**/feed.erb' do
  filter :erb
  write static_route item.identifier.without_ext + '.atom'
end

# Blog tags, authors, and archives

compile '/static/{tags,authors,archives}/**/*' do
  filter :erb, @config[:erb]
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

# Blog posts

compile '/static/blog/**/*.md' do
  filter :erb, @config[:erb]
  filter :kramdown, @config[:kramdown]
  filter :colorize_syntax,
    default_colorizer: :rouge
  filter :absolutify_paths, type: :html
  filter :spellchecker unless @config[:production]
  layout '/blog/article.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end
