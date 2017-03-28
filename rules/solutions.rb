# Solutions

compile '/static/solutions/proposals/*/index\.md' do
  filter :erb, @config[:erb]
  filter :pandoc, args: [
    { from: :markdown, to: :html5 },
    { base_header_level: 2 },
    :section_divs,
    :number_sections,
    :normalize,
    :smart,
  ]
  filter :spellchecker, type: :html
  filter :abbreviate, type: :html
  layout '/proposals/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
  write item.identifier.without_ext.sub('/proposals', '') + '.html'
end

#compile '/static/solutions/proposals/*/index\.md', rep: :pdf do
  #filter :erb
  #filter :pandoc, args: [
    #{ from: :markdown, to: :context },
    #:chapters,
    #:normalize,
    #:smart,
  #]
  #filter :absolutify_paths, type: :context
  #layout '/benefit_reports/report.*'
  #filter :context2pdf, @config.fetch(:context2pdf, {}).merge(mode: @item.key?(:wip) ? 'draft' : 'publish')
  #write item.identifier.without_ext.tr('-', '_') + '.pdf'
#end

# Specification documents

passthrough '/static/solutions/specifications/**/*.html'

layout '/specifications/vocabulary.*', :rdf_distiller, format: :html

compile '/static/solutions/specifications/**/*.ttl' do
  filter :rdf_distiller, format: :turtle
end

compile '/static/solutions/specifications/**/*.ttl', rep: :jsonld do
  filter :rdf_distiller, format: :jsonld
  write item.identifier.without_ext + '.jsonld'
end

compile '/static/solutions/specifications/**/*.ttl', rep: :rdfxml do
  filter :rdf_distiller, format: :rdfxml
  write item.identifier.without_ext + '.rdf'
end

compile '/static/solutions/specifications/**/*.ttl', rep: :html do
  layout '/specifications/vocabulary.*'
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
  write item.identifier.without_ext + '.html'
end

route %r{/static/solutions(/(proposals|specifications))/.*} do |solution_type, _|
  item.identifier.to_s.sub(solution_type, '')
end
