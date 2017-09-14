# frozen_string_literal: true

class Abbreviate < Nanoc::Filter
  require_relative '../helpers/dictionaries'
  include LifePreserver::Dictionaries

  ABBREVIATION_REGEX ||= /([[:alnum:]]+(?:[\-;][[[:upper:]][[:digit:]]]+)*[[[:alnum:]]&&[^s]])/

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
    content.gsub(ABBREVIATION_REGEX) do |word|
      abbreviations.key?(word.to_sym) ? "\\abbr{#{word}}" : word
    end
  end

  def abbreviate_html_like(content, params, abbreviations)
    type = params.fetch(:type)

    parser = parser_for(type)
    content = fix_content(content, type)

    nokogiri_process(content, parser, type, abbreviations)
  end

  def parser_for(type)
    case type
    when :html
      ::Nokogiri::HTML
    when :xml, :xhtml
      ::Nokogiri::XML
    end
  end

  def fix_content(content, type)
    case type
    when :xhtml
      # FIXME: cleanup because it is ugly
      # this cleans the XHTML namespace to process fragments and full
      # documents in the same way. At least, Nokogiri adds this namespace
      # if detects the `html` element.
      content = content.sub(%r{(<html[^>]+)xmlns="http://www.w3.org/1999/xhtml"}, '\1')
    else
      content
    end
  end

  def nokogiri_process(content, klass, type, abbreviations)
    visited_abbreviations = []

    doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)
    doc.traverse do |node|
      next unless node.text?

      parent = node.parent
      next unless parent.element?

      abbreviated_text = node.text.dup.gsub(ABBREVIATION_REGEX) do |word|
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
