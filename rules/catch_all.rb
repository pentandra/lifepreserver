# HTML, ERB, and Markdown files

compile '/**/*.erb' do
  filter :erb, @config[:erb]
  filter :spellchecker, type: :html
  filter :abbreviate, type: :html
  filter :robust_anchors
  layout '/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

compile '/**/*.html' do
  filter :spellchecker, type: :html
  filter :abbreviate, type: :html
  filter :robust_anchors
  layout '/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

compile '/**/*' do
end

route '/static/**/index.{erb,html,md}' do
  item.identifier.without_ext + '.html'
end

route '/static/**/*.{erb,html,md}' do
  item.identifier.without_ext + '/index.html'
end

route '/**/*' do
  item.identifier.to_s
end

layout '/**/*', :erb, @config[:erb]
