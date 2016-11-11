require 'active_support/core_ext/string/inflections'

Class.new(Nanoc::DataSource) do
  identifier :dependencies

  def items
    items = []

    groups(Bundler.environment).each do |group_name, dependencies|
      dependencies.each do |dependency|
        items << gem_to_item(dependency.to_spec, group_name.to_s)
      end
    end

    items
  end

  protected

  def gem_to_item(gem, group_name)
    slug = gem.name.parameterize
    new_item(
      '-',
      {
        kind:      'dependency',
        name:      gem.name,
        summary:   gem.summary,
        homepage:  gem.homepage,
        version:   gem.version.to_s,
        group:     group_name,
        is_hidden: true
      },
      Nanoc::Identifier.new("/dependencies/#{group_name}/#{slug}"),
      checksum_data: "name=#{gem.name},version=#{gem.version},group=#{group_name}")
  end

  def groups(env)
    relations = Hash.new { |h, k| h[k] = Set.new }
    env.current_dependencies.each do |dependency|
      dependency.groups.each do |group|
        relations[group.to_s].add(dependency)
      end
    end
    relations
  end
end
