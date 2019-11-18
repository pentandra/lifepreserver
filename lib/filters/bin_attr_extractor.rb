# frozen_string_literal: true

module LifePreserver
  module Filters
    class BinaryAttributeExtractor < Nanoc::Filter
      identifier :bin_attr_extractor
      type :text => :binary

      # Extracts a binary attribute from an textual item and writes it to file.
      #
      # @param [String] _content Ignored. All binary data are pulled from the
      #   current item's attributes.
      # @param [Hash] params The options for the filter.
      # @option params [String, Symbol] :bin_attr (:jpegphoto) The name of the
      #   binary attribute to extract and save to file.
      def run(_content, params = {})
        bin_attr = params.fetch(:bin_attr, :jpegphoto)
        File.binwrite(output_filename, @item[bin_attr.to_sym])
      end
    end
  end
end
