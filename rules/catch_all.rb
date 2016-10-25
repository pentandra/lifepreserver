# HTML, ERB, and Markdown files

compile '/**/*.erb' do
  filter :erb, trim_mode: '>'
  filter :spellchecker unless @config[:production]
  layout '/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

compile '/**/*.html' do
  filter :spellchecker unless @config[:production]
  layout '/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

compile '/**/*' do
end

route '/**/index.{erb,html,md}' do
  item.identifier.without_ext + '.html'
end

route '/**/*.{erb,html,md}' do
  item.identifier.without_ext + '/index.html'
end

route '/**/*' do
  item.identifier.to_s
end

layout '/**/*', :erb, trim_mode: '>'