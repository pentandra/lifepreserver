# frozen_string_literal: true

module LifePreserver
  module Filters
    class OldStyleFigures < Nanoc::Filter
      IGNORE_CLASSES ||= Set.new(%w[address handle identifier prefix oldstyle tel titling uri]).freeze

      identifier :old_style_figures

      requires 'nokogiri', 'set'

      def run(content, params = {})
        case params[:type]
        when :html, :html5, :xhtml
          old_style_html_like(content, params)
        else
          raise 'The old_style_figures filter needs to know the type of '
          'content to process. Pass a :type to the filter call (:html ' \
          'for HTML, :xhtml for XHTML).'
        end
      end

      protected

      def old_style_html_like(content, params)
        ignore_classes = params.fetch(:ignore, IGNORE_CLASSES)
        namespaces = params.fetch(:namespaces, {})
        type       = params.fetch(:type)

        parser = parser_for(type)
        content = fix_content(content, type)

        nokogiri_process(content, ignore_classes, namespaces, parser, type)
      end

      def parser_for(type)
        case type
        when :html
          require 'nokogiri'
          ::Nokogiri::HTML
        when :html5
          require 'nokogumbo'
          ::Nokogiri::HTML5
        when :xhtml
          require 'nokogiri'
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
          content.dup.force_encoding(Encoding::UTF_8)
        end
      end

      def nokogiri_process(content, ignore_classes, namespaces, klass, type)
        # Ensure that all prefixes are strings
        namespaces = namespaces.reduce({}) { |new, (prefix, uri)| new.merge(prefix.to_s => uri) }

        doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)
        doc.traverse do |node|
          next unless node.text?
          next if node.path[%r{/(h[1-6]|pre)}]

          parent = node.parent
          next if ignore_classes.include?(parent['class'])

          oldstyle_text = node.text.dup.gsub(/(\d+(?:[.,-–]\d+)*)/, '<span class="oldstyle">\1</span>')

          node.replace(oldstyle_text)
        end

        case type
        when :html5
          doc.to_html.force_encoding(Encoding::UTF_8)
        else
          doc.send("to_#{type}")
        end
      end
    end
  end
end
