require 'active_support'
require 'digest/md5'

module Nanoc::Helpers

  module Text

    # Generate a slug for the string +value+.
    #
    # A slug should consist of numbers (0-9), lowercase letters (a-z) and
    # dashes (-). Any other characters should be filtered.
    #
    # From https://github.com/ludo/to_slug and http://github.com/henrik/slugalizer
    #
    # ==== Example
    #
    # "The World is Beautiful!".to_slug # => "the-world-is-beautiful"
    #
    # ==== Returns
    # String:: A 'sluggified' version of this string
    #
    # --
    # @api public
    def to_slug(separator = "-")
      
      separators = %w[- _ +]
      unless separators.include?(separator)
        raise "Word separator must be one of #{separators}"
      end
      
      re_separator = Regexp.escape(separator)
      result = decompose(self.to_s)
      result.gsub!(/[^\x00-\x7F]+/, '')                     # Remove non-ASCII (e.g. diacritics).
      result.gsub!(/[^a-z0-9\-_\+]+/i, separator)           # Turn non-slug chars into the separator.
      result.gsub!(/#{re_separator}{2,}/, separator)        # No more than one of the separator in a row.
      result.gsub!(/^#{re_separator}|#{re_separator}$/, '') # Remove leading/trailing separator.
      result.downcase!
      result
    end

    def md5(text)
      Digest::MD5.hexdigest(text)
    end

    private

    def decompose(text)
      if defined?(ActiveSupport::Multibyte::Handlers)  # Active Support < 2.2
        ActiveSupport::Multibyte::Handlers::UTF8Handler.normalize(text, :kd).to_s
      else  # ActiveSupport 2.2+
        ActiveSupport::Multibyte::Chars.new(text).normalize(:kd).to_s
      end
    end

  end
  
end
