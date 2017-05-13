require_relative 'link_to'
require_relative 'blogging'

module LifePreserver
  module Articles
    include LinkTo
    include Blogging

    def article?(item)
      item[:kind] == 'article' || blog_post?(item)
    end

    def articles
      blk = -> { @items.find_all('/static/articles/**/*.md') }
      if @items.frozen?
        @article_items ||= blk.call
      else
        blk.call
      end
    end

    def sorted_articles
      blk = -> { articles.sort_by { |a| attribute_to_time(a.unwrap.attributes[:created_at]) }.reverse }
      if @items.frozen?
        @sorted_article_items ||= blk.call
      else
        blk.call
      end
    end

    # Relies upon Rules preprocessing to set the `:is_hidden` attribute.
    def published_articles
      blk = -> { sorted_articles.reject { |a| a.unwrap.attributes[:is_hidden] } }
      if @items.frozen?
        @published_article_items ||= blk.call
      else
        blk.call
      end
    end
  end
end
