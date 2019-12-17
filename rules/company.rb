# frozen_string_literal: true

# Company-related items

compile %r{/static/company/benefit-reports/\d{4}/index\.md} do
  filter :erb, @config[:erb]
  filter :pandoc, args: [
    { from: :markdown, to: :html5 },
    { base_header_level: 2 },
    :section_divs,
  ]
  filter :spellchecker, type: :html
  filter :abbreviate, type: :html
  filter :robust_anchors
  layout '/benefit_reports/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

compile %r{/static/company/benefit-reports/(\d{4})/index\.md}, rep: :pdf_letter do |fiscal_year, _|
  filter :erb
  filter :pandoc, args: [
    { from: :markdown, to: :context },
    { top_level_division: :chapter },
  ]
  filter :absolutify_paths, type: :context
  layout '/benefit_reports/report.*'
  snapshot :context, path: File.dirname(item.identifier.to_s) + "/UT_Pentandra_report_#{fiscal_year}.tex" unless @config[:production]
  filter :context2pdf, @config.fetch(:context2pdf, {}).merge(mode: @item.key?(:wip) ? 'draft' : 'publish')
  write File.join(File.dirname(item.identifier.to_s), "UT_Pentandra_report_#{fiscal_year}.pdf")
end

compile %r{/static/company/benefit-reports/(\d{4})/index\.md}, rep: :pdf_a4 do |fiscal_year, _|
  filter :erb
  filter :pandoc, args: [
    { from: :markdown, to: :context },
    { top_level_division: :chapter },
  ]
  filter :absolutify_paths, type: :context
  layout '/benefit_reports/report.*'
  snapshot :context, path: File.dirname(item.identifier.to_s) + "/UT_Pentandra_report_#{fiscal_year}_a4.tex" unless @config[:production]
  filter :context2pdf, @config.fetch(:context2pdf, {}).merge(mode: [@item.key?(:wip) ? 'draft' : 'publish', 'european'])
  write File.join(File.dirname(item.identifier.to_s), "UT_Pentandra_report_#{fiscal_year}_a4.pdf")
end

ignore '/company/organizations/*'

compile '/company/organizations/*', rep: :vcard do
  filter :vcard, kind: :org
  write "/static/company/#{@item.fetch(:slug)}.vcf"
end

compile '/company/organizations/*', rep: :qrcode do
  filter :vcard, kind: :org
  filter :qrcode, level: :l, color: '#544233', image_size: 252
  filter :image_optimizer if @config[:production]
  write "/static/images/#{@item.fetch(:slug)}-qrcode.png"
end

compile '/company/people/*' do
  layout '/personal_profile.*'
  filter :spellchecker, type: :html
  filter :abbreviate, type: :html
  filter :old_style_figures, type: :html
  filter :robust_anchors
  layout '/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
  write "/static/people/#{@item.fetch(:slug)}/index.html"
end

compile '/company/people/*', rep: :ttl do
  layout '/personal_profile.*'
  layout '/default.*'
  filter :rdf_distiller, input: :rdfa, output: :turtle
  write "/static/people/#{@item.fetch(:slug)}/index.ttl"
end

compile '/company/people/*', rep: :rdfxml do
  layout '/personal_profile.*'
  layout '/default.*'
  filter :rdf_distiller, input: :rdfa, output: :rdfxml
  write "/static/people/#{@item.fetch(:slug)}/index.rdf"
end

compile '/company/people/*', rep: :jsonld do
  layout '/personal_profile.*'
  layout '/default.*'
  filter :rdf_distiller, input: :rdfa, output: :jsonld
  write "/static/people/#{@item.fetch(:slug)}/index.jsonld"
end

compile '/company/people/*', rep: :photo do
  filter :bin_attr_extractor, bin_attr: :jpegphoto
  filter :image_optimizer if @config[:production]
  write "/static/images/#{@item.fetch(:slug)}.jpg"
end

compile '/company/people/*', rep: :vcard do
  filter :vcard, kind: :individual
  write "/static/company/#{@item.fetch(:slug)}.vcf"
end

compile '/company/people/*', rep: :qrcode do
  filter :vcard, kind: :individual
  filter :qrcode, level: :l, color: '#544233', image_size: 160
  filter :image_optimizer if @config[:production]
  write "/static/images/#{@item.fetch(:slug)}-qrcode.png"
end

compile '/company/people/*', rep: :fpr_qrcode do
  filter :qrcode, level: :q, color: '#544233', image_size: 160
  filter :image_optimizer if @config[:production]
  write "/static/images/#{@item.fetch(:slug)}-fpr_qrcode.png"
end

compile '/company/people/*/feed' do
  filter :erb
  write @item.identifier.to_s.sub(@config[:company_root], @config[:static_root]) + '.atom'
end
