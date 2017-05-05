class RobustAnchors < Nanoc::Filter

  identifier :robust_anchors

  requires 'nokogiri'

  # Create robust anchors and links for HTML documents.
  #
  # Currently uses the same robust anchoring algorithm as the New York Times
  # Emphasis project.
  #
  # @return [String] The robustly anchored content
  def run(content, params = {})
    with_links = params.fetch(:with_links, true)

    klass = Nokogiri::HTML
    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)

    doc.css('section').each do |section|
      section_id = section['id']
      next if section_id.nil?

      # Add link to header
      if with_links
        section_header = section.at_css((1..6).map { |i| "h#{i}" }.join(', '))
        section_header << link_to_element(section_id, message_for(section_id, 'section')) if section_header
      end
    end

    doc.css('figure').each do |figure|
      figure_id = figure['id']
      next if figure_id.nil?

      # Add link to figcaption
      if with_links
        figcaption = figure.at_css('figcaption')
        figcaption << link_to_element(figure_id, message_for(figure_id, 'figure')) if figcaption
      end
    end

    doc.css('p, li, dt, dd').each_with_index do |element, index|
      #next if element.children.all? { |child| child.block? }

      element['id'] ||= robust_anchor(element, index)

      if with_links
        element_desc = element.description
        element << link_to_element(element['id'], message_for(element['id'], element_desc.description))
      end
    end

    doc.to_s
  end

  protected

  # TODO: Come up with something better.
  def robust_anchor(element, index)
    "#{element.name}[#{index}]"
  end

  def message_for(id, description)
    "Link to #{description.strip} ##{id}"
  end

  def link_to_element(id, message)
    %(<a class="anchor" href="##{id}" title="#{message}"><span class="icon-link"></span></a>)
  end
end
