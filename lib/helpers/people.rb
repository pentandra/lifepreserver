# frozen_string_literal: true

require_relative 'company'
require_relative 'link_to'

module LifePreserver
  module People
    include Company
    include LinkTo

    # Grab all the people, including company members.
    def people
      members + @items.find_all('/people/_*')
    end

    # Grab all people, sorted first by surname then given name.
    def sorted_people
      people.sort_by { |person| [person[:sn], person[:givenname]] }
    end

    def person_by_name(name)
      people.find { |person| person.fetch(:name) == name }
    end

    # Return the path to the profile page of the given person.
    #
    # If the person is a member, returns the path to his or her Pentandra
    # personal profile page. If they do not have a WebID and were assigned a
    # local id in the people index document, simply returns the value of the
    # +:web_id+ attribute. If they have an external WebID, returns the part
    # before the hash (`#`).
    #
    # @note According to the draft WebID spec (see
    #   https://www.w3.org/2005/Incubator/webid/spec/identity/), for "WebIDs
    #   with fragment identifiers (e.g. #me), the URI without the fragment
    #   denotes the Profile Document" and is silent as to whether it should
    #   follow HTTP redirections. This implementation keeps to the basic
    #   standard and does not require any redirections.
    #
    # @see #populate_people_identifiers
    # @see LifePreserver::Company#populate_member_identifiers
    #
    # @param [Nanoc::Core::CompilationItemView] person The person who is the
    #   topic of the profile page. Must have a +:web_id+ attribute.
    # @param [Boolean] absolute (false) Whether to return an absolute path or
    #   not. If the given person's profile page is not an item for this site,
    #   it will always return an absolute path.
    #
    # @return [String] The path to the given person's personal profile page or
    #   path of the local identifier for a person without a WebID.
    def path_to_profile_page(person, absolute: false)
      web_id = person.fetch(:web_id).to_s
      if member?(person)
        profile_page_item = @items["#{@config[:static_root]}#{@config[:people][:page_path]}/#{person.fetch(:slug)}/index.*"]
        path_to(profile_page_item, absolute: absolute)
      elsif web_id.start_with?(@config[:base_url])
        path_to(web_id, absolute: absolute)
      else
        web_id.split('#', 2).first
      end
    end

    # Populate identifiers for referenced people without a WebID. If a person
    #   does not have an external WebID, this creates a local identifier for
    #   the person that will redirect to the people index document.
    #
    # @note Called during preprocessing before items have been given a path,
    #   so we have to build this public path manually.
    #
    # @see https://github.com/pentandra/lifepreserver/issues/85
    #
    # @see LifePreserver::Company#populate_member_identifiers To compare the
    #   configuration of identifiers for people.
    #
    # @return [void]
    def populate_people_identifiers
      @items.find_all('/people/_*').each do |person|
        person[:web_id] ||= "#{@config[:base_url]}#{@config[:people][:page_path]}##{person.fetch(:slug)}"
      end
    end
  end
  end
end
