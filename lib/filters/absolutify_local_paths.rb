require 'nokogiri'

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

      # Parse
      doc = Nokogiri::HTML.fragment(content)

      attributes_to_check = ['src', 'href']

      # Find all src, href, and resource attributes
      doc.xpath("descendant::*[@src]", "descendant::*[@href]").each do |element|
        element.attributes.select { |k,v| attributes_to_check.include?(k) }.each do |attribute_name, attribute|
          
          target = attribute.content
          next if target.nil? || is_not_local(target)

          # Add the item path to the target
          element[attribute_name] = @item_rep.path + target
        end
      end

      # Done
      doc.to_s
    end

    private

    # Right now only check to see whether it contains a slash
    def is_not_local(path)
      return path =~ /\//
    end

  end

end
