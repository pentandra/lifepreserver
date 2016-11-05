require_relative '../helpers/link_to'
# Based on https://gist.github.com/fracai/1597618 and the
# `Nanoc::Filters::RelativizePaths filter, with improvements
class AbsolutifyPaths < Nanoc::Filter
  identifier :absolutify_paths

  requires 'nokogiri'

  SELECTORS ||= ['*/@href', '*/@src', 'object/@data', 'param[@name="movie"]/@content', 'comment()'].freeze

  # Absolutifies all paths in the given content, which can be HTML, XHTML, XML
  # or CSS. In HTML, all `href` and `src` attributes will be absolutified. In
  # CSS, all `url()` references will be absolutified.
  #
  # @param [String] content The content to filter
  #
  # @option params [Symbol] :type The type of content to filter; can be
  # `:html`, `:xhtml`, `:xml`, `:css`, or `:context`.
  #
  # @option params [Boolean] :global Set true to create an absolute URI based
  # on the `@config[:base_url]`. Otherwise this filter only creates a reference
  # to an absolute path.
  #
  # @option params [Array] :select The XPath expression that matches the nodes
  # to modify. This param is only useful for the `:html`, `:xml`, and `:xhtml`
  # types.
  #
  # @option params [Hash] :namespaces The pairs `prefix => uri` to define any
  # namespace you want to use in the XPath expressions. This param is only
  # useful for the `:xml` and `:xhtml` types.
  def run(content, params={})

    if params[:global] && @config[:base_url].nil?
      raise 'Cannot build absolute path: site configuration has no base_url'
    end

    case params[:type]
    when :css
      absolutify_css(content, params)
    when :context
      absolutify_context(content, params)
    when :html, :xml, :xhtml
      absolutify_html_like(content, params)
    else
      raise 'The absolutify_paths filter needs to know the type of content to ' \
        'process. Pass a :type to the filter call (:html for HTML, ' \
        ':xhtml for XHTML, :xml for XML, :css for CSS, or :context for ConTeXt).'
    end
  end

  protected

  # http://rubular.com/r/aRKvVMu34O
  def absolutify_css(content, params)
    global = params.fetch(:global, false)

    content.gsub(/url\((?<quote>['"]?)(?<path>\/(?:[^\/].*?)?)\k<quote>\)/) do
      quote = Regexp.last_match(:quote)
      path = Regexp.last_match(:path)
      'url(' + quote + path_to(path, global: global) + quote + ')'
    end
  end

  # http://rubular.com/r/GSkMfZLcyk
  def absolutify_context(content, params)
    global = params.fetch(:global, true)

    content.gsub(/\\useURL\s*(?<identifier>\[.*?\]){1}\s*\[(?<target>\/(?:[^\/].*?)?)\]/) do |match|
      identifier = Regexp.last_match(:identifier)
      target = Regexp.last_match(:target)
      '\useURL' + identifier + '[' + path_to(target, global: global) + ']'
    end
  end

  def absolutify_html_like(content, params)
    selectors  = params.fetch(:select, SELECTORS)
    namespaces = params.fetch(:namespaces, {})
    type       = params.fetch(:type)
    global     = params.fetch(:global, false)

    case type
    when :html
      klass = ::Nokogiri::HTML
    when :xml
      klass = ::Nokogiri::XML
    when :xhtml
      klass = ::Nokogiri::XML
      # FIXME: cleanup because it is ugly
      # this cleans the XHTML namespace to process fragments and full
      # documents in the same way. At least, Nokogiri adds this namespace
      # if detects the `html` element.
      content = content.sub(%r{(<html[^>]+)xmlns="http://www.w3.org/1999/xhtml"}, '\1')
    end

    nokogiri_process(content, selectors, namespaces, klass, type, global)
  end

  def nokogiri_process(content, selectors, namespaces, klass, type, global)
    # Ensure that all prefixes are strings
    namespaces = namespaces.reduce({}) { |new, (prefix, uri)| new.merge(prefix.to_s => uri) }

    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)
    selectors.map { |sel| "descendant-or-self::#{sel}" }.each do |selector|
      doc.xpath(selector, namespaces).each do |node|
        if node.name == 'comment'
          nokogiri_process_comment(node, doc, selectors, namespaces, klass, type, global)
        elsif path_is_absolutifiable?(node.content)
          node.content = path_to(node.content, global: global)
        end
      end
    end
    doc.send("to_#{type}")
  end

  def nokogiri_process_comment(node, doc, selectors, namespaces, klass, type, global)
    content = node.content.dup.sub(%r{^(\s*\[.+?\]>\s*)(.+?)(\s*<!\[endif\])}m) do |_m|
      beginning = Regexp.last_match(1)
      body = Regexp.last_match(2)
      ending = Regexp.last_match(3)

      beginning + nokogiri_process(body, selectors, namespaces, klass, type, global) + ending
    end

    node.replace(Nokogiri::XML::Comment.new(doc, content))
  end

  def path_is_absolutifiable?(s)
    !s.include?('://'.freeze)
  end

end
