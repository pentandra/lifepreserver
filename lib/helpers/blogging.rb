require 'uri'

module Nanoc::Helpers

  module Blogging

    include Nanoc::Helpers::Text

    # Relies upon Rules preprocessing to set the `:is_hidden` attribute.
    def published_articles
      sorted_articles.reject { |a| a[:is_hidden] }
    end

    def authors(articles = nil)
      articles = @articles if articles.nil?
      authors = Set.new
      articles.each do |article|
        next if article[:author_name].nil?
        authors << article[:author_name].to_s
      end
      authors.to_a
    end

    #
    # Create a link for the author of this page
    #
    def link_for_author(author)
      %[<a rel="author" href="#{@config[:blog][:authors_url]}/#{h author.to_slug}/" title="More articles by #{h author}">#{h author}</a>]
    end

    def link_for_an_author(author)
      %[<a href="#{@config[:blog][:authors_url]}/#{h author.to_slug}/" title="Articles by #{h author}">#{h author}</a>]
    end

    def articles_by_author(articles, author)
      articles.select { |item| item[:author_name] == author }
    end

    def articles_by_year(articles, year)
      articles.select { |item| item[:created_at].year == year }
    end

    def link_for_archive(year)
      %[<a rel="archives" href="#{@config[:blog][:archives_url]}/#{h year.to_s}/" title="Articles written in #{h year.to_s}">#{h year.to_s}</a>]
    end

    def archive_years(articles = nil)
      articles = @articles if articles.nil?
      years = articles.map { |a| a[:created_at].year }.uniq
      years.to_a
    end

    def date_for(article)
      article[:created_at].to_s.gsub(/-/, '<span class="ndash">--</span>')
    end

    # Nanoc helper to display blog post summary and a link to the full post.
    # Used inside <% sorted_articles.each do |item| %>...<% end %> block etc.
    #
    # From https://gist.github.com/3134795
    #
    # @example Put the following in your layout:
    #
    #    <%= article_summary(item,'Read the full article>>') %>
    #
    # To customize the link text you can add 'read_more' attribute to your
    # item metadata or pass the string to the helper, as above.
    #
    # Add <!--MORE--> separator somewhere in your item to split it. Otherwise
    # the full article text is displayed.
    #
    # @param [String] item The blog post
    #
    # @param [String] read_more_text The 'Read more →' text
    #
    # @param [String] separator Separates item summary from item body. Defaults to <!--MORE-->
    #
    def article_summary(article, read_more_text="Read more ⇢", separator="<!--MORE-->")
      summary,body = article.compiled_content.split(separator)
      return article.compiled_content unless body
      link = link_to( (article[:read_more] || read_more_text), article.path, class: 'readmore', title: "Read the full article" )
      return summary + "<p class=\"readmore\">#{link}</p>"
    end

    def article_id(article)
      article[:article_id] || md5(article[:title].to_slug)
    end

    # Creates in-memory author pages from partial: layouts/author.html
    def generate_author_pages(item_set)
      authors(item_set).each do |author|
        @items.create(
          "<%= render('/blog/author.*', author: '#{author}') %>",
          { title: "Articles by #{author}", kind: 'author-page', is_hidden: true, description: "All posts written by #{author}" },
          @config[:blog][:authors_url] + "/#{author.to_slug}/index.erb",
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
          "<%= render('/blog/archive.*', year: #{year}) %>",
          { title: "Articles from #{year}", kind: 'archive-page', is_hidden: true, description: "All posts written in #{year}" },
          @config[:blog][:archives_url] + "/#{year}/index.erb",
          binary: false
        )
      end
    end

    def sharer_for(item)
      url = shorten(url_for(item))
      text = URI.escape(item[:title])
      desc = URI.escape(item[:description]) if item.key?(:description)
      tags = URI.escape(Array(item[:tags]).join(','))

      { url: url, text: text, desc: desc, tags: tags }
    end

  end

end
