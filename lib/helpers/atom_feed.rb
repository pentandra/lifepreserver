# frozen_string_literal: true

require 'locale'

require_relative 'weblog'
require_relative 'link_to'
require_relative 'dates'

module LifePreserver
  module Helpers
    # @see Nanoc::Helpers::Blogging
    module AtomFeed
      include LifePreserver::Helpers::Dates
      include LifePreserver::Helpers::LinkTo
      include LifePreserver::Helpers::Weblog

      class AtomFeedBuilder
        attr_accessor :config

        attr_accessor :alt_link
        attr_accessor :alt_link_lang
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
          root_url = URI(@config[:base_url]).normalize.to_s
          xml.instruct!
          xml.feed(xmlns: 'http://www.w3.org/2005/Atom', 'xml:base' => root_url) do

            # Add primary attributes
            xml.id(id || root_url)
            xml.title(@title)

            # Add date
            xml.updated(updated.__nanoc_to_iso8601_time)

            # Add links
            xml.link(rel: 'alternate', href: (alt_link || root_url), type: 'text/html', hreflang: alt_link_lang)
            xml.link(rel: 'self',      href: feed_url,               type: 'application/atom+xml')

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
          entry_lang = entry.fetch(:lang) { Locale.default.to_rfc.to_s }

          xml.entry do
            # Add primary attributes
            xml.id(atom_tag_for(entry))
            xml.title(title_proc.call(entry), type: 'html')

            # Add dates
            xml.published(attribute_to_time(entry[:published_at] || entry[:created_at]).__nanoc_to_iso8601_time)
            xml.updated(attribute_to_time(entry[:updated_at] || entry[:created_at]).__nanoc_to_iso8601_time)

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

      # Generate an Atom feed.
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
      # @option params [String] :alt_link A link to an alternate representation of the feed.
      # @option params [String] :alt_link_lang (Locale.default.to_rfc) The language
      #   of the alternate representation of the feed (i.e. +:alt_link+).
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
        builder.alt_link          = params[:alt_link]
        builder.alt_link_lang     = params.fetch(:alt_link_lang) { Locale.default.to_rfc.to_s }
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

      # @return [String]
      def feed_url
        @item[:feed_url] || path_to(@item, absolute: true)
      end

      # @return [String]
      def atom_tag_for(item)
        return item[:entry_id] if item[:entry_id]

        hostname, base_dir = %r{^.+?://([^/]+)(.*)$}.match(@config[:base_url])[1..2]
        formatted_date = attribute_to_time(item[:created_at]).__nanoc_to_iso8601_date

        "tag:#{hostname},#{formatted_date}:#{base_dir}#{path_to(item)}"
      end
    end
  end
end
