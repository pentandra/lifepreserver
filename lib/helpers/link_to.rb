module Nanoc::Helpers

  module LinkTo

    def absolutify(item, content)
      validate_config

      content.gsub(/(<[^>]+\s+(src|href))=(['"]?)((?!.*http[s]?:).*?)\3([ \/>])/) do
        $1 + '=' + $3 + absolute_path_to(item, $4) + $3 + $5
      end
    end

    def link_to_id(id)
      item = @items[id]
      raise ArgumentError, "Could not find item to link to with identifier: #{id}" unless item

      link_to(item[:short_title] || item[:title], item)
    end

    protected

    def unstack(current, target)
      if target =~ /^\//
        return target
      end

      # Take off the end "file" and add the target
      p = current.gsub(/[^\/]*$/, '') + target
      # Remove multiple slashes
      p = p.gsub(/\/+/, '/')
      # Remove relative paths
      p = p.gsub(/[^\/]*\/\.\.\//, '') while (p =~ /\.\.\//)
      p
    end

    # Returns the absolute path for the given path or item representation. The
    # returned path will not be HTML-escaped. The `:base_url` from the site
    # configuration is used in assembling the path.
    #
    # Some of this comes from https://gist.github.com/1597618, particularly the
    # regexes.
    #
    # @param [String, Nanoc::Item, Nanoc::ItemRep] target The path/URL, item or
    # item representation to which the absolute path should be generated
    #
    # @return [String] The absolute path to the target
    def absolute_path_to(item, target)

      path = target.is_a?(String) ? target : target.path

      if path.nil?
        raise "Cannot get the absolute path to #{target.inspect} because this target is not outputted (its routing rule returns nil)"
      end

      @config[:base_url] + unstack(item.path, path)
    end

    def validate_config
      if @config[:base_url].nil?
        raise Nanoc::Int::Errors::GenericTrivial.new('Cannot build absolute path: site configuration has no base_url')
      end
    end

  end

end
