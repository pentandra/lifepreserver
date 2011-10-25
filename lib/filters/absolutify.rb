require 'nokogiri'

class String
  def starts_with?(characters)
    self.match(/^#{characters}/) ? true : false
  end
end

class AbsolutifyFilter < Nanoc3::Filter
  identifier :absolutify

  def make_urls_absolute(doc, elem, attr)
    doc.css(elem).each do |tag|
      url = tag[attr]
      if url.starts_with? '/' then
        tag[attr] = @config[:base_url] + url
      end
    end
  end

  def run(content, cmd, params={})
    doc = Nokogiri::XML::DocumentFragment.parse(content)
    self.make_urls_absolute(doc, 'a', 'href')
    self.make_urls_absolute(doc, 'img', 'src')
    doc.to_html
  end
end

