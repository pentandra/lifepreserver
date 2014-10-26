module LifePreserver

  module Team

    include Nanoc::Helpers::Text

    def full_name(member)
      member[:first_name] + " " + member[:last_name]
    end

    def member_path(member)
      if @config[:base_url].nil?
        raise RuntimeError.new('Cannot build member path: site configuration has no base_url')
      end

      @config[:base_url] + "/company#" + full_name(member).to_slug
    end

    def member_image_path(member)
      if @config[:base_url].nil?
        raise RuntimeError.new('Cannot build member image path: site configuration has no base_url')
      end

      @config[:base_url] + "/images/" + full_name(member).to_slug + "-150x150.jpg"
    end

  end

end
