module Team

  def full_name(member)
    member[:first_name] + " " + member[:last_name]
  end

  def image_path(member)
    "/images/" + full_name(member).to_slug + "-150x150.jpg"
  end

end
