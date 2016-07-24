module Nanoc::Helpers

  module LinkTo

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

      if @config[:base_url].nil?
        raise Nanoc::Errors::GenericTrivial.new('Cannot build absolute path: site configuration has no base_url')
      end

      # Find path
      if target.is_a?(String)
        path = target
      else
        path = target.path
        if path.nil?
          raise "Cannot get the absolute path to #{target.inspect} because this target is not outputted (its routing rule returns nil)"
        end
      end

      absolute_path = unstack(item.path, path)
      absolute_path = @config[:base_url] + absolute_path

      absolute_path
    end

    def absolutify(item, content)
      content.gsub(/(<[^>]+\s+(src|href))=(['"]?)([^:]*?)\3([ >])/) do
        $1 + '=' + $3 + absolute_path_to(item, $4) + $3 + $5
      end
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

  end

end
