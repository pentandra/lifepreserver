require "active_support/core_ext/object/blank"
require_relative 'text'

module LifePreserver

  module Blogging

    include Text

    def blog_post?(item)
      item[:kind] == "article" && item.identifier =~ /^\/blog/
    end

    def blog_posts
      blk = -> { @items.find_all('/blog/**/*.md') }
      if @items.frozen?
        @blog_post_items ||= blk.call
      else
        blk.call
      end
    end

    def sorted_blog_posts
      blk = -> { blog_posts.sort_by { |a| attribute_to_time(a[:created_at]) }.reverse }
      if @items.frozen?
        @sorted_blog_post_items ||= blk.call
      else
        blk.call
      end
    end

    # Relies upon Rules preprocessing to set the `:is_hidden` attribute.
    def published_blog_posts
      blk = -> { sorted_blog_posts.reject { |a| a[:is_hidden] } }
      if @items.frozen?
        @published_blog_post_items ||= blk.call
      else
        blk.call
      end
    end

    def authors(posts = nil)
      posts ||= @blog_posts
      authors = Set.new
      posts.each do |post|
        next if post[:author_name].blank?
        authors << post[:author_name].to_s
      end
      authors.to_a
    end

    #
    # Create a link for the author of this page
    #
    def link_for_author(author, rel_tag: true)
      %[<a href="#{@config[:blog][:authors_url]}/#{h author.to_slug}/" title="Articles by #{h author}"#{" rel=\"author\"" if rel_tag}>#{h author}</a>]
    end

    def link_for_authorlist(author)
      link_for_author(author, rel_tag: false)
    end

    def posts_by_author(posts, author_name)
      posts.select { |post| post[:author_name] == author_name }
    end

    def posts_by_year(posts, year)
      posts.select { |post| post[:created_at].year == year }
    end

    def link_for_archive(year)
      %[<a rel="archives" href="#{@config[:blog][:archives_url]}/#{h year.to_s}/" title="Articles written in #{h year.to_s}">#{h year.to_s}</a>]
    end

    def archive_years(posts = nil)
      posts ||= @blog_posts
      years = posts.map { |a| a[:created_at].year }.uniq
      years.to_a
    end

    def post_summary(post, read_more_text="Read more ⇢", separator="<!--MORE-->")
      summary,body = post.compiled_content.split(separator)
      return summary unless body

      link = link_to(post.fetch(:read_more, read_more_text), post.path, class: "readmore", title: "Read the full article")
      return summary << "<p class=\"readmore\">#{link}</p>"
    end

    def article_id(article)
      article[:article_id] || md5(article[:title].to_slug)
    end

    # Creates in-memory author pages from partial: layouts/author.html
    def generate_author_pages(item_set)
      authors(item_set).each do |author|
        @items.create(
          %[<%= render("/blog/author.*", author: "#{author}") %>],
          { title: "Articles by #{author}", kind: "author-page", is_hidden: true, description: "All posts written by #{author}" },
          "#{@config[:blog][:authors_url]}/#{author.to_slug}/index.erb",
          binary: false
        )
      end
    end

    # Creates in-memory blog archive pages from partial:
    # layouts/blog_archive.html
    def generate_blog_archives(item_set)
      years = item_set.map { |a| a[:created_at].year }.uniq
      years.each do |year|
        @items.create(
          %[<%= render("/blog/archive.*", year: #{year}) %>],
          { title: "Articles from #{year}", kind: "archive-page", is_hidden: true, description: "All posts written in #{year}" },
          "#{@config[:blog][:archives_url]}/#{year}/index.erb",
          binary: false
        )
      end
    end

    def short_url_for(item)
      shorten(url_for(item))
    end

  end

end
