# frozen_string_literal: true

require_relative 'link_to'

module LifePreserver
  module Blogging
    include LinkTo

    def blog_post?(item)
      item.identifier =~ %r{^/static/blog/posts/.*\.(md|html)}
    end

    def blog_posts
      blk = -> { @items.find_all('/static/blog/posts/**/*.{md,html}') }
      if @items.frozen?
        @blog_post_items ||= blk.call
      else
        blk.call
      end
    end

    def sorted_blog_posts
      blk = -> { blog_posts.sort_by { |p| attribute_to_time(p._unwrap.attributes[:created_at]) }.reverse }
      if @items.frozen?
        @sorted_blog_post_items ||= blk.call
      else
        blk.call
      end
    end

    # Relies upon Rules preprocessing to set the `:is_hidden` attribute.
    def published_blog_posts
      blk = -> { sorted_blog_posts.reject { |a| a._unwrap.attributes[:is_hidden] } }
      if @items.frozen?
        @published_blog_post_items ||= blk.call
      end
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
      %(<a href="#{@config[:blog][:authors_path]}/#{h author.to_slug}/" title="Articles by #{h author}"#{' rel="author"' if rel_tag}>#{h author}</a>)
    end

    # run during preprocessing
    def generate_author_uris(item_set = nil)
      item_set ||= blog_posts
      validate_config

      item_set.each do |item|
        author = person_by_name(item[:author_name])
        if author
          item[:author_uri] ||= "#{@config[:base_url]}#{description_path(author)}"
        end
      end
    end

    def bibtex_key(item, author)
      item[:bibtex_key] || [author.fetch(:last_name), author.fetch(:first_name)[0], attribute_to_time(item[:published_at]).year, Digest::SHA1.hexdigest(item[:title])[0..6]].join(':').downcase
    end

    protected

    def validate_config
      if @config[:base_url].nil?
        raise Nanoc::Int::Errors::GenericTrivial.new('Cannot generate author URIs: site configuration has no base_url')
      end
    end
  end
end
