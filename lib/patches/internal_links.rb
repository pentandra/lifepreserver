require 'uri'

module Nanoc::Extra::Checking::Checks
  class InternalLinks < ::Nanoc::Extra::Checking::Check

    protected

		# Override to compensate for static_path
    def valid?(href, origin)
			# Skip hrefs that point to self
      # FIXME: this is ugly and won’t always be correct
      return true if href == '.'

      # Skip hrefs that are specified in the exclude configuration
      return true if excluded?(href, origin)

      # Remove target
      path = href.sub(/#.*$/, '')
      return true if path.empty?

      # Remove query string
      path = path.sub(/\?.*$/, '')
      return true if path.empty?

      # Decode URL (e.g. '%20' -> ' ')
      path = URI.unescape(path)

      # Prepend the static_root, since the items that we are checking are static
      path = @config[:static_root] + path

      # Make absolute
      path =
        if path[0, 1] == '/'
          @config[:output_dir] + path
        else
          ::File.expand_path(path, ::File.dirname(origin))
        end

      # Check whether file exists
      return true if File.file?(path)

      # Check whether directory with index file exists
      return true if File.directory?(path) && @config[:index_filenames].any? { |fn| File.file?(File.join(path, fn)) }

      # Nope :(
      false
    end
  end
end
