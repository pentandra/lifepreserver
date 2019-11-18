# frozen_string_literal: true

module LifePreserver
  module Filters
    class SpellChecker < Nanoc::Filter
      require_relative '../helpers/dictionaries'
      include LifePreserver::Helpers::Dictionaries

      identifier :spellchecker

      requires 'set', 'nokogiri'

      IGNORE_CLASSES ||= Set.new(%w(address domainname filename foreign handle identifier prefix projectname sic term uri)).freeze

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

      protected

      def spellcheck_html_like(content, params)
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

      def nokogiri_process(content, ignore_classes, namespaces, klass, type)
        # Ensure that all prefixes are strings
        namespaces = namespaces.reduce({}) { |new, (prefix, uri)| new.merge(prefix.to_s => uri) }

        doc = content =~ /<html[\s>]/ ? klass.parse(content) : klass.fragment(content)
        doc.traverse do |node|
          next unless node.text?
          next if node.path['/pre']

          parent = node.parent
          if parent.element?
            next if ignore_classes.include?(parent['class'])

            node_lang = find_node_lang(node)
            dic = dictionary(node_lang)
            next unless dic

            depend_on_attributes(dic.dependencies)

            checked_text = node.text.dup.gsub(/([[:word:]]+(?:['’][[:word:]]+)?)/) do |word|
              if dic.valid?(word) || (node.previous && dic.valid?(node.previous.text + word)) || /\d+['’]?s\z/.match(word)
                word
              else
                %(<mark class="misspelled">#{word}</mark>)
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

      def depend_on_attributes(items)
        dependency_tracker = @assigns[:item]._context.dependency_tracker

        items = items.map { |i| i.class < Nanoc::Core::DocumentViewMixin ? i._unwrap : i }
        items.each { |item| dependency_tracker.bounce(item, attributes: true) }
      end
    end
  end
end
