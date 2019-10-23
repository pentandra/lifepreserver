# frozen_string_literal: true

require_relative 'link_to'
require_relative 'people'

module LifePreserver
  module Blogging
    include LinkTo
    include People

    def blog_post?(item)
      item.identifier =~ %r{^/static/blog/posts/.*\.(md|html)}
    end

    def blog_posts
      @items.find_all('/static/blog/posts/**/*.{md,html}')
    end

    def sorted_blog_posts
      blog_posts.sort_by { |p| attribute_to_time(p._unwrap.attributes[:created_at]) }.reverse
    end

    # Relies upon Rules preprocessing to set the `:is_hidden` attribute.
    def published_blog_posts
      sorted_blog_posts.reject { |a| a._unwrap.attributes[:is_hidden] }
    end

    def link_to_if_published(post, item_set = [], attributes = {})
      if item_set.include?(post)
        link_to(post[:short_title] || post[:title], post, attributes)
      else
        %(<span class="title">#{post[:short_title] || post[:title]}</span>)
      end
    end

    def post_summary(post_rep, snapshot: nil, read_more_text: 'Read more ⇢', separator: '<!--MORE-->')
      post_rep = case post_rep
                 when Nanoc::BasicItemRepView
                   post_rep
                 when Nanoc::CompilationItemView
                   post_rep.reps.fetch(:default)
                 else
                   raise ArgumentError, "Cannot summarize #{item_rep.inspect} (expected an item rep or an item, not a #{item_rep.class.name})"
                 end

      summary, body = post_rep.compiled_content(snapshot: snapshot).split(separator)
      return summary unless body

      link = link_to(post_rep.item.fetch(:read_more, read_more_text), post_rep.item, absolute: post_rep.name != :default, class: 'readmore', title: 'Read the full article')
      summary << %(<p class="readmore">#{link}</p>)
    end

    #
    # Create a link for the author of this page
    #
    def link_for_author(author, rel_tag: true)
      author = person_by_name(author)
      %(<a resource="#{author.fetch(:web_id)}" href="#{path_to_profile_page(author)}" title="More about #{h full_name(author)}"#{' rel="author"' if rel_tag}>#{h full_name(author)}</a>)
    end

    # Populates the `author_uri` for the given blog post items. If not set
    #   specifically, falls back to the WebID of the author.
    #
    # @note Run during preprocessing.
    #
    # @param [Array<Nanoc::BasicItemView>] item_set An array of blog post items.
    #
    # @return [void]
    def populate_author_uris(item_set = nil)
      item_set ||= blog_posts
      item_set.each do |item|
        author = person_by_name(item[:author_name])
        if author
          item[:author_uri] ||= author.fetch(:web_id)
        end
      end
    end

    def bibtex_key(item, author)
      item[:bibtex_key] || [author.fetch(:last_name), author.fetch(:first_name)[0], attribute_to_time(item[:published_at]).year, Digest::SHA1.hexdigest(item[:title])[0..6]].join(':').downcase
    end
  end
end
