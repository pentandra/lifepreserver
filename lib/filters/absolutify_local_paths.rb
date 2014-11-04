module Nanoc::Filters

  # This filter changes local src or href paths to absolute paths.
  #
  # This is convenient for blog articles, since we include all article-specific
  # media in the article directory.
  class AbsolutifyLocalPaths < Nanoc::Filter

    identifiers :absolutify_local_paths

    def run(content, arguments={})

      # Set assigns so helper function can be used
      @item_rep = assigns[:item_rep] if @item_rep.nil?

      require 'nokogiri'

      # Parse
      doc = Nokogiri::HTML(content)

      # Find all hyperlinks
      doc.xpath("//*[@src]", "//*[@href]").each do |element|
        targetAttribute = element.matches?("a") ? "href" : "src"
          
        target = element[targetAttribute]
        next if target.nil? || is_not_local(target)

        # Add the item path to the target
        element[targetAttribute] = @item_rep.path + target
      end

      # Done
      doc.to_html
    end

    private

    # Right now only check to see whether it contains a slash
    def is_not_local(path)
      return path =~ /\//
    end

  end

end

