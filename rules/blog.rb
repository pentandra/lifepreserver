# Blog index

compile '/blog/{index,recent}.erb' do
  filter :erb, trim_mode: '>'
  layout '/blog/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

# Blog feeds

compile '/**/feed.erb' do
  filter :erb
  write item.identifier.without_ext + '.atom'
end

# Blog tags, authors, and archives

compile '/{tags,authors,archives}/**/*' do
  filter :erb, trim_mode: '>'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

# Blog posts

compile '/blog/**/*.md' do
  filter :erb, trim_mode: '>'
  filter :kramdown, @config[:kramdown]
  filter :colorize_syntax, default_colorizer: :pygmentize, pygmentize: { nowrap: 'True' }
  filter :absolutify_paths, type: :html
  filter :spellchecker unless @config[:production]
  layout '/blog/article.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end
