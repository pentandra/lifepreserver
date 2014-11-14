# from this thread: http://groups.google.com/group/nanoc/browse_thread/thread/caefcab791fd3c4b

module Nanoc::Helpers

  module Tagging

    require 'set'

    SEMANTIC_TAGS = Hash[File.read('semantic_tags').split("\n").map { |i| i.split(': ')}] unless defined?(SEMANTIC_TAGS)

    # Returns all the tags present in a collection of items.
    # There are no duplicates (because this is a set).
    #
    # When called without parameters, all the items are considered.
    def tag_set(items = nil)
      items = @items if items.nil?
      tags = Set.new
      items.each do |item|
        next if item[:tags].nil?
        item[:tags].each { |tag| tags << tag.to_s }
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
      divisor = 1 if divisor == 0

      ranks = {}
      count.keys.each do |t|
        rank = n - 1 - ( count[t] - min) / divisor
        rank = 0 if rank < 0
        ranks[t.to_s] = rank.to_i
      end

      ranks
    end

    # Returns a link to the specified tag.
    #
    # Overrides Nanoc::Helpers::Tagging#link_for_tag, adding support for
    # multi-word tags.
    def link_for_tag(tag, base_url)
      semantic_tag = SEMANTIC_TAGS[tag]

      if semantic_tag
        %[<a href="#{h base_url}#{h tag.to_slug}/" rel="tag ctag:means" typeof="ctag:AuthorTag" resource="#{h semantic_tag}" property="ctag:label">#{h tag}</a>]
      else
        %[<a href="#{h base_url}#{h tag.to_slug}/" rel="tag">#{h tag}</a>]
      end
    end

    # Same as link_for_tag, but does not include the 'rel' attribute.
    #
    # To conform with the HTML5 rel="tag" specification, the rel attribute
    # should apply only to the current document. A tag cloud, by definition,
    # does not apply to the current document only, but is a summary of many
    # documents' tags.
    #
    # See http://microformats.org/wiki/rel-tag
    def link_for_tagcloud(tag, base_url)
      %[<a href="#{h base_url}#{h tag.to_slug}/">#{h tag}</a>]
    end

    def items_with_tag(tag, items=nil)
      items = @items if items.nil?
      items.select { |i| (i[:tags] || []).include?(tag) }
    end

  end

end
