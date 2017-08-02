# frozen_string_literal: true

module LifePreserver
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

    def date_for(item)
      simple_date(item.fetch(:created_at))
    end

    def last_modified_date_for(item)
      simple_date(item.fetch(:updated_at))
    end

    def publication_date_for(item)
      simple_date(item.fetch(:published_at))
    end

    def simple_date(date)
      attribute_to_time(date).strftime('%F')
    end

    def fancy_date(date)
      attribute_to_time(date).strftime('%B %d, %Y')
    end
  end
end
