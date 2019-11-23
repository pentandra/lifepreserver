# frozen_string_literal: true

require_relative 'link_to'

module LifePreserver
  module Helpers
    module Company
      include LinkTo

      # Fetch all the attributes of the company item.
      #
      # @see DataSources::Company
      #
      # @return [Hash] The attributes of the company item.
      def company
        @items['/company/_pentandra'].attributes
      end

      def path_to_logo(absolute: false)
        logo_item = @items["#{@config[:static_root]}#{@config[:site][:images_path]}/pentandra-logo.png"]
        path_to(logo_item, absolute: absolute)
      end

      def path_to_logotype(absolute: false)
        logo_item = @items["#{@config[:static_root]}#{@config[:site][:images_path]}/pentandra-logotype.png"]
        path_to(logo_item, absolute: absolute)
      end

      # Grab all members.
      #
      # @return [Array<Nanoc::Core::CompilationItemView>] All member items.
      def members
        @items.find_all('/company/members/_*')
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

      # Populate identifiers for members without an external WebID.
      #
      # @note Called during preprocessing before items have been given a path,
      #   so we have to build this public path manually.
      #
      # @note This an exception to the normal URI design for this site (see
      #   {file:URI_DESIGN.md}) in order to conform to the current draft of the
      #   WebID spec (see https://www.w3.org/2005/Incubator/webid/spec/identity)
      #   which states that for "WebIDs with fragment identifiers (e.g. #me), the
      #   URI without the fragment denotes the Profile Document."
      #
      # @see People#populate_people_identifiers
      #
      # @todo We should support members having WebIDs at other domains in addition
      #   to their Pentandra WebID. Use an LDAP term for WebIDs and select the one
      #   for the +:web_id+ attribute that starts with +@config[:base_url]+.
      #
      # @return [void]
      def populate_member_identifiers
        members.each do |member|
          member[:web_id] ||= "#{@config[:base_url]}#{@config[:people_root]}/#{member.fetch(:slug)}/##{member.fetch(:hashtag, 'me')}"
        end
      end

      # Creates in-memory personal profile page items for all company members.
      #
      # @see https://github.com/pentandra/lifepreserver/issues/79
      #
      # @return [void]
      def generate_personal_profile_pages
        members.each do |member|
          @items.create(
            %(<%= render('/personal_profile.*', person_name: '#{member[:name]}') %>),
            { title: member[:name], kind: 'personal-profile-page', description: "Personal profile of #{member[:name]}" },
            "#{@config[:static_root]}#{@config[:people_root]}/#{member.fetch(:slug)}/index.erb",
            binary: false,
          )
        end
      end
    end
  end
end
