# Company

compile %r{/static/company/benefit-reports/\d{4}/index\.md} do
  filter :erb, @config[:erb]
  filter :pandoc, args: [
    { from: :markdown, to: :html5 },
    { base_header_level: 2 },
    :section_divs,
    :smart,
  ]
  filter :spellchecker, type: :html
  filter :abbreviate, type: :html
  layout '/benefit_reports/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

compile %r{/static/company/benefit-reports/(\d{4})/index\.md}, rep: :pdf do |fiscal_year, _|
  filter :erb
  filter :pandoc, args: [
    { from: :markdown, to: :context },
    :chapters,
  ]
  filter :absolutify_paths, type: :context
  layout '/benefit_reports/report.*'
  filter :context2pdf, @config.fetch(:context2pdf, {}).merge(mode: @item.key?(:wip) ? 'draft' : 'publish')
  write File.dirname(item.identifier.to_s) + "/UT_Pentandra_report_#{fiscal_year}.pdf"
end

compile '/static/company/proposals/*/index\.md' do
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
end

compile '/company/_', rep: :qrcode do
  filter :vcard, @config[:company]
  snapshot :vcard, path: "/static/company/pentandra#{@config[:production] ? '-' + @item.fetch(:mtime).strftime('%Y%j') : ''}.vcf"
  filter :qrcode, @config[:qrcode]
  filter :image_optimizer
  write "/static/images/pentandra-qrcode#{@config[:production] ? '-' + @item.fetch(:mtime).strftime('%Y%j') : ''}.png"
end
