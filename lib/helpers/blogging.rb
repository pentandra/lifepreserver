module Nanoc::Helpers

  module Blogging

    def publishing_articles
      if $include_drafts then
        sorted_articles
      else
        sorted_articles.select { |a| a[:published] }
      end
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

    def link_for_author(author, base_url)
      %[<a href="#{h base_url}#{h author.to_slug}/" rel="author" title="Articles by #{h author}">#{h author}</a>]  
    end

    def articles_by_author(author)
      publishing_articles.select { |i| i[:author_name] == author }
    end

    def articles_for_year(year)
      publishing_articles.select { |i| i[:created_at].year == year }
    end

    def link_for_archive(year, base_url)
      %[<a href="#{h base_url}#{h year.to_s}/" title="Articles written in #{h year.to_s}">#{h year.to_s}</a>]
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
    # @param [String] read_more_text The 'Read more...' text
    #
    # @param [String] separator Separates item summary from item body. Defaults to <!--MORE-->
    # 
    def article_summary(article, read_more_text="Read more...", separator="<!--MORE-->")
      summary,body = article.compiled_content.split(separator)
      return article.compiled_content unless body
      link = link_to( (article[:read_more] || read_more_text), article.path, { :class => 'readmore', :title => "Read the full article" })
      return summary+"<p class=\"readmore\">#{link}</p>"
    end

  end

end

