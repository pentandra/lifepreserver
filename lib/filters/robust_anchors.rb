class RobustAnchors < Nanoc::Filter

  identifier :robust_anchors

  requires 'nokogiri'

  def run(content, params = {})
    links = params.fetch(:links, true)

    klass = Nokogiri::HTML
    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)

    doc.css('section').each do |section|
      section_id = section['id']
      next if section_id.nil?

      # Add link to header
      section_header = section.css((1..6).map { |i| "h#{i}" }.join(', ')).first
      section_header << link_to_element(section_id, message_for(section)) if links
    end

    doc.css('figure').each do |figure|
      figure_id = figure['id']
      next if figure_id.nil?

      # Add link to figcaption
      figcaption = figure.css('figcaption').first
      figcaption << link_to_element(figure_id, message_for(figure)) if figcaption && links
    end

    doc.css('p li dt dd').each_with_index do |element, index|
      next if element.children.none? { |child| child.text? }

      element['id'] ||= robust_anchor(element, index)
      element << link_to_element(element['id'], message_for(element)) if links
    end

    doc.to_s
  end

  private

  # TODO: Come up with something better.
  def robust_anchor(element, index)
    "#{element.name}[#{index}]"
  end

  def message_for(element)
    elem_name = case element.name
                when 'section' then 'section'
                when 'figure' then 'figure'
                when 'p' then 'paragraph'
                when 'li' then 'list item'
                when 'dt' then 'description term'
                when 'dd' then 'description definition'
                else 'element'
                end

    "Link to this #{elem_name}"
  end

  def link_to_element(id, message)
    %(<a class="anchor" href="##{id}" title="#{message}"><span class="icon-link"></span></a>)
  end
end
