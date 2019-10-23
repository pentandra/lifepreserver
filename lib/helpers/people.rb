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

    # TODO: Fix sorting
    def sorted_people
      people.sort_by { |p| p.fetch(:name, full_name(p)).split.reverse }
    end

    def person_by_name(name)
      people.find { |person| full_name(person) == name }
    end

    # Fetch the full name of the person.
    #
    # Looks for the `:full_name` key, then `:name`, then assembles a name using
    # the `:first_name` and `:last_name` keys as a last resort.
    #
    # @param [Nanoc::BasicItemView] person An item with kind `person`.
    #
    # @return [String] The full name of the person.
    def full_name(person)
      person[:full_name] || person[:name] || "#{person.fetch(:first_name)} #{person.fetch(:last_name)}"
    end

    # Get path to a person's photo.
    #
    # Assumes and verifies that all photos of people are stored in the
    # site's images path. (I think this is good practice.) Looks first
    # for a filename at the `:photo` key, then defaults to the slug if
    # that key is not found.
    #
    # @param [Nanoc::BasicItemView] person a person item
    # @param [Boolean] absolute (false) return an absolute URI?
    #
    # @return [String] path to photo
    def path_to_photo(person, absolute: false)
      photo_filename = person[:photo] || person[:slug] + '.jpg'
      photo_item = @items["#{@config[:static_root]}#{@config[:site][:images_path]}/#{photo_filename}"]
      path_to(photo_item, absolute: absolute)
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
        person[:web_id] ||= "#{@config[:base_url]}#{@config[:people][:page_path]}##{member.fetch(:slug)}"
      end
    end
  end
end
