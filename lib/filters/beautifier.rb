require "htmlbeautifier/beautifier"

class BeautifierFilter < Nanoc3::Filter

  
  identifier :beautifier
  type :text

  # Runs the content through [htmlbeautifier](http://github.com/threedaymonk/htmlbeautifier/).
  # This method takes no options
  #
  # @param [String] content The content to filter.
  #
  # @return [String] The retabbed HTML.
  def run(content, params = {})
    buffer = ""
    HtmlBeautifier::Beautifier.new(buffer).scan(content)
    buffer
  end
end
