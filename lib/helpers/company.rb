# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'

require_relative 'link_to'

module LifePreserver
  module Helpers
    module Company
      include LinkTo

      # Fetch all attributes of the company item.
      #
      # @see DataSources::Company
      #
      # @return [Hash] The attributes of the company item.
      def company
        company_id = File.join(@config[:company_root],
                               @config[:orgs_root],
                               @config.dig(:site, :name).to_s.parameterize)

        @items[company_id].attributes
      end

      # Fetch the path to the company logo.
      #
      # @note Requires the identifier for the company logo item to end in
      #   +-logo.png+.
      #
      # @param absolute [Boolean] Whether or not to return an absolute path.
      #
      # @return [String] The outputted path to the logo.
      def path_to_logo(absolute: false)
        logo_id =
          File.join(@config[:static_root].to_s,
                    @config[:images_root],
                    @config.dig(:site, :name).to_s.parameterize + '-logo.png')

        path_to(@items[logo_id], absolute: absolute)
      end

      # Fetch the path to the company logotype.
      #
      # @note Requires the identifier for the company logotype item to end in
      #   +-logotype.png+.
      #
      # @param absolute [Boolean] Whether or not to return an absolute path.
      #
      # @return [String] The outputted path to the logotype.
      def path_to_logotype(absolute: false)
        logotype_id =
          File.join(@config[:static_root].to_s,
                    @config[:images_root],
                    @config.dig(:site, :name).to_s.parameterize + '-logotype.png')

        path_to(@items[logotype_id], absolute: absolute)
      end

      # Grab all members.
      #
      # @return [Array<Nanoc::Core::CompilationItemView>] All member items.
      def members
        @items.find_all(File.join(@config[:company_root], @config[:people_root], '*'))
      end

      # Grab all members, sorted first by surname then given name.
      #
      # @return [Array<Nanoc::Core::CompilationItemView>] All member items, sorted.
      def sorted_members
        members.sort_by { |member| [member[:sn], member[:givenname]] }
      end

      # @return [Boolean] True if a member of the company, false if not.
      def member?(member)
        members.member?(member)
      end

      def member_by_name(name)
        members.find { |member| member.fetch(:name) == name }
      end

      def service_profile(profile_class, item = nil)
        item ||= company
        item.fetch(:service_profiles).find { |p| p[:class] == profile_class.to_s }
      end
    end
  end
end
