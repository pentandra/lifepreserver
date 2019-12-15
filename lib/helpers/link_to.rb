# frozen_string_literal: true

require 'active_support/core_ext/string/output_safety'

require_relative 'dates'
require_relative 'url_shortener'

module LifePreserver
  module Helpers
    module LinkTo
      include Dates
      include UrlShortener
      include ERB::Util

      # A convenience method to link to an item using its title as the text
      # of the link.
      #
      # @param [String] id the item id
      # @param attributes (see #link_to)
      # @option attributes (see #link_to)
      #
      # @return [String] The anchor link to the item.
      def link_to_id(id, attributes = {})
        item = @items[id]

        unless item
          raise ArgumentError, "Could not find item to link to with identifier: #{id}"
        end

        link_to(item[:short_title] || item[:title], item, attributes)
      end

      # Generate a hyperlink from text and a target.
      #
      # @param text [String] The text of the anchor element.
      # @param attributes [Hash]
      # @option attributes [Symbol] :rep (:default) the item rep to link to
      # @option attributes [Symbol] :snapshot (:last) the snapshot to link to
      # @option attributes [String] :fragment (nil) a URI fragment to append
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
          internal: attributes.delete(:internal),
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
      # @param target [String, Nanoc::Core::CompilationItemView, Nanoc::Core::BasicItemRepView]
      # @param rep [Symbol] The item rep to link to
      # @param snapshot [Symbol] The snapshot to link to
      # @param fragment [String] A URI fragment to append
      # @param absolute [Boolean] Return an absolute URI?
      # @param concept [Boolean] Is this a concept URI?
      # @param internal [Boolean] Retain internal static root path (if it exists)?
      #
      # @return [String] The path to the target.
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
        # TODO: manage dependency on @config[:base_url]
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

      # Create a tag URI for the given item.
      #
      # @note Tags, specified in RFC4151, are permanent, universally unique,
      #   non-resolvable identifiers designed for humans and machines.
      #
      # @see https://tools.ietf.org/html/rfc4151 RFC4151
      # @see https://web.archive.org/web/20110514113830/http://diveintomark.org/archives/2004/05/28/howto-atom-id How to make a good ID in Atom, by Mark Pilgrim (archived)
      #
      # @param item [Nanoc::Core::CompilationItemView] The item to be tagged.
      # @param fragment [String] An optional fragment to append.
      #
      # @raise [Nanoc::Core::TrivialError] If the item has no +created_at+
      #   attribute or the site configuration has no +base_url+.
      #
      # @return [String] The tag URI of the given item.
      def tag_uri_for(item, fragment: nil)
        base_url = @config[:base_url]
        if base_url.nil?
          raise Nanoc::Core::TrivialError.new("Cannot build a tag URI to '#{item.identifier}': site configuration has no base_url")
        end

        created_at = item[:created_at]
        if created_at.nil?
          raise Nanoc::Core::TrivialError.new("Cannot build a tag URI to '#{item.identifier}': item has no created_at")
        end

        formatted_date = date_or_time(created_at).to_s(:date)
        hostname, base_dir = %r{^.+?://([^/]+)(.*)$}.match(base_url)[1..2]

        "tag:#{hostname},#{formatted_date}:#{base_dir}#{path_to(item, fragment: fragment)}"
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
        path_items.find { |item| item&.path }&.path
      end
    end
  end
end
