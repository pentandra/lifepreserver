# Solutions

compile '/static/solutions/proposals/*/index\.md' do
  filter :erb, @config[:erb]
  filter :pandoc, args: [
    { from: :markdown, to: :html5 },
    { base_header_level: 2 },
    :section_divs,
    :normalize,
    :smart,
  ]
  filter :spellchecker, type: :html
  filter :abbreviate, type: :html
  layout '/proposals/default.erb'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
  write item.identifier.without_ext.sub('/proposals', '') + '.html'
end

compile '/static/solutions/proposals/*/index\.md', rep: :pdf_letter do
  filter :erb
  filter :pandoc, args: [
    { from: :markdown, to: :context },
    :chapters,
    :normalize,
    :smart,
  ]
  filter :abbreviate, type: :context
  filter :absolutify_paths, type: :context
  layout '/proposals/default.tex'
  snapshot :context, path: File.dirname(item.identifier.to_s).sub('/proposals', '') + "/#{@item.fetch(:title).to_slug('_')}_proposal.tex" unless @config[:production]
  filter :context2pdf, @config.fetch(:context2pdf, {}).merge(mode: ['identifiable', @item.fetch(:status, 'draft')])
  write File.dirname(item.identifier.to_s).sub('/proposals', '') + "/#{@item.fetch(:title).to_slug('_')}_proposal.pdf"
end

compile '/static/solutions/proposals/*/index\.md', rep: :pdf_a4 do
  filter :erb
  filter :pandoc, args: [
    { from: :markdown, to: :context },
    :chapters,
    :normalize,
    :smart,
  ]
  filter :abbreviate, type: :context
  filter :absolutify_paths, type: :context
  layout '/proposals/default.tex'
  snapshot :context, path: File.dirname(item.identifier.to_s).sub('/proposals', '') + "/#{@item.fetch(:title).to_slug('_')}_proposal_a4.tex" unless @config[:production]
  filter :context2pdf, @config.fetch(:context2pdf, {}).merge(mode: ['identifiable', @item.fetch(:status, 'draft'), 'european'])
  write File.dirname(item.identifier.to_s).sub('/proposals', '') + "/#{@item.fetch(:title).to_slug('_')}_proposal_a4.pdf"
end

# Specification documents

compile '/static/solutions/specifications/**/*.html' do
end

layout '/specifications/vocabulary.*', :rdf_distiller, format: :html

compile '/static/solutions/specifications/**/*.ttl' do
  filter :rdf_distiller, format: :turtle
end

compile '/static/solutions/specifications/**/*.ttl', rep: :jsonld do
  filter :rdf_distiller, format: :jsonld
  write item.identifier.without_ext.sub('/specifications', '') + '.jsonld'
end

compile '/static/solutions/specifications/**/*.ttl', rep: :rdfxml do
  filter :rdf_distiller, format: :rdfxml
  write item.identifier.without_ext.sub('/specifications', '') + '.rdf'
end

compile '/static/solutions/specifications/**/*.ttl', rep: :html do
  layout '/specifications/vocabulary.*'
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
  write item.identifier.without_ext.sub('/specifications', '') + '.html'
end

route %r{/static/solutions(/(proposals|projects|specifications))/.*} do |solution_type, _|
  item.identifier.to_s.sub(solution_type, '')
end
