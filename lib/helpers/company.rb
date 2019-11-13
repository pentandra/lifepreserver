# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'date'

require_relative 'text'
require_relative 'link_to'

module LifePreserver
  module Company
    include Text
    include LinkTo

    # Fetch all the attributes of the company item.
    #
    # @see {file:lib/data_sources/company.rb}
    #
    # @return [Hash] The attributes of the company item.
    def company
      @items['/company/_'].attributes
    end

    def path_to_logo(absolute: false)
      logo_item = @items["#{@config[:static_root]}#{@config[:site][:images_path]}/#{company.fetch(:logo)}"]
      path_to(logo_item, absolute: absolute)
    end

    def members
      @items.find_all('/company/members/_*')
    end

    def sorted_members
      members.sort_by { |p| [p[:last_name], p[:first_name]] }
    end

    # @return [Boolean] True if a member of the company, false if not
    def member?(member)
      members.member?(member)
    end

    # @param [String] full_name
    #
    # @return [Nanoc::Core::BasicItemView, nil] A member item, if found
    def member_by_name(full_name)
      members.find { |member| full_name(member) == full_name }
    end

    # @param [Nanoc::BasicItemView] member a member item
    #
    # @return [Array<Hash>] an sorted array of seats
    def sorted_seats(member)
      member.fetch(:seats).sort_by { |s| s[:started_at] }
    end

    # Find the current seat for a member, i.e. the longest-standing seat that has not ended.
    #
    # @param [Nanoc::BasicItemView] member a member item
    #
    # @return [Hash] the current seat of the member
    def current_seat(member)
      sorted_seats(member).find { |seat| !seat.key?(:ended_at) || seat.fetch(:ended_at) > Date.today }
    end

    # Return the path to the profile page of the given member.
    #
    # @param [Nanoc::Core::CompilationItemView] member The company member.
    # @param [Boolean] absolute (false) Whether to return an absolute path or not.
    #
    # @return [String] The path to the profile page, if the item exists.
    def path_to_profile_page(member, absolute: false)
      profile_page_item = @items["#{@config[:static_root]}#{@config[:people][:page_path]}/#{member.fetch(:slug)}/index.*"]
      path_to(profile_page_item, absolute: absolute)
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
    # @see LifePreserver::People#populate_people_identifiers To compare the
    #   configuration of identifiers for people.
    #
    # @return [void]
    def populate_member_identifiers
      members.each do |member|
        member[:web_id] ||= "#{@config[:base_url]}#{@config[:people][:page_path]}/#{member.fetch(:slug)}/##{member.fetch(:hashtag, 'me')}"
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
          %(<%= render('/personal_profile.*', person_name: '#{full_name(member)}') %>),
          { title: full_name(member), kind: 'personal-profile-page', description: "All about #{full_name(member)}" },
          "#{@config[:static_root]}#{@config[:people][:page_path]}/#{member.fetch(:slug)}/index.erb",
          binary: false,
        )
      end
    end
  end
end
