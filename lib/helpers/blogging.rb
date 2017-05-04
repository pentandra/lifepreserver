module LifePreserver
  module Blogging
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
      blk = -> { blog_posts.sort_by { |p| attribute_to_time(p.unwrap.attributes[:created_at]) }.reverse }
      if @items.frozen?
        @sorted_blog_post_items ||= blk.call
      else
        blk.call
      end
    end

    # Relies upon Rules preprocessing to set the `:is_hidden` attribute.
    def published_blog_posts
      blk = -> { sorted_blog_posts.reject { |a| a.unwrap.attributes[:is_hidden] } }
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

    #
    # Create a link for the author of this page
    #
    def link_for_author(author, rel_tag: true)
      %(<a href="#{@config[:blog][:authors_url]}/#{h author.to_slug}/" title="Articles by #{h author}"#{' rel="author"' if rel_tag}>#{h author}</a>)
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

    protected

    def validate_config
      if @config[:base_url].nil?
        raise Nanoc::Int::Errors::GenericTrivial.new('Cannot generate author URIs: site configuration has no base_url')
      end
    end
  end
end
