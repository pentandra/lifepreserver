# frozen_string_literal: true

require 'date'
require 'time'

require 'active_support/core_ext/date/conversions'
require 'active_support/core_ext/time/conversions'
require 'active_support/core_ext/date_time/conversions'

::Date::DATE_FORMATS[:date] = '%F'
::Time::DATE_FORMATS[:date] = '%F'

module LifePreserver
  module Helpers
    # Helpers that have to do with dates and times.
    module Dates
      # Requests the most fitting representation of a time or date based
      # attribute. Specifies a time form for when the argument represents a
      # time. Unless a +Time+ is specifically prescribed, indiscriminately
      # converting a +Date+ to a +Time+ can be overly specific in situations
      # when either a date or a time will do.
      #
      # @param arg (see #attribute_to_time)
      # @param form_if_time [:utc, :local] The desired time form if the +arg+
      #   represents a time.
      #
      # @return [Date, Time]
      def date_or_time(arg, form_if_time: :utc)
        arg.instance_of?(Date) ? arg : attribute_to_time(arg, form: form_if_time)
      end

      # Unequivocally converts the given argument to an instance of the +Time+
      # class. Useful for situations and outputs that require uniform
      # representations of time and time zones when we are dealing with a
      # mixture of +Date+, +Time+, and possibly +String+ or +DateTime+
      # instances.
      #
      # @see file:METADATA.md#Relating_to_document_state Time-specific metadata
      #   relating to item state.
      #
      # @note Converts +Date+ arguments to the time at the beginning of the day
      #   it represents (i.e. at T = 00:00:00) to avoid conversions that would
      #   result in a different date due to local offsets.
      #
      # @param arg [String, Time, Date, DateTime] A value representing a date
      #   or time.
      # @param form [:utc, :local] The form of time desired as output. +:utc+
      #   is the default reference point. +:local+ returns the time in the
      #   timezone of the current Ruby process.
      #
      # @todo Return the application time zone when +:local+ form is desired
      #   instead of the process time zone.
      #
      # @return [Time] The time in the given form.
      def attribute_to_time(arg, form: :utc)
        time =
          case arg
          when DateTime
            arg.to_time
          when Date
            arg.to_time(form)
          when String
            Time.parse(arg)
          else
            arg
          end

        if time
          form == :utc ? time.getutc : time.to_time
        end
      end
    end
  end
end
