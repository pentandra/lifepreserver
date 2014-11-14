module LifePreserver

  module Team

    include Nanoc::Helpers::Text

    def full_name(member)
      member[:first_name] + " " + member[:last_name]
    end

    def member_path(member)
      "/company/#" + full_name(member).to_slug
    end

    def member_description_path(member)
      "/company/#sec:" + full_name(member).to_slug
    end

    def member_image_path(member)
      "/images/" + full_name(member).to_slug + "-150x150.jpg"
    end

  end

end
