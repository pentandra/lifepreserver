# Extend Item

class Nanoc3::Item
  def name
    identifier.split("/").last
  end

  def slug
    self.name.downcase
  end
end
