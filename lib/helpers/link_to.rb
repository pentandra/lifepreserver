require_relative 'url_shortener'

module LifePreserver
  module LinkTo
    include LifePreserver::UrlShortener

    def link_to_id(id, attributes = {})
      item = @items[id]
      raise ArgumentError, "Could not find item to link to with identifier: #{id}" unless item

      link_to(item[:short_title] || item[:title], item, attributes)
    end

    def public_link_to(text, target, attributes = {})
      # Pull out the global flag
      global = attributes.delete(:global)

      # Join attributes
      attributes = attributes.reduce('') do |memo, (key, value)|
        memo + key.to_s + '="' + h(value) + '" '
      end

      # Create link
      %(<a #{attributes}href="#{h public_path_to(target, global: global)}">#{h text}</a>)
    end

    alias link_to public_link_to

    # Get the public path for an item
    #
    # Separates the concept of a Nanoc build path from a public Web path.
    def public_path_to(target, rep: :default, snapshot: :last, global: false)
      path = case target
             when String
               target
             when Nanoc::ItemWithRepsView, Nanoc::ItemWithoutRepsView
               target.path(rep: rep, snapshot: snapshot)
             when Nanoc::ItemRepView
               target.path(snapshot: snapshot)
             else
               raise ArgumentError, "Cannot link to #{target.inspect} (expected a string or an item, not a #{target.class.name})"
             end

      unless path
        raise "Cannot create a public path to #{target.inspect} because this target is not outputted (its routing rule returns nil)"
      end

      nearest_path = find_nearest_path(@item_rep, @item)
      path = unstack(nearest_path, path) if nearest_path

      if global
        path = @config.fetch(:base_url) + path
      end

      # Remove static root for public path
      path.sub(@config[:static_root], '')
    end

    alias path_to public_path_to

    def short_url_for(item, rep: :default, snapshot: :last)
      shorten(public_path_to(item, rep: rep, snapshot: snapshot, global: true))
    end

    protected

    def unstack(current, target)
      if target.start_with?('/')
        return target
      end

      p = current.gsub(/[^\/]*$/, '') + target
      p = p.gsub(/\/+/, '/')
      p = p.gsub(/[^\/]*\/\.\.\//, '') while (p =~ /\.\.\//)
      p
    end

    def find_nearest_path(*path_items)
      item_with_path = path_items.find { |item| item && item.path }
      item_with_path && item_with_path.path
    end
  end
end
