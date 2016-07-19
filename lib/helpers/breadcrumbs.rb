module Breadcrumbs

  def breadcrumbs_trail
    components = @item.identifier.components
    identifiers = (0..components.length - 1).map { |len| len == 0 ? '/index.*' : "/#{components.first(len).join('/')}/index.*" }

    identifiers.map { |id| @items[id] }
  end

end
