require 'active_support'
require 'digest/md5'

module LifePreserver
  module Text
    def to_slug(separator = '-')
      ActiveSupport::Inflector.parameterize(self, separator: separator)
    end

    def md5(text)
      Digest::MD5.hexdigest(text)
    end

    def ndashed(string)
      string.gsub('-', '<span class="ndash">--</span>')
    end
  end
end
