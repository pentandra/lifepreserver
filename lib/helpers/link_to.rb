# frozen_string_literal: true

require 'active_support/core_ext/string/output_safety'
require 'uri'

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
      # @param attributes (see #path_to)
      # @option attributes (see #path_to)
      #
      # @return [String] The anchor link to the item.
      def link_to_id(id, attributes = {})
        item = @items[id]

        unless item
          raise ArgumentError, "Cannot build link to #{id}: could not find item"
        end

        title = item[:short_title] || item[:title]

        if title.nil?
          raise Nanoc::Core::TrivialError.new("Cannot build link to #{item.identifier}: item has no title")
        end

        link_to(title, item, attributes)
      end

      # Generate a hyperlink from text and a target.
      #
      # @param text [String] The text of the anchor element.
      # @param attributes (see #path_to)
      # @option attributes (see #path_to)
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
        }.compact

        path = path_to(target, path_attributes)

        # Join the rest of the attributes
        attributes = attributes.reduce('') do |memo, (key, value)|
          memo + key.to_s + '="' + h(value) + '" '
        end

        # Create link
        %(<a #{attributes}href="#{h path}">#{html_escape_once(text)}</a>)
      end

      # Generate a resource path from a target following RFC3986.
      #
      # @param target [String, Nanoc::Core::CompilationItemView, Nanoc::Core::BasicItemRepView]
      # @param attributes [Hash]
      # @option attributes [Symbol] :rep (:default) the item rep to link to
      # @option attributes [Symbol] :snapshot (:last) the snapshot to link to
      # @option attributes [String] :fragment (nil) a URI fragment to append
      # @option attributes [Boolean] :absolute (false) return an absolute URI?
      # @option attributes [Boolean] :concept (false) is this a concept URI?
      #
      # @see file:URI_DESIGN.md
      # @see https://tools.ietf.org/html/rfc3986 RFC3986
      #
      # @return [String] The path to the target.
      def path_to(target, attributes = {})
        rep = attributes.fetch(:rep, :default)
        snapshot = attributes.fetch(:snapshot, :last)
        fragment = attributes[:fragment]
        absolute = attributes.fetch(:absolute, false)
        concept = attributes.fetch(:concept, false)

        base_url = @config[:base_url]
        if absolute && base_url.nil?
          raise Nanoc::Core::TrivialError.new("Cannot build absolute path to #{target.inspect}: site configuration has no base_url")
        end

        path =
          case target
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

        src_path = [@item_rep, @item].map { |item| item&.path }.compact.first

        unless path || src_path
          raise "Cannot create a path to #{target.inspect} because this target is not outputted (its routing rule returns nil)"
        end

        target_uri = URI.join(base_url || 'relative-ref:', src_path.to_s, path.to_s)

        # If present, remove Nginx root directory from the public path.
        target_uri.path = target_uri.path.sub(@config[:static_root].to_s, '')

        # Chop off last slash for concept URIs.
        target_uri.path = target_uri.path.chop if concept && target_uri.path.end_with?('/')

        target_uri.fragment = fragment.delete_prefix('#') if fragment
        target_uri.normalize!

        if absolute || (base_url && URI(base_url).host != target_uri.host) # target_uri.coerce(base_url.to_s).map { |t| t.select(:scheme, :host) }.reduce(:|).count == 2
          target_uri.to_s
        else
          # target_uri = src_path&.route_to(target_uri)
          target_uri.select(:path, :fragment).compact.join('#')
        end
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
      # @param fragment [String] An optional URI fragment to append.
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
    end
  end
end
