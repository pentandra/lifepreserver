# frozen_string_literal: true

require 'active_support/core_ext/object/blank'
require 'digest'
require 'set'

require_relative 'dates'
require_relative 'link_to'
require_relative 'people'

module LifePreserver
  module Helpers
    # Helper functions for the Weblog of Syndicated Items.
    #
    # @see Nanoc::Helpers::Blogging
    module Weblog
      include LinkTo
      include People
      include Dates

      # Checks whether the given item is a syndicated item.
      #
      # @note Does not create a Nanoc dependency on the given item.
      #
      # @param item [Nanoc::Core::Item] The item to check.
      # @return [Boolean] true if the item is syndicated, false otherwise.
      def syndicated?(item)
        item.identifier =~ /^#{Regexp.quote(static_posts_root)}.*\.(md|html|erb)$/
      end

      # Get the log of syndicated items.
      #
      # @note Does not create a Nanoc dependency on the returned items.
      # @note Returns only non-hidden items. Relies upon Rules preprocessing to set
      #   the +:is_hidden+ attribute.
      # @param kinds [Array<Symbol,String>] The +:kind+s of syndicated items to get.
      # @return [Enumerable] The syndicated items.
      def weblog(*kinds)
        blk = lambda do |*kinds|
          syndicated = @items.find_all(File.join(static_posts_root, '**', '*.{md,html,erb}'))
          requested_kinds = kinds.map(&:to_s)

          # Remove hidden items
          syndicated.reject! { |p| p._unwrap.attributes[:is_hidden] }

          if requested_kinds.empty?
            syndicated
          else
            syndicated.select { |item| requested_kinds.include?(item._unwrap.attributes[:kind]&.to_s) }
          end
        end

        if @items.frozen?
          @weblog_items ||= {}
          @weblog_items[kinds.map(&:to_s).sort.hash] ||= blk.call(*kinds)
        else
          blk.call(*kinds)
        end
      end

      # Sorts the list of syndicated items in reverse chronological order.
      #
      # Unpublished items come first, ordered according to the item's
      # +:updated_at+ attribute. Published items follow, ordered by the item's
      # +:published_at+ attribute.
      #
      # @note Does not create a Nanoc dependency on the returned items.
      # @note Returns only non-hidden items. Relies upon Rules preprocessing to set
      #   the +:is_hidden+ attribute.
      # @param (see #weblog)
      # @return [Enumerable] The sorted syndicated items.
      def sorted_weblog(*kinds)
        blk = lambda do |*kinds|
          unpublished, published = weblog(*kinds).partition { |p| p._unwrap.attributes[:published_at].nil? }
          unpublished = unpublished.sort_by { |p| attribute_to_time(p._unwrap.attributes[:updated_at]) }.reverse
          published = published.sort_by { |p| attribute_to_time(p._unwrap.attributes[:published_at]) }.reverse
          unpublished + published
        end

        if @items.frozen?
          @sorted_weblog_items ||= {}
          @sorted_weblog_items[kinds.map(&:to_s).sort.hash] ||= blk.call(*kinds)
        else
          blk.call(*kinds)
        end
      end

      # Return the author names of the given posts.
      #
      # @note Does not create dependencies on the given items.
      #
      # @param posts [Enumerable] The posts to select from. If +nil+, defaults to {#weblog}.
      # @return [Set<String>] A set of unique author names.
      def authors(posts = nil)
        posts ||= weblog
        posts.each_with_object(Set.new) do |post, authors|
          post = post.respond_to?(:_unwrap) ? post._unwrap : post
          author_name = post.attributes[:author_name].to_s

          unless author_name.blank?
            authors << author_name
          end
        end.freeze
      end

      # Get the all the posts by the given author
      #
      # @note Does not create dependencies on the given items.
      #
      # @param author_name [String] the name of the author
      # @param posts [Enumerable] The posts to select from. If +nil+, defaults to {#weblog}.
      # @return [Enumerable] The posts by the given author.
      def posts_by_author(author_name, posts = nil)
        posts ||= weblog
        posts.select do |post|
          post = post.respond_to?(:_unwrap) ? post._unwrap : post

          if (post_author = post.attributes[:author_name])
            post_author == author_name
          end
        end
      end

      # Get the all the posts published during the given year.
      #
      # @note Does not create dependencies on the given items.
      #
      # @param year [Number] The year of publication to fetch.
      # @param posts [Enumerable] The posts to select from. If +nil+, defaults to {#weblog}.
      def posts_by_year(year, posts = nil)
        posts ||= weblog
        posts.select do |post|
          post = post.respond_to?(:_unwrap) ? post._unwrap : post

          if (published_at = post.attributes[:published_at])
            attribute_to_time(published_at).year == year
          end
        end
      end

      # Generate HyperLink to a Weblog archive for the given year.
      # @todo Fix +:archives_path+
      def link_for_archive(year)
        %(<a rel="archives" href="#{@config[:blog][:archives_path]}/#{h year.to_s}/" title="Articles written in #{h year.to_s}">#{h year.to_s}</a>)
      end

      # Returns the years during which any items were published.
      #
      # @param posts [Enumerable] The posts to inspect. If +nil+, defaults to {#weblog}.
      # @return [Set<Number>] The set of years that has posts published.
      def archive_years(posts = nil)
        posts ||= weblog
        posts.each_with_object(Set.new) do |post, years|
          post = post.respond_to?(:_unwrap) ? post._unwrap : post

          if (published_at = post.attributes[:published_at])
            years << attribute_to_time(published_at).year
          end
        end.freeze
      end

      # Extract a summary from the given item representation.
      #
      # Adapted from {https://gist.github.com/1gor/3134795}.
      #
      # @param post [Nanoc::Core::BasicItemRepView,Nanoc::Core::BasicItemView] The item to summarize.
      # @param snapshot [Symbol] The item's snapshot to summarize.
      # @param read_more_text [String] The text to show in the link to read more.
      # @param separator [String] A keyword or character sequence that is used to divide the head from the body.
      # @return [String] The post's summary, or if a separator sequence was not found, the entire post body.
      def post_summary(post, snapshot: nil, read_more_text: 'Read more ⇢', separator: '<!--MORE-->')
        post_rep =
          case post
          when Nanoc::Core::BasicItemRepView
            post
          when Nanoc::Core::CompilationItemView
            post.reps.fetch(:default)
          else
            raise ArgumentError, "Cannot summarize #{post.inspect} (expected an item rep or an item, not a #{post.class.name})"
          end

        head, body = post_rep.compiled_content(snapshot: snapshot).split(separator)
        return head unless body

        link = link_to(post_rep.item.fetch(:read_more, read_more_text),
                       post_rep.item,
                       absolute: post_rep.name != :default,
                       title: "Read the full #{post_rep.item.fetch(:kind, 'article')}")

        head << %(<p class="readmore">#{link}</p>)
      end

      # Create a link for the author of this page
      #
      # @see https://html.spec.whatwg.org/multipage/links.html#link-type-author
      #
      # @param author [String, Nanoc::Core::BasicItemView] The author item or name.
      # @param rel_author [Boolean] If true, use a +rel=author+ attribute in the link.
      def link_for_author(author, rel_author: true)
        author = find_person(author)
        %(<a resource="#{author.fetch(:web_id)}" href="#{path_to_profile_page(author)}" title="More about #{h author[:name]}"#{' rel="author"' if rel_author}>#{h author[:name]}</a>)
      end

      # Provide a unique, stable key for an article for BibTex databases.
      #
      # Does not need to be globally unique, only unique in the user's bibtex file.
      #
      # @param item [Nanoc::Core::BasicItemview] The item for which to generate a key.
      # @param author [String, Nanoc::Core::BasicItemView] The author item or name.
      # @return [String] The item's +:bibtex_key+ attribute, if it exists, otherwise
      #   a generated key based on the item's +:published_at+ and +:title+ attributes,
      #   and the author's +:sn+ and +:givenname+ attributes.
      def bibtex_key(item, author)
        author = find_person(author)

        item[:bibtex_key] || begin
          [
            author.fetch(:sn),
            author.fetch(:givenname).chr,
            attribute_to_time(item[:published_at]).year,
            Digest::SHA1.hexdigest(item[:title])[0..6]
          ].join(':').downcase
        end
      end

      private

      def static_posts_root
        @static_posts_root_value ||=
          File.join([:static_root, :posts_root].map { |r| @config[r].to_s })
      end
    end
  end
end
