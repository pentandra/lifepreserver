module Nanoc3::Helpers

  module Blogging

    def publishing_articles
      if $include_drafts then
        sorted_articles
      else
        sorted_articles.select { |a| a[:published] }
      end
    end

  end

end

