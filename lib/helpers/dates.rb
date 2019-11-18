# frozen_string_literal: true

require 'date'

module LifePreserver
  module Helpers
    module Dates
      # @param [String, Time, Date, DateTime] arg
      #
      # @return [Time]
      def attribute_to_time(arg)
        case arg
        when DateTime
          arg.to_time
        when Date
          Time.utc(arg.year, arg.month, arg.day)
        when String
          Time.parse(arg)
        else
          arg
        end
      end

      def simple_date(date_sym, item: nil)
        item ||= @item
        strftime(date_sym, format: '%F', item: item)
      end

      def fancy_date(date_sym, item: nil)
        item ||= @item
        strftime(date_sym, format: '%B %d, %Y', item: item)
      end

      def strftime(date_sym, format: '%FT%T%:z', item: nil)
        item ||= @item
        attribute_to_time(item.fetch(date_sym)).strftime(format)
      end

      def iso8601(date_sym, item: nil)
        item ||= @item
        attribute_to_time(@item.fetch(date_sym)).iso8601
      end
    end
  end
end
