class SpellChecker < Nanoc::Filter
  identifier :spellchecker

  requires 'nokogiri', "./#{__dir__}/spell_checker/dictionary"

  CHECKED_TAGS = Set.new(%w(p ol ul li div header article nav section footer aside dd dt dl span blockquote cite q mark ins del table td th tr tbody thead tfoot a b i s em small strong hgroup h1 h2 h3 h4 h5 h6 figcaption dfn))

  def run(content, params = {})
    base_lang = params.fetch(:lang, 'en_US')
    ignore_classes = params.fetch(:ignore_classes, %w( filename identifier glob uri productname ))
    checked_tags = params.fetch(:checked_tags, CHECKED_TAGS)

    dictionaries = @items.find_all('/lifepreserver/dictionaries/*')
    depend_on(dictionaries)
    dictionary = Dictionary.instance(base_lang, dictionaries)

    doc = Nokogiri::HTML.fragment(content)

    doc.traverse do |node|
      parent = node.parent
      if node.text? && checked_tags.include?(parent.name)
        next if ignore_classes.include?(parent['class'])
        original_text = node.text
        checked_text = original_text.gsub(/([[[:word:]]'’]+)/) { |word| dictionary.valid?(word) ? word : "<mark class=\"misspelled\">#{word}</mark>" }
        node.replace(checked_text)
      end
    end

    doc.to_s
  end
end
