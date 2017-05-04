class IdentifierLinks < Nanoc::Filter

  identifier :identifier_links

  requires 'nokogiri'

  def run(content, params = {})
    klass = Nokogiri::HTML
    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)

    doc.css('section').each do |section|
      section_id = section['id']
      next if section_id.nil?

      # Add link to header
      section_header = section.css((1..6).map { |i| "h#{i}" }.join(', ')).first
      section_header << link_to_section(section_id)
    end

    doc.css('figure').each do |figure|
      figure_id = figure['id']
      next if figure_id.nil?

      # Add link to figcaption
      figcaption = figure.css('figcaption').first
      figcaption << link_to_figure(figure_id)
    end

    doc.css('p').each_with_index do |paragraph, index|
      paragraph['id'] ||= robust_anchor(paragraph, index)
      paragraph << link_to_paragraph(paragraph['id'])
    end

    doc.css(':not(.footnotes) > * > li').each_with_index do |list_item, index|
      list_item['id'] ||= robust_anchor(list_item, index)
      list_item << link_to_list_item(list_item['id'])
    end

    doc.to_s
  end

  private

  # TODO: Come up with something better.
  def robust_anchor(element, index)
    "#{element.name}[#{index}]"
  end

  def link_to_element(id, message = 'Link to this element')
    %(<a class="anchor" href="##{id}" title="#{message}"><span class="icon-link"></span></a>)
  end

  def link_to_section(id)
    link_to_element(id, 'Link to this section')
  end

  def link_to_paragraph(id)
    link_to_element(id, 'Link to this paragraph')
  end

  def link_to_list_item(id)
    link_to_element(id, 'Link to this list item')
  end

  def link_to_figure(id)
    link_to_element(id, 'Link to this figure')
  end
end
