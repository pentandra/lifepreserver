# Company

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
  write File.dirname(item.identifier.to_s) + "/UT_Pentandra_report_#{fiscal_year}.pdf"
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
  filter :context2pdf, @config.fetch(:context2pdf, {}).merge(mode: [ @item.key?(:wip) ? 'draft' : 'publish', 'european' ] )
  write File.dirname(item.identifier.to_s) + "/UT_Pentandra_report_#{fiscal_year}_a4.pdf"
end

compile '/company/_', rep: :vcard do
  filter :vcard, @config[:company]
  write "/static/company/pentandra#{@config[:production] ? '-' + @item.fetch(:mtime).strftime('%Y%j') : ''}.vcf"
end

compile '/company/_', rep: :qrcode do
  filter :vcard, @config[:company]
  filter :qrcode, level: :l, color: '#544233', image_size: 252
  filter :image_optimizer if @config[:production]
  write "/static/images/pentandra-qrcode#{@config[:production] ? '-' + @item.fetch(:mtime).strftime('%Y%j') : ''}.png"
end
