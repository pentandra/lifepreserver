require_relative 'text'

module Company

  include Text

  def full_name(member)
    "#{member[:first_name]} #{member[:last_name]}"
  end

  def member_path(member)
    "#{company[:page_url]}##{full_name(member).to_slug}"
  end

  def member_description_path(member)
    "#{company[:page_url]}/#sec:#{full_name(member).to_slug}"
  end

  def member_image_path(member)
    "#{@config[:site][:images_url]}/#{full_name(member).to_slug}-150x150.jpg"
  end

  def company
    @config[:company]
  end

  def teammember(author_name)
    teammembers = company[:teammembers]
    teammembers.find { |member| full_name(member) == author_name }
  end

  def generate_author_uris(item_set)
    item_set = @items if item_set.nil?

    validate_config

    item_set.each do |item|
      teammember = teammember(item[:author_name]) if item.key?(:author_name)
      if teammember then
        item[:author_uri] ||= "#{@config[:base_url]}#{member_description_path(teammember)}"
      end
    end
  end

  protected

  def validate_config
    if @config[:base_url].nil?
      raise Nanoc::Int::Errors::GenericTrivial.new('Cannot generate author URIs: site configuration has no base_url')
    end
  end

end
