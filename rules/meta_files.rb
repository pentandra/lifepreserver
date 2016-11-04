# Sitemap and other meta files

compile '/sitemap.erb' do
  filter :erb
  write '/sitemap.xml'
end

compile '/static/{robots,humans}.*' do
  filter :erb
  write item.identifier.without_ext
end

route '/404.erb' do
  item.identifier.without_ext + '.html'
end
