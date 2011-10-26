# from this thread: http://groups.google.com/group/nanoc/browse_thread/thread/caefcab791fd3c4b

module Nanoc::Helpers

  module Tagging

    require 'set'

    # Returns all the tags present in a collection of items.
    # There are no duplicates (because this is a set).
    #
    # When called without parameters, all the items are considered.
    def tag_set(items = nil)
      items = @items if items.nil?
      tags = Set.new
      items.each do |post|
        next if post[:tags].nil?
        post[:tags].each { |tag| tags << tag }
      end
      tags.to_a
    end

    # Return true if an item has a specified tag
    def has_tag?(item, tag)
      return false if item[:tags].nil?
      item[:tags].include? tag
    end

    # Count the tags in a given collection of items.
    # By default, the method counts tags in all items.
    #
    # The result is a hash such as: { tag => count }.
    def count_tags(items=nil)
      items = @items if items.nil?
      count = Hash.new( 0 )
      items.each do |item|
        if item[:tags]
          item[:tags].each do |tag|
            count[ tag ] += 1
          end
        end
      end
      count
    end

    # Sort the tags of an item collection (defaults to all items for the
    # site) in 'n' classes of rank. The rank 0 corresponds to the most frequent
    # tags. The rank 'n-1' to the least frequent.
    #
    # The result is a hash such as: { tag => rank }.
    def rank_tags(n, items=nil)
      items = @items if items.nil?
      count = count_tags( items )

      max, min = 0, items.size
      count.keys.each do |t|
        max = count[t] if count[t] > max
        min = count[t] if count[t] < min
      end

      divisor = ( ( max.to_f - min ) / n )

      ranks = {}
      count.keys.each do |t|
        rank = n - 1 - ( count[t] - min) /divisor
        rank = 0 if rank < 0
        ranks[t] = rank.to_i
      end

      ranks
    end

    # Creates in-memory tag pages from partial: layouts/tag_page.html
    def create_tag_pages
      tag_set(items).each do |tag|
        items << Nanoc3::Item.new(
          "= render('tag_page',  :tag => '#{tag}')",
          { :title => "Tag: #{tag}" },
          "/tags/#{tag}/",
          :binary => false
        )
      end
    end

  end

end
