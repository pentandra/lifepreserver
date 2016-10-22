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
        res << tag.raw_content if items_with_tag(tag, items).any?
      end

      res.to_a.freeze
    end

    def tags
      blk = -> { @items.find_all('/_project/tags/*') }
      if @items.frozen?
        @tag_items ||= blk.call
      else
        blk.call
      end
    end

    def sorted_tags
      blk = -> { tags.sort_by { |t| t[:tag] } }
      if @items.frozen?
        @sorted_tag_items ||= blk.call
      else
        blk.call
      end
    end

    # Return true if an item has a specified tag
    def has_tag?(item, tag)
      return false if item[:tags].nil?
      item[:tags].include?(tag.is_a?(String) ? tag : tag.raw_content)
    end

    def items_with_tag(tag, items = nil)
      items = @items if items.nil?
      items.select { |item| has_tag?(item, tag) }
    end

    # Returns a link to the specified tag.
    def link_for_tag(tag, rel_tag: true)
      if tag.is_a?(String)
        tag = @items["/_project/tags/#{tag.to_slug}"]
        raise ArgumentError, "Tag metadata does not yet exist in `etc/tags.yaml` for the tag '#{tag}'. Please add the tag first and then try again." unless tag
      end

      if rel_tag && tag[:semantic]
        %[<a href="#{@config[:blog][:tags_url]}/#{h tag.raw_content.to_slug}/" rel="tag ctag:tagged" resource="##{h tag.raw_content.to_slug('_')}_tag" typeof="ctag:AuthorTag"><link property="ctag:means" resource="#{RDF::URI.new(tag[:uri]).pname}" typeof="#{RDF::URI.new(tag.fetch(:type, RDF::OWL.Thing)).pname}" /><span property="ctag:label">#{h tag.raw_content}</span></a>]
      else
        %[<a href="#{@config[:blog][:tags_url]}/#{h tag.raw_content.to_slug}/"#{" rel=\"tag\"" if rel_tag}>#{h tag.raw_content}</a>]
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

    # Uses the convention by DBpedia that the first sentence of a new paragraph
    # is concatenated to the last sentence of the previous paragraph without a
    # space between.
    def parse_abstract(abstract)
      paragraphs = abstract.split(%r{((?<=[a-z0-9])[.!?]['"]?(?=[A-Z0-9]))})
      paragraphs.reduce(String.new) do |acc, p|
        acc << ( p =~ /^[.!?'"]+$/ ? p + "</p>" : "<p>" + p )
      end
    end

    # Creates in-memory tag pages for a collection of items
    def generate_tag_pages(items = nil)
      items = @items if items.nil?
      tag_set(items).map { |tag| @items["/_project/tags/#{tag.to_slug}"] }.each do |tag|
        @items.create(
          %[<%= render("/blog/tag.*", tag: @items["#{tag.identifier}"]) %>],
          { title: "Tag: #{tag.fetch(:label, tag.raw_content)}", kind: "tag-page", is_hidden: true, description: "All posts having to do with the tag '#{tag.raw_content}'" },
          "#{@config[:blog][:tags_url]}/#{tag.raw_content.to_slug}/index.erb",
          binary: false
        )
      end
    end

  end

end
