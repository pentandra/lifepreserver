# Specification documents

passthrough '/static/specifications/**/*.html'

layout '/specifications/vocabulary.*', :rdf_distiller, format: :html

compile '/static/specifications/**/*.ttl' do
  filter :rdf_distiller, format: :turtle
end

compile '/static/specifications/**/*.ttl', rep: :jsonld do
  filter :rdf_distiller, format: :jsonld
  write item.identifier.without_ext + '.jsonld'
end

compile '/static/specifications/**/*.ttl', rep: :rdfxml do
  filter :rdf_distiller, format: :rdfxml
  write item.identifier.without_ext + '.rdf'
end

compile '/static/specifications/**/*.ttl', rep: :html do
  layout '/specifications/vocabulary.*'
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
  write item.identifier.without_ext + '.html'
end
