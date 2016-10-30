# Company

compile %r{/company/benefit-reports/\d{4}/index\.md} do
  filter :erb, @config[:erb]
  filter :pandoc, args: [
    { from: :markdown, to: :html5 },
    { base_header_level: 2 },
    :section_divs,
    :smart
  ]
  filter :spellchecker unless @config[:production]
  layout '/benefit-reports/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

compile %r{/company/benefit-reports/(\d{4})/index\.md}, rep: :pdf do |fiscal_year, _|
  filter :erb
  filter :pandoc, args: [
    { from: :markdown, to: :context },
    :chapters
  ]
  filter :absolutify_paths, type: :context
  layout '/benefit-reports/report.*'
  filter :context2pdf, @config[:context2pdf].merge(mode: @item[:wip] ? 'draft' : 'publish')
  write File.dirname(item.identifier.to_s) + "/UT_Pentandra_report_#{fiscal_year}.pdf"
end

compile '/company/_', rep: :qrcode do
  filter :vcard, @config[:company]
  snapshot :vcard
  filter :qrcode, @config[:qrcode]
  write "/images/pentandra-qrcode#{fingerprint(@item[:filename]) if @config[:production]}.png"
end

route '/company/_', rep: :qrcode, snapshot: :vcard do
  "/company/pentandra#{fingerprint(@item[:filename]) if @config[:production]}.vcf"
end
