# frozen_string_literal: true

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
        @items[File.join(@config[:company_root], @config[:orgs_root], 'pentandra')].attributes
      end

      def path_to_logo(absolute: false)
        logo_id = File.join(@config[:static_root],
                            @config.dig(:site, :images_path),
                            'pentandra-logo.png')

        path_to(@items[logo_id], absolute: absolute)
      end

      def path_to_logotype(absolute: false)
        logotype_id = File.join(@config[:static_root],
                                @config.dig(:site, :images_path),
                                'pentandra-logotype.png')

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
