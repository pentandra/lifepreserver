module LifePreserver

  module Filtering

    def simple_filter(item_rep, content, filter_name, arguments = {})

      item_rep = case item_rep
                 when Nanoc::ItemRepView
                   item_rep
                 when Nanoc::ItemWithRepsView
                   item_rep.reps.fetch(:default)
                 else
                   raise ArgumentError, "Cannot filter #{item_rep.inspect} (expected an item rep or an item, not a #{item_rep.class.name})"
                 end

      # Find filter
      klass = Nanoc::Filter.named(filter_name)
      raise Nanoc::Int::Errors::UnknownFilter.new(filter_name) if klass.nil?

      # Create filter
      assigns = {
        item: item_rep.item,
        rep: item_rep,
        item_rep: item_rep,
        items: @items,
        layouts: @layouts,
        config: @config,
        content: item_rep.compiled_content,
      }
      filter = klass.new(assigns)

      # Filter content
      Nanoc::Int::NotificationCenter.post(:filtering_started, item_rep.unwrap, filter_name)
      filtered_content = filter.setup_and_run(content, arguments)
      Nanoc::Int::NotificationCenter.post(:filtering_ended, item_rep.unwrap, filter_name)

      filtered_content
    end

  end

end
