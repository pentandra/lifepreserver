class SpellChecker < Nanoc::Filter
  identifier :spellchecker

  requires 'set', 'nokogiri', "./#{__dir__}/spell_checker/dictionary"

  CHECKED_TAGS = Set.new(%w(p ol ul li div header article nav section footer aside dd dt dl span blockquote cite q mark ins del table td th tr tbody thead tfoot a b i s em small strong hgroup h1 h2 h3 h4 h5 h6 figcaption dfn))

  def run(content, params = {})
    lang = params.fetch(:lang, Dictionary::DEFAULT_LANG)
    ignore_classes = params.fetch(:ignore_classes, %w( filename handle identifier glob uri productname ))
    checked_tags = params.fetch(:checked_tags, CHECKED_TAGS)

    options = {
      nanoc_spellchecker_filter: self,
      base_lang: lang
    }

    doc = Nokogiri::HTML.fragment(content)
    doc.traverse do |node|
      parent = node.parent
      if node.text? && checked_tags.include?(parent.name)
        next if ignore_classes.include?(parent['class'])
        original_text = node.text
        node_lang = find_node_lang(node) || lang
        dictionary = Dictionary.instance(node_lang, options)
        depend_on(dictionary.dictionary_items)
        checked_text = original_text.gsub(/([[[:word:]]'’]+)/) { |word| dictionary.valid?(word) ? word : "<mark class=\"misspelled\">#{word}</mark>" }
        node.replace(checked_text)
      end
    end

    doc.to_s
  end

  def find_dictionary_items_for(lang)
    # match language subtag only for regional flexibility
    lang_subtag = lang[0, 2]
    @items.find_all("/lifepreserver/dictionaries/#{lang_subtag}_*/*")
  end

  protected

  def find_node_lang(node)
    # `node.lang` only works for `xml:lang` attributes in Nokogiri
    node.lang || node.xpath('(ancestor::*[@lang][1]/@lang)[last()]').map(&:value).first
  end
end
