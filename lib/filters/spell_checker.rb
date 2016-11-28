class SpellChecker < Nanoc::Filter
  identifier :spellchecker

  requires 'set', 'nokogiri', "./#{__dir__}/spell_checker/dictionary"

  IGNORE_CLASSES ||= Set.new(%w(filename handle identifier glob uri productname))

  def run(content, params = {})
    case params[:type]
    when :html, :xhtml
      spellcheck_html_like(content, params)
    else
      raise 'The spell_checker filter needs to know the type of content to ' \
        'process. Pass a :type to the filter call (:html for HTML or ' \
        ':xhtml for XHTML).'
    end
  end

  def find_dictionary_items_for(lang)
    @items.find_all("/lifepreserver/dictionaries/#{lang}/*")
  end

  protected

  def spellcheck_html_like(content, params)
    ignore_classes = params.fetch(:ignore, IGNORE_CLASSES)
    namespaces = params.fetch(:namespaces, {})
    type       = params.fetch(:type)

    case type
    when :html
      klass = ::Nokogiri::HTML
    when :xhtml
      klass = ::Nokogiri::XML
      # FIXME: cleanup because it is ugly
      # this cleans the XHTML namespace to process fragments and full
      # documents in the same way. At least, Nokogiri adds this namespace
      # if detects the `html` element.
      content = content.sub(%r{(<html[^>]+)xmlns="http://www.w3.org/1999/xhtml"}, '\1')
    end

    nokogiri_process(content, ignore_classes, namespaces, klass, type)
  end

  def nokogiri_process(content, ignore_classes, namespaces, klass, type)
    # Ensure that all prefixes are strings
    namespaces = namespaces.reduce({}) { |new, (prefix, uri)| new.merge(prefix.to_s => uri) }

    options = {
      nanoc_spellchecker_filter: self,
      dictionaries_dir: @config[:dictionaries_dir],
    }

    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)
    doc.traverse do |node|
      parent = node.parent
      if node.text? && parent.element?
        next if ignore_classes.include?(parent['class'])

        node_lang = find_node_lang(node) || Dictionary::DEFAULT_LANG
        dictionary = Dictionary.instance(node_lang, options)
        depend_on(dictionary.dictionary_items)

        original_text = node.text
        checked_text = original_text.gsub(/([[:word:]]+(?:['’][[:word:]]+)?)/) do |word|
          if dictionary.valid?(word) || (node.previous && dictionary.valid?(node.previous.text + word))
            word
          else 
            "<mark class=\"misspelled\">#{word}</mark>"
          end
        end
        node.replace(checked_text)
      end
    end

    doc.to_s
  end

  def find_node_lang(node)
    # `node.lang` only works for `xml:lang` attributes in Nokogiri
    node.lang || node.xpath('(ancestor::*[@lang][1]/@lang)[last()]').map(&:value).first
  end
end
