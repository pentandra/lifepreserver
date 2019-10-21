# frozen_string_literal: true

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
      @items.find_all('/static/articles/**/*.md')
    end

    def sorted_articles
      articles.sort_by { |a| attribute_to_time(a._unwrap.attributes[:created_at]) }.reverse
    end

    # Relies upon Rules preprocessing to set the `:is_hidden` attribute.
    def published_articles
      sorted_articles.reject { |a| a._unwrap.attributes[:is_hidden] }
    end
  end
end
