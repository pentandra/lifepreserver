# frozen_string_literal: true

require_relative 'weblog'
require_relative 'link_to'
require_relative 'dates'

module LifePreserver
  module Helpers
    # @see Nanoc::Helpers::Blogging
    module AtomFeed
      include Dates
      include LinkTo
      include Weblog

      class AtomFeedBuilder
        attr_accessor :config

        attr_accessor :id
        attr_accessor :limit
        attr_accessor :relevant_entries
        attr_accessor :preserve_order
        attr_accessor :content_proc
        attr_accessor :excerpt_proc
        attr_accessor :title_proc
        attr_accessor :title
        attr_accessor :author_name
        attr_accessor :author_uri
        attr_accessor :icon
        attr_accessor :logo
        attr_accessor :rights

        def initialize(config, item)
          @config = config
          @item = item
        end

        def validate
          validate_config
          validate_feed_item
          validate_entries
        end

        def build
          buffer = +''
          xml = Builder::XmlMarkup.new(target: buffer, indent: 2)
          build_for_feed(xml)
          buffer
        end

        protected

        def sorted_relevant_entries
          all = @relevant_entries

          unless @preserve_order
            all = all.sort_by { |a| attribute_to_time(a[:published_at] || a[:created_at]) }
          end

          all.reverse.first(@limit)
        end

        def base_url
          require 'uri'
          URI(@config[:base_url]).normalize.to_s
        end

        def updated
          @relevant_entries.map { |a| attribute_to_time(a[:updated_at] || a[:created_at]) }.max
        end

        def validate_config
          if @config[:base_url].nil?
            raise Nanoc::Core::TrivialError.new('Cannot build Atom feed: site configuration has no base_url')
          end
        end

        def validate_feed_item
          if @title.nil?
            raise Nanoc::Core::TrivialError.new('Cannot build Atom feed: no title in params, item or site config')
          end
          if @author_name.nil?
            raise Nanoc::Core::TrivialError.new('Cannot build Atom feed: no author_name in params, item or site config')
          end
          if @author_uri.nil?
            raise Nanoc::Core::TrivialError.new('Cannot build Atom feed: no author_uri in params, item or site config')
          end
        end

        def validate_entries
          if @relevant_entries.empty?
            raise Nanoc::Core::TrivialError.new('Cannot build Atom feed: no entries')
          end
          if @relevant_entries.any? { |a| a[:created_at].nil? }
            raise Nanoc::Core::TrivialError.new('Cannot build Atom feed: one or more entries lack created_at')
          end
        end

        def build_for_feed(xml)
          xml.instruct!
          xml.feed(xmlns: 'http://www.w3.org/2005/Atom', 'xml:base' => base_url) do

            # Add primary attributes
            xml.id(id || base_url)
            xml.title(@title)

            # Add date
            xml.updated(updated.iso8601)

            # Add links
            xml.link(rel: 'alternate', href: feed_alternate_url, type: 'text/html')
            xml.link(rel: 'self',      href: feed_url,           type: 'application/atom+xml')

            # Add author information
            xml.author do
              xml.name(@author_name)
              xml.uri(@author_uri)
            end

            # Add rights information
            xml.rights(@rights) if @rights

            # Add icon and logo
            xml.icon(@icon) if @icon
            xml.logo(@logo) if @logo

            # Add entries
            sorted_relevant_entries.each do |entry|
              build_for_entry(entry, xml)
            end
          end
        end

        def build_for_entry(entry, xml)
          # Get URL
          url = path_to(entry, absolute: true)
          return if url.nil?

          # Fetch the language of the entry
          entry_lang = entry.fetch(:lang) do
            require 'locale'
            Locale.default.to_rfc.to_s
          end

          xml.entry do
            # Add primary attributes
            xml.id(entry.fetch(:atom_tag) { tag_uri_for(entry) })
            xml.title(title_proc.call(entry), type: 'html')

            # Add dates
            xml.published(attribute_to_time(entry[:published_at] || entry[:created_at]).iso8601)
            xml.updated(attribute_to_time(entry[:updated_at] || entry[:created_at]).iso8601)

            # Add specific author information
            if entry[:author_name] || entry[:author_uri]
              xml.author do
                xml.name(entry[:author_name] || author_name)
                xml.uri(entry[:author_uri] || author_uri)
              end
            end

            # Add link
            xml.link(rel: 'alternate', href: url, type: 'text/html', hreflang: entry_lang)

            # Add content
            summary = excerpt_proc.call(entry)
            xml.content(content_proc.call(entry), type: 'html', 'xml:lang' => entry_lang)
            xml.summary(summary, type: 'html') unless summary.nil?
          end
        end
      end

      # Generate an Atom feed a la RFC4287 and RFC4946.
      #
      # @see https://tools.ietf.org/html/rfc4287
      #
      # @param [Hash] params General parameters for the feed.
      # @option params [Number] :limit (5) The limiting number of entries for the feed.
      # @option params [Array] :entries ([]) An array of items to publish.
      # @option params [Boolean] :preserve_order (false) Whether to preserve the order
      #   of items as given. Otherwise items will be sorted by published or created date.
      # @option params [Proc] :content_proc (->(a) { a.compiled_content(snapshot: :pre) })
      # @option params [Proc] :excerpt_proc (->(a) { a[:excerpt] })
      # @option params [Proc] :title_proc (->(a) { a[:title] })
      # @option params [String] :title The title of the feed.
      # @option params [String] :id The id of the feed.
      # @option params [String] :author_name The default author of the feed.
      # @option params [String] :author_uri The default author URI of the feed.
      # @option params [String] :icon The icon associated with the feed.
      # @option params [String] :logo The logo associated with the feed.
      # @option params [String] :rights The rights associated with the feed.
      #
      # @return [String]
      def atom_feed(params = {})
        require 'builder'

        # Create builder
        builder = AtomFeedBuilder.new(@config, @item)

        # Fill builder
        builder.id                = params[:id]
        builder.limit             = params.fetch(:limit, 5)
        builder.relevant_entries  = params.fetch(:entries, [])
        builder.preserve_order    = params.fetch(:preserve_order, false)
        builder.content_proc      = params.fetch(:content_proc, ->(a) { a.compiled_content(snapshot: :pre) })
        builder.excerpt_proc      = params.fetch(:excerpt_proc, ->(a) { a[:excerpt] })
        builder.title_proc        = params.fetch(:title_proc, ->(a) { a[:title] })
        builder.title             = params[:title] || @item[:title] || @config[:title]
        builder.author_name       = params[:author_name] || @item[:author_name] || @config[:author_name]
        builder.author_uri        = params[:author_uri] || @item[:author_uri] || @config[:author_uri]
        builder.icon              = params[:icon]
        builder.logo              = params[:logo]
        builder.rights            = params[:rights]

        # Run
        builder.validate
        builder.build
      end

      # Fetch the URL of the feed item.
      #
      # @note Defaults to the current item's path, but can be overridden with a
      # +:feed_url+ item attribute.
      #
      # @return [String] The URL of the feed.
      def feed_url
        @item.fetch(:feed_url) { path_to(@item, absolute: true) }
      end

      # Fetch an alternate URL of the feed item.
      #
      # @note Assumes the existance of an alternate index file with the same
      #   parent as the feed. Use the +:alternate_url+ item attribute to
      #   override this default.
      #
      # @todo Provide some check to verify that this alternate exists.
      #
      # @example A tightly coupled implementation to ensure that item exists
      #   alternate_id = File.join(File.dirname(path_to(@item)), 'index.*')
      #   if (alternate_item = @items[alternate_id])
      #     path_to(alternate_item, absolute: true)
      #   else
      #     raise "Please set :alternate_url for #{@item.identifier}"
      #   end
      #
      # @return [String] The alternate URL of the feed.
      def feed_alternate_url
        @item.fetch(:alternate_url) do
          feed_parent = File.dirname(path_to(@item))
          index_path = File::SEPARATOR
          path_to(File.join(feed_parent, index_path), absolute: true)
        end
      end
    end
  end
end
