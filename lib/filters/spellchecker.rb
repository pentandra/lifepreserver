require "html_spellchecker"

class SpellCheckerFilter < Nanoc::Filter
  
  identifier :spellchecker

  def run(content, params = {})
    checker = HTML_Spellchecker.english

    if File.exist? "dictionary" then
      File.readlines("dictionary").each do |word|
        checker.add(word.chomp)
      end
    end

    checker.spellcheck(content)
  end
end

class HTML_Spellchecker
  def add(word)
    @dict.add(word)
  end
end
