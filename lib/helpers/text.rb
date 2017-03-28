require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/array/conversions'
require 'digest/md5'

module LifePreserver
  module Text
    def to_slug(separator = '-')
      self.to_s.parameterize(separator: separator)
    end

    def to_sentence(options = {})
      Array(self).to_sentence(options)
    end

    def md5(text)
      Digest::MD5.hexdigest(text)
    end

    def ndashed(string)
      string.to_s.gsub('-', '<span class="ndash">--</span>')
    end
  end
end
