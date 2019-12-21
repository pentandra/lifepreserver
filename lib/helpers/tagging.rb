# frozen_string_literal: true

require 'yaml'
require 'set'
require 'rdf'

require_relative 'link_to'

module LifePreserver
  module Helpers
    module Tagging
      include LinkTo

      # Returns all the tags present in a collection of items.
      #
      # @note There are no duplicates (because the underlying storage is a
      #   {Set}).
      #
      # @param items [Array<Nanoc::Core::BasicItemView>, nil] The items from
      #   which to gather tags. When nil, all items are considered.
      #
      # @return [Array<String>] The tags present in the given collection.
      def tag_set(items = nil)
        items = @items if items.nil?
        res = Set.new

        tags.each do |tag|
          res << tag._unwrap.attributes[:name] if items_with_tag(tag, items).any?
        end

        res.to_a.freeze
      end

      # @return [Array<Nanoc::Core::BasicItemView>] All tag items.
      def tags
        @items.find_all(File.join(@config[:tags_root], '*'))
      end

      # @return [Array<Nanoc::Core::BasicItemView>] All tag items, in
      #   tag-alphabetical order.
      def sorted_tags
        tags.sort_by { |t| t._unwrap.attributes[:name] }
      end

      # Return true if an item has the specified tag.
      #
      # @param item [Nanoc::Core::BasicItemView] The item to check.
      # @param tag [String, Nanoc::Core::BasicItemView] The tag or tag item.
      #
      # @return [Boolean] True if item is tagged such, otherwise false.
      def tag?(item, tag)
        Array(item._unwrap.attributes[:tags]).include?(tag.is_a?(String) ? tag : tag[:name])
      end

      # Find all items with the given tag.
      #
      # @param tag [String] The tag to select by.
      #
      # @param items [Array<Nanoc::Core::BasicItemView>, nil] The item
      #   collection in which to search for the given tag. When nil, all items
      #   are considered.
      #
      # @return [Array<Nanoc::Core::BasicItemView>] All items of the given
      #   items with the given tag.
      def items_with_tag(tag, items = nil)
        items = @items if items.nil?
        Array(items).select { |item| tag?(item, tag) }
      end

      # Returns a hyperlink to the page for the specified tag.
      #
      # @param tag [Nanoc::Core::BasicItemView, String] The tag or tag item.
      #
      # @param rel_tag [Boolean] Whether or not to include the HTML +rel+
      #   attribute with the value of "tag" with the link.
      #
      # @param absolute [Boolean] Whether or not to use an absolute path to the
      #   tag page.
      #
      # @return [String] A hyperlink for the given tag.
      def link_for_tag(tag, rel_tag: true, absolute: false)
        if tag.is_a?(String)
          tag_string = tag
          tag = @items[File.join(@config[:tags_root], tag.parameterize)]

          unless tag
            raise ArgumentError, "Could not create link for '#{tag_string}': the tag does not exist in the metadata file `etc/tags.yaml`."
          end
        end

        if rel_tag && tag[:uri]
          %(<a href="#{path_to(tag, absolute: absolute)}" rel="tag ctag:tagged" resource="##{h tag[:name].parameterize(separator: '_')}_tag" typeof="ctag:AuthorTag"><link property="ctag:means" resource="#{RDF::URI.new(tag[:uri]).pname}" typeof="#{RDF::URI.new(tag.fetch(:type, RDF::OWL.Thing)).pname}" /><span property="ctag:label">#{h tag[:name]}</span></a>)
        else
          %(<a href="#{path_to(tag, absolute: absolute)}"#{' rel="tag"' if rel_tag}>#{h tag[:name]}</a>)
        end
      end

      # Same as {#link_for_tag}, without the `@rel` attribute.
      #
      # @note To conform with the HTML5 rel="tag" specification, the rel
      #   attribute should apply only to the current document. A tag cloud, by
      #   definition, does not apply to the current document only, but is a
      #   summary of many documents' tags.
      #
      # @param absolute [Boolean] Whether or not to use an absolute path to the
      #   tag page.
      #
      # See http://microformats.org/wiki/rel-tag
      def link_for_tagcloud(tag, absolute: false)
        link_for_tag(tag, rel_tag: false, absolute: absolute)
      end
    end
  end
end
