# Extend Item

class Nanoc3::Item

  def name
    identifier.split("/").last
  end

  def slug
    self.name.downcase
  end

  def is_article?
    self[:kind] == 'article'
  end

end
