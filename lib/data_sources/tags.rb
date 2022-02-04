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

      def tag_to_item(tag)
        dup_tag = tag.dup
        tag_name = dup_tag.delete(:tag)
        abstract = dup_tag.delete(:abstract)
        attributes = {
          title: tag_name,
          description: abstract,
          kind: 'tag',
          is_hidden: true,

          # Page-related metadata
          full_title: "Tag: #{dup_tag.fetch(:label, tag_name)}",
          meta_description: "All pages tagged with '#{tag_name}'",
        }

        new_item(
          '-',
          attributes.merge(dup_tag),
          File.join(File::SEPARATOR, tag_name.parameterize),
          checksum_data: "tag=#{tag_name},uri=#{tag[:uri]},abstract=#{abstract}",
        )
      end
    end
  end
end
