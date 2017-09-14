# frozen_string_literal: true

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

    def ndashed(string, type: :html)
      string.to_s.gsub('-', type == :html ? '<span class="ndash">--</span>': '--')
    end

    # Uses the convention by DBpedia that the first sentence of a new paragraph
    # is concatenated to the last sentence of the previous paragraph without a
    # space between.
    def parse_abstract(abstract)
      paragraphs = abstract.split(/((?<=[a-z0-9])[.!?]['"]?(?=[A-Z0-9]))/)
      paragraphs.reduce(String.new) do |acc, p|
        acc << (p =~ /^[.!?'"]+$/ ? p + '</p>' : '<p>' + p)
      end
    end
  end
end
