# Sitemap and other meta files

compile '/static/sitemap.erb' do
  filter :erb
  write item.identifier.without_ext + '.xml'
end

compile '/static/{robots,humans}.*' do
  filter :erb
  write item.identifier.without_ext
end

route '/static/404.erb' do
  item.identifier.without_ext + '.html'
end
