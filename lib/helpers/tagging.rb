# frozen_string_literal: true

require 'yaml'
require 'set'
require 'rdf'

module LifePreserver
  module Tagging
    # Returns all the tags present in a collection of items.
    # There are no duplicates (because this is a set).
    #
    # When called without parameters, all the items are considered.
    def tag_set(items = nil)
      items = @items if items.nil?
      res = Set.new

      tags.each do |tag|
        res << tag.unwrap.attributes[:tag] if items_with_tag(tag, items).any?
      end

      res.to_a.freeze
    end

    def tags
      blk = -> { @items.find_all('/lifepreserver/tags/*') }
      if @items.frozen?
        @tag_items ||= blk.call
      else
        blk.call
      end
    end

    def sorted_tags
      blk = -> { tags.sort_by { |t| t.unwrap.attributes[:tag] } }
      if @items.frozen?
        @sorted_tag_items ||= blk.call
      else
        blk.call
      end
    end

    # Return true if an item has a specified tag
    # Does not create a dependency.
    #
    # @param [Nanoc::ItemWithoutRepsView] item the item to check
    # @param [String, Nanoc::ItemWithoutRepsView] tag the tag, either a string or tag item
    #
    # @return true if item is tagged such, otherwise false
    def tag?(item, tag)
      Array(item.unwrap.attributes[:tags]).include?(tag.is_a?(String) ? tag : tag[:tag])
    end

    def items_with_tag(tag, items = nil)
      items = @items if items.nil?
      items.select { |item| tag?(item, tag) }
    end

    # Returns a link to the specified tag.
    def link_for_tag(tag, rel_tag: true)
      if tag.is_a?(String)
        original_tag = tag
        tag = @items["/lifepreserver/tags/#{tag.to_slug}"]
        raise ArgumentError, "Tag metadata does not yet exist in `etc/tags.yaml` for the tag '#{original_tag}'. Please add the tag first and then try again." unless tag
      end

      if rel_tag && tag[:semantic]
        %(<a href="#{@config[:blog][:tags_url]}/#{h tag[:tag].to_slug}/" rel="tag ctag:tagged" resource="##{h tag[:tag].to_slug('_')}_tag" typeof="ctag:AuthorTag"><link property="ctag:means" resource="#{RDF::URI.new(tag[:uri]).pname}" typeof="#{RDF::URI.new(tag.fetch(:type, RDF::OWL.Thing)).pname}" /><span property="ctag:label">#{h tag[:tag]}</span></a>)
      else
        %(<a href="#{@config[:blog][:tags_url]}/#{h tag[:tag].to_slug}/"#{' rel="tag"' if rel_tag}>#{h tag[:tag]}</a>)
      end
    end

    # Same as link_for_tag, but does not include the `@rel` attribute.
    #
    # To conform with the HTML5 rel="tag" specification, the rel attribute
    # should apply only to the current document. A tag cloud, by definition,
    # does not apply to the current document only, but is a summary of many
    # documents' tags.
    #
    # See http://microformats.org/wiki/rel-tag
    def link_for_tagcloud(tag)
      link_for_tag(tag, rel_tag: false)
    end

    # Creates in-memory tag pages for a collection of items
    def generate_tag_pages(items = nil)
      items = @items if items.nil?
      tag_set(items).map { |tag_name| @items["/lifepreserver/tags/#{tag_name.to_slug}"] }.each do |tag|
        @items.create(
          %(<%= render('/blog/tag.*', tag: @items['#{tag.identifier}']) %>),
          { title: "Tag: #{tag.fetch(:label, tag[:tag])}", kind: 'tag-page', is_hidden: true, description: "All posts having to do with the tag '#{tag[:tag]}'" },
          "#{@config[:static_root]}#{@config[:blog][:tags_url]}/#{tag[:tag].to_slug}/index.erb",
          binary: false,
        )
      end
    end
  end
end
