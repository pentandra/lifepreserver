# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'yaml'

module LifePreserver
  module DataSources
    class Tags < Nanoc::DataSource
      identifier :tags

      def up
        @tags =
          File.open(@config.fetch(:author_tags)) do |file|
            YAML.safe_load(file.read, filename: file.path, symbolize_names: true)
          end

        if (tag_metadata = @config[:tag_metadata])
          @additional_tag_data =
            File.open(tag_metadata) do |file|
              YAML.safe_load(file.read, filename: file.path, symbolize_names: true)
            end
        end
      end

      def items
        @tags.map do |tag|
          if @additional_tag_data
            tag.update(@additional_tag_data.find { |a| a[:tag] == tag[:tag] } || {})
          end

          tag_to_item(tag)
        end
      end

      protected

      def tag_to_item(tag)
        attributes = {
          kind:      'tag',
          semantic:  tag.key?(:abstract),
          is_hidden: true,
        }

        new_item(
          tag[:tag],
          attributes.merge(tag),
          Nanoc::Identifier.new("/tags/#{tag[:tag].parameterize}"),
          checksum_data: "tag=#{tag[:tag]},uri=#{tag[:uri]},abstract=#{tag[:abstract]}",
        )
      end
    end
  end
end
