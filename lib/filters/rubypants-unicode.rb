class RubyPantsUnicode < Nanoc::Filter

  identifier :rubypantsunicode

  requires 'rubypants-unicode'

  # Runs the content through [RubyPants](http://chneukirchen.org/blog/static/projects/rubypants.html).
  # This method takes no options.
  #
  # @param [String] content The content to filter
  #
  # @return [String] The filtered content
  def run(content, params={})
    ::RubyPants.new(content).to_html
  end

end
