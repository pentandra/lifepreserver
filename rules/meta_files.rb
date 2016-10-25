# Sitemap and other meta files

compile '/sitemap.erb' do
  filter :erb
  write '/sitemap.xml'
end

compile '/robots.*' do
  filter :erb
  write '/robots.txt'
end

compile '/humans.*' do
  filter :erb
  write '/humans.txt'
end

route '/404.erb' do
  item.identifier.without_ext + '.html'
end
