class Abbreviate < Nanoc::Filter
  require_relative '../helpers/dictionaries'
  include LifePreserver::Dictionaries

  identifier :abbreviate

  requires 'nokogiri'

  def run(content, params = {})
    abbreviations = params[:abbreviations] || supported_abbreviations

    case params[:type]
    when :html, :xhtml
      abbreviate_html_like(content, params, abbreviations)
    when :context
      abbreviate_context(content, params, abbreviations)
    else
      raise 'The abbreviate filter needs to know the type of content to ' \
        'process. Pass a :type to the filter call (:html for HTML, ' \
        ':xhtml for XHTML, or :context for ConTeXt).'
    end
  end

  protected

  def abbreviate_context(content, params, abbreviations)
    content.gsub(/(?<word>[[:alnum:]]+(?:[\-;][[[:upper:]][[:digit:]]]+)*)(?<next_char>.)/) do
      word = Regexp.last_match(:word)
      next_char = Regexp.last_match(:next_char)

      next if word == 'W3C'

      if abbreviations.key?(word.to_sym)
        next_char =~ /[[:space:]]/ ? "\\#{word}\\#{next_char}" : "\\#{word}#{next_char}"
      else
        "#{word}#{next_char}"
      end
    end
  end

  def abbreviate_html_like(content, params, abbreviations)
    type = params.fetch(:type)

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

    nokogiri_process(content, klass, type, abbreviations)
  end

  def nokogiri_process(content, klass, type, abbreviations)
    visited_abbreviations = []

    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)
    doc.traverse do |node|
      next unless node.text?

      parent = node.parent
      next unless parent.element?

      abbreviated_text = node.text.dup.gsub(/([[:alnum:]]+(?:[\-;][[[:upper:]][[:digit:]]]+)*)/) do |word|
        if abbreviations.key?(word.to_sym) && parent.name != 'abbr'
          if visited_abbreviations.include?(word.to_sym)
            "<abbr>#{word}</abbr>"
          else
            visited_abbreviations << word.to_sym
            %(<abbr title="#{abbreviations[word.to_sym]}">#{word}</abbr>)
          end
        else
          word
        end
      end

      node.replace(abbreviated_text)
    end

    doc.to_s
  end
end
