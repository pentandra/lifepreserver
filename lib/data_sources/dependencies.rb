require 'active_support/core_ext/string/inflections'

Class.new(Nanoc::DataSource) do
  identifier :dependencies

  def items
    items = []

    Bundler.rubygems.all_specs.each do |gem|
      items << gem_to_item(gem)
    end

    items
  end

  protected

  def gem_to_item(gem)
    slug = gem.name.parameterize
    new_item(
      '-',
      {
               type: 'dependency',
               name: gem.name,
            summary: gem.summary,
        description: gem.description,
           homepage: gem.homepage,
            version: gem.version.to_s,
          is_hidden: true
      },
      Nanoc::Identifier.new("/_#{slug}"))
  end

end
