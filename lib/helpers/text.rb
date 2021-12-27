# frozen_string_literal: true

# HACK: temporary fix for: https://github.com/rails/rails/issues/43851
require 'active_support/isolated_execution_state'

require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/array/conversions'
require 'phonelib'

module LifePreserver
  module Helpers
    module Text
      module StringExtensions
        def ndashed(type: :html)
          to_s.gsub('-', type == :html ? '<span class="ndash">--</span>' : '--')
        end

        def possessive
          "#{self}'#{'s' unless to_s.end_with?('s')}"
        end

        # Format the telephone number according to the method in the given format.
        #
        # @param [Symbol] format (:e164) The symbol of the Phonelib formatting
        #   method to call, e.g. :international, :national, :area_code,
        #   :local_number, :extension, :full_e164, or :full_international.
        def strftel(format = :e164)
          Phonelib.parse(to_s).method(format.to_sym).call
        end
      end

      # Uses the convention by DBpedia that the first sentence of a new paragraph
      # is concatenated to the last sentence of the previous paragraph without a
      # space between.
      def parse_abstract(abstract)
        paragraphs = abstract.scan(/.+?(?<=[[[:lower:]][[:digit:]]\)'"])[\.!\?]['"]?(?:(?=[[[:upper:]][[:digit:]]])|\z)/)
        paragraphs.map { |p| "<p>#{p.strip}</p>\n" }.join
      end
    end
  end
end

class String
  include LifePreserver::Helpers::Text::StringExtensions
end
