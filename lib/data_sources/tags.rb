# frozen_string_literal: true

require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/inflections'

Class.new(Nanoc::DataSource) do
  identifier :tags

  def up
    @tags = YAML.load_file(@config.fetch(:author_tags)).map(&:symbolize_keys)

    if (tag_metadata = @config[:tag_metadata])
      @additional_tag_data = YAML.load_file(tag_metadata)
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
    slug = tag[:tag].parameterize

    attributes = {
      kind:      'tag',
      semantic:  tag.key?(:abstract),
      is_hidden: true,
    }

    new_item(
      tag[:tag],
      attributes.merge(tag),
      Nanoc::Identifier.new("/tags/#{slug}"),
      checksum_data: "tag=#{tag[:tag]},uri=#{tag[:uri]},abstract=#{tag[:abstract]}",
    )
  end
end
