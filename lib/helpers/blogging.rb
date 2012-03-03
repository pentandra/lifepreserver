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

  end

end

