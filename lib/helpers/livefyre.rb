require 'livefyre'

module LF

  include Nanoc::Helpers::Blogging
  include Nanoc::Helpers::Tagging

  def collection_meta_token_for(item, type)
    livefyre_network = Livefyre.get_network($livefyre_network_name, $livefyre_network_key)
    livefyre_site = livefyre_network.get_site($livefyre_site_id, $livefyre_site_key)

    meta_token = livefyre_site.build_collection_meta_token(item[:title], article_id(item), url_for(item), livefyre_tags_for(item), type)
    meta_token
  end

  def collection_checksum_for(item)
    livefyre_network = Livefyre.get_network($livefyre_network_name, $livefyre_network_key)
    livefyre_site = livefyre_network.get_site($livefyre_site_id, $livefyre_site_key)

    checksum = livefyre_site.build_checksum(item[:title], url_for(item), livefyre_tags_for(item))
    checksum
  end

  def livefyre_tags_for(item)
    if item[:tags].nil? || item[:tags].empty?
      ""
    else
      item[:tags].map { |tag| tag.gsub(/[[:space:]]+/, '_') }.join(',')
    end
  end

end