# frozen_string_literal: true

preprocess do
  @config[:google_api_key] = ENV.fetch('LIFEPRESERVER_API_KEY', false)
  @config[:nanoc_version] = Nanoc::VERSION

  validate_version_history

  def mark_items_as_hidden_that_should_be_hidden
    hidden_predicates = [
      ->(item) { @config[:production] ? syndicated?(item) && item[:published_at].nil? : false },
      ->(item) { item.identifier.exts.include?('js') },
      ->(item) { item.identifier.ext =~ /css/ },
      ->(item) { item.identifier =~ %r{^/static/assets/components/} },
      ->(item) { item.identifier =~ /(README|LICENSE)/ },
      ->(item) { item.identifier.ext =~ /conf/ },
      ->(item) { item.identifier.ext =~ /ya?ml/ },
    ]

    should_be_hidden = disjoin(*hidden_predicates)

    @items.each { |item| item[:is_hidden] = true if should_be_hidden.call(item) }
  end

  def include_analytics
    @items.each { |item| item[:endbody] = Array(item[:endbody]) << 'analytics' }
  end

  def include_video_partials_when_has_media
    @items.select { |item| item.key?(:has_media) }.each do |item|
      item[:head] = Array(item[:head]) << 'video_styles'
      item[:endbody] = Array(item[:endbody]) << 'video_scripts'
    end
  end

  # We don't want anything nanoc specific in the spec folder, so have to use
  # some trickery to get the information we need for searches.
  def extract_metadata_from_specification_documents
    require 'nokogiri'

    @items.select { |item| item.identifier =~ %r{^/static/solutions/specifications/} }.each do |item|
      case item.identifier.ext
      when 'html'
        doc = Nokogiri::HTML(item.raw_content)
        item[:title] ||= doc.title
        item[:description] ||= doc.xpath('//meta[@name="description"]/@content').map(&:value).first
      else
        item[:is_hidden_from_human_search] = true
      end
    end
  end

  populate_author_uris(weblog)

  # Add feed items for members with content
  members.filter { |m| authors.include?(m[:name]) }.each do |member|
    feed_content = "<%= render('/personal_feed.erb', member_name: @item[:member_name]) %>"
    feed_attributes = {
      title: "Personal feed for #{member.fetch(:name)}",
      member_name: member.fetch(:name),
      is_hidden_from_human_search: true,
      kind: 'feed',
      created_at: member.attributes.fetch(:created_at),
    }
    feed_id = File.join(member.identifier, 'feed')

    @items.create(feed_content, feed_attributes, feed_id)
  end

  if @config.dig(:site, :generate_meta)
    generate_blog_archives
  end

  mark_items_as_hidden_that_should_be_hidden

  include_analytics if @config[:google_analytics]
  include_video_partials_when_has_media

  extract_metadata_from_specification_documents
end
