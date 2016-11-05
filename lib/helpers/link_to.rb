module LifePreserver

  module LinkTo

    include Filtering

    def absolutify_links(item_rep, content)
      simple_filter(item_rep, content, :absolutify_paths, type: :html, form: :uri)
    end

    def link_to_id(id, attributes = {})
      item = @items[id]
      raise ArgumentError, "Could not find item to link to with identifier: #{id}" unless item

      link_to(item[:short_title] || item[:title], item, attributes)
    end

    def public_link_to(text, target, attributes = {})
      # Join attributes
      attributes = attributes.reduce('') do |memo, (key, value)|
        memo + key.to_s + '="' + h(value) + '" '
      end

      # Create link
      %[<a #{attributes}href="#{h public_path_to(target)}">#{h text}</a>]
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
               raise "Cannot create a link to #{target.inspect} because this target is not outputted (its routing rule returns nil)" if target.path(rep: rep, snapshot: snapshot).nil?
               target.path(rep: rep, snapshot: snapshot)
             when Nanoc::ItemRepView
               raise "Cannot create a link to #{target.inspect} because this target is not outputted (its routing rule returns nil)" if target.path(snapshot: snapshot).nil?
               target.path(snapshot: snapshot)
             else
               raise ArgumentError, "Cannot link to #{target.inspect} (expected a string or an item, not a #{target.class.name})"
             end

      path = unstack(@item_rep.path, path) if @item_rep

      if global
        path = @config[:base_url] + path
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

  end

end
