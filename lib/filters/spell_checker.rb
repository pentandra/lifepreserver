class SpellChecker < Nanoc::Filter
  identifier :spellchecker

  requires 'html_spellchecker'

  def run(content, params = {})
    checker = HTML_Spellchecker.english

    if File.exist? "etc/dictionary" then
      File.readlines("etc/dictionary").each do |word|
        checker.add(word.chomp)
      end
    end

    checker.spellcheck(content)
  end
end

class HTML_Spellchecker

  def add(word)
    if word.include?('/') then
      words = word.split('/', 2)
      @dict.add_with_affix(words.first, words.last)
    else
      @dict.add(word)
    end
  end

end
