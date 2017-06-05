class RobustAnchors < Nanoc::Filter

  identifier :robust_anchors

  requires 'nokogiri', 'locale', 'pragmatic_segmenter'

  FINE_SELECTORS ||= ['p', 'dd', 'dt', 'li[not(ancestor::nav) and not(ancestor::section[contains(@class, "footnotes")])]'].freeze

  # Create robust anchors and links for HTML documents.
  #
  # Currently uses the same robust anchoring algorithm as the New York Times
  # Emphasis project.
  #
  # @return [String] The robustly anchored content
  def run(content, params = {})
    generate_links = params.fetch(:generate_links, true)
    fine_grained = params.fetch(:fine_grained, false)
    selectors = params.fetch(:fine_select, FINE_SELECTORS)
    key_length = params.fetch(:key_length, 6)

    klass = Nokogiri::HTML
    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)

    doc.xpath('.//section').each do |section|
      section_id = section['id']
      next if section_id.nil?

      # Add link to header
      if generate_links
        section_header = section.at_css((1..6).map { |i| "h#{i}" }.join(', '))
        section_header << link_to_element(section_id, message_for(section_id, 'section')) if section_header
      end
    end

    doc.xpath('.//figure').each do |figure|
      figure_id = figure['id']
      next if figure_id.nil?

      # Add link to figcaption
      if generate_links
        figcaption = figure.at_xpath('./figcaption')
        figcaption << link_to_element(figure_id, message_for(figure_id, 'figure')) if figcaption
      end
    end

    if fine_grained
      selectors.map { |sel| "descendant-or-self::#{sel}" }.each do |selector|
        doc.xpath(selector).each do |element|
          element_id = element['id'] ||= robust_anchor(element, key_length)
          next if element_id.nil?

          # Add link to element
          if generate_links
            element_desc = element.description
            element << link_to_element(element_id, message_for(element_id, element_desc.description))
          end
        end
      end
    end

    doc.to_s
  end

  protected

  def find_node_lang(node)
    # `node.lang` only works for `xml:lang` attributes in Nokogiri
    node.lang || node.xpath('(ancestor::*[@lang][1]/@lang)[last()]').map(&:value).first
  end

  def robust_anchor(element, key_length)
    name = element.name
    content = (element.content || '').gsub(/[^[[:alpha:]]\.[[:space:]]]+/i, '')
    lang = find_node_lang(element)
    tag = lang ? Locale.create_language_tag(lang) : Locale.default

    if content
      ps = PragmaticSegmenter::Segmenter.new(text: content, language: tag.language)
      sentences = ps.segment

      unless sentences.empty?
        key_words = [sentences.first, sentences.last].flat_map { |s| s.split[0, key_length / 2] }
        key = key_words.map { |w| w[0] }.join

        "#{name}[#{key}]"
      end
    end
  end

  def message_for(id, description)
    "Link to #{description.strip} ##{id}"
  end

  def link_to_element(id, message)
    %(<a class="anchor" href="##{id}" title="#{message}"><span class="icon-link"></span></a>)
  end
end
