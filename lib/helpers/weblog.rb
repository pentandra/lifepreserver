# frozen_string_literal: true

require 'active_support/core_ext/object/blank'
require_relative 'text'
require_relative 'company'
require_relative 'articles'
require_relative 'blogging'

module LifePreserver
  module Weblog
    include Text
    include Company
    include Articles
    include Blogging

    def weblog
      articles + blog_posts
    end

    def sorted_weblog
      unpublished_posts, published_posts = weblog.partition { |p| p._unwrap.attributes[:published_at].nil? }

      unpublished_posts = unpublished_posts.sort_by { |p| attribute_to_time(p._unwrap.attributes[:updated_at]) }.reverse
      published_posts = published_posts.sort_by { |p| attribute_to_time(p._unwrap.attributes[:published_at]) }.reverse

      unpublished_posts + published_posts
    end

    # Relies upon Rules preprocessing to set the `:is_hidden` attribute.
    def published_weblog
      sorted_weblog.reject { |p| p._unwrap.attributes[:is_hidden] }
    end

    def authors(posts = nil)
      posts ||= published_weblog
      authors = Set.new
      posts.each do |post|
        author_name = post._unwrap.attributes[:author_name]
        next if author_name.blank?
        authors << author_name.to_s
      end
      authors.to_a
    end

    def link_for_authorlist(author)
      link_for_author(author, rel_tag: false)
    end

    # Get the all the posts by the given author
    # Does not create dependencies.
    #
    # @param [String] author_name the name of the author
    # @param [Enumerable] posts the posts to filter
    #
    def posts_by_author(author_name, posts = nil)
      posts ||= published_weblog
      posts.select { |post| post._unwrap.attributes[:author_name] == author_name }
    end

    # Get the all the posts published during the given year
    # Does not create dependencies.
    #
    # @param [Number] year the year of publication
    # @param [Enumerable] posts the posts to filter
    #
    def posts_by_year(year, posts = nil)
      posts ||= published_weblog
      posts.select { |post| post._unwrap.attributes.key?(:published_at) && post._unwrap.attributes.fetch(:published_at).year == year }
    end

    def link_for_archive(year)
      %(<a rel="archives" href="#{@config[:blog][:archives_path]}/#{h year.to_s}/" title="Articles written in #{h year.to_s}">#{h year.to_s}</a>)
    end

    def archive_years(posts = nil)
      posts ||= published_weblog
      posts
        .select { |post| post._unwrap.attributes.key?(:published_at) }
        .map { |post| post._unwrap.attributes.fetch(:published_at).year }
        .uniq
        .to_a
    end

    # Creates in-memory author pages from partial: layouts/blog/author.html
    def generate_author_pages(item_set = nil)
      item_set ||= published_weblog
      authors(item_set).each do |author|
        @items.create(
          %(<%= render('/blog/author.*', author: '#{author}') %>),
          { title: "Weblog postings by #{author}", kind: 'author-page', is_hidden: true, description: "All posts written by #{author}" },
          "#{@config[:static_root]}#{@config[:blog][:authors_path]}/#{author.to_slug}/index.erb",
          binary: false,
        )
      end
    end

    # Creates in-memory blog archive pages from partial: layouts/blog/archive.html
    def generate_blog_archives(item_set = nil)
      item_set ||= published_weblog
      archive_years(item_set).each do |year|
        @items.create(
          %(<%= render('/blog/archive.*', year: #{year}) %>),
          { title: "Weblog postings from #{year}", kind: 'archive-page', is_hidden: true, description: "All posts written in #{year}" },
          "#{@config[:static_root]}#{@config[:blog][:archives_path]}/#{year}/index.erb",
          binary: false,
        )
      end
    end
  end
end
