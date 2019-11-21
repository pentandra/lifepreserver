# frozen_string_literal: true

require 'active_support/core_ext/string/output_safety'

require_relative 'url_shortener'

module LifePreserver
  module Helpers
    module LinkTo
      include UrlShortener
      include ERB::Util

      # @param [String] id the item id
      #
      # @return [String]
      def link_to_id(id, attributes = {})
        item = @items[id]

        unless item
          raise ArgumentError, "Could not find item to link to with identifier: #{id}"
        end

        link_to(item[:short_title] || item[:title], item, attributes)
      end

      # Generate a hyperlink from text and a target.
      #
      # @param [String] text
      # @param [Hash] attributes the options to create the link with
      # @option attributes [Symbol] :rep (:default) the item rep to link to
      # @option attributes [Symbol] :snapshot (:last) the snapshot to link to
      # @option attributes [String] :fragment a URI fragment to append
      # @option attributes [Boolean] :absolute (false) return an absolute URI?
      # @option attributes [Boolean] :concept (false) is this a concept URI?
      # @option attributes [Boolean] :internal (false) retain internal static root path?
      #
      # @return [String]
      def link_to(text, target, attributes = {})
        # Pull out magic path attributes
        path_attributes = {
          rep: attributes.delete(:rep),
          snapshot: attributes.delete(:snapshot),
          fragment: attributes.delete(:fragment),
          absolute: attributes.delete(:absolute),
          concept: attributes.delete(:concept),
          internal: attributes.delete(:internal)
        }.compact

        path = path_to(target, path_attributes)

        # Join the rest of the attributes
        attributes = attributes.reduce('') do |memo, (key, value)|
          memo + key.to_s + '="' + h(value) + '" '
        end

        # Create link
        %(<a #{attributes}href="#{h path}">#{html_escape_once(text)}</a>)
      end

      # Generate a resource path from a target and optional fragment.
      #
      # @param [String, Nanoc::Core::CompilationItemView, Nanoc::Core::BasicItemRepView] target
      # @param [Symbol] rep (:default) the item rep to link to
      # @param [Symbol] snapshot (:last) the snapshot to link to
      # @param [String] fragment a URI fragment to append
      # @param [Boolean] absolute (false) return an absolute URI?
      # @param [Boolean] concept (false) is this a concept URI?
      # @param [Boolean] internal (false) retain internal static root path?
      #
      # @return [String]
      def path_to(target, rep: :default, snapshot: :last, fragment: nil, absolute: false, concept: false, internal: false)
        path = case target
               # REVIEW: can we remove the String type here or check the given target to make things more deterministic?
               when String
                 target
               when Nanoc::Core::CompilationItemView
                 target.path(rep: rep, snapshot: snapshot)
               when Nanoc::Core::BasicItemRepView
                 target.path(snapshot: snapshot)
               else
                 raise ArgumentError, "Cannot link to #{target.inspect} (expected a string or item view, not a #{target.class.name})"
               end

        unless path
          raise "Cannot create a path to #{target.inspect} because this target is not outputted (its routing rule returns nil)"
        end

        nearest_path = find_nearest_path(@item_rep, @item)
        path = unstack(nearest_path, path) if nearest_path

        # Append base url, if absolute path is requested
        base_url = @config[:base_url]
        if base_url.nil?
          raise Nanoc::Core::TrivialError.new("Cannot build global path to #{target.inspect}: site configuration has no base_url")
        end
        path = absolute ? base_url + path : path.sub(base_url, '')

        # Remove static root for external path, if present
        unless internal
          static_root = @config.fetch(:static_root, '')
          path.sub!(static_root, '')
        end

        # Chop off last slash for concept URIs
        # @see {file:URI_DESIGN.md}
        path.chop! if concept && path.end_with?('/')

        # Assemble fragment identifier, if given
        if fragment
          fragment = fragment.start_with?('#') ? fragment : '#' + fragment.to_s
          path += fragment
        end

        path
      end

      def short_url_for(item, rep: :default, snapshot: :last)
        shorten(path_to(item, rep: rep, snapshot: snapshot, absolute: true))
      end

      protected

      def unstack(current, target)
        if target.start_with?('/')
          return target
        end

        p = current.gsub(%r{[^/]*$}, '') + target
        p = p.gsub(%r{/+}, '/')
        p = p.gsub(%r{[^/]*/\.\./}, '') while p =~ %r{\.\./}
        p
      end

      def find_nearest_path(*path_items)
        item_with_path = path_items.find { |item| item && item.path }
        item_with_path && item_with_path.path
      end
    end
  end
end
