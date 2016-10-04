module LifePreserver

  module LinkTo

    include Filtering

    def absolutify(item_rep, content)
      simple_filter(item_rep, content, :absolutify_paths, type: :html, form: :uri)
    end

    def link_to_id(id, attributes = {})
      item = @items[id]
      raise ArgumentError, "Could not find item to link to with identifier: #{id}" unless item

      link_to(item[:short_title] || item[:title], item, attributes)
    end

  end

end
