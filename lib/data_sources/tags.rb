require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/inflections'

Class.new(Nanoc::DataSource) do
  identifier :tags

  def up
    @tags = YAML.load_file('etc/tags.yaml').map(&:symbolize_keys)
    @additional_tag_data = YAML.load_file('var/additional_tag_data.yaml')
  end

  def items
    items = []
    
    @tags.each do |tag|
      tag.update(@additional_tag_data.find { |a| a[:tag] == tag[:tag] } || {})
      items << tag_to_item(tag)
    end

    items
  end

  protected

  def tag_to_item(tag)
    slug = tag[:tag].parameterize

    attributes = {
      kind:      'tag',
      semantic:  tag.key?(:abstract),
      is_hidden: true
    }

    new_item(
      tag[:tag],
      attributes.merge(tag),
      Nanoc::Identifier.new("/tags/#{slug}"),
      checksum_data: "tag=#{tag[:tag]},uri=#{tag[:uri]},abstract=#{tag[:abstract]}"
    )
  end

end
