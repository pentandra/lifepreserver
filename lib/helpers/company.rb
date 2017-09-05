# frozen_string_literal: true

require 'rdf'
require_relative 'text'

module LifePreserver
  module Company
    include Text

    def full_name(person)
      "#{person[:first_name]} #{person[:last_name]}"
    end

    # Get an IRI for an object
    #
    # @return [RDF::IRI]
    def iri_for(obj)
      if obj.is_a?(String)
        RDF::IRI.new(obj)
      elsif obj.respond_to?(:to_uri)
        obj.to_uri
      elsif obj.respond_to?(:identifier) && obj.identifier =~ '/company/people/*'
        RDF::IRI.new("#{@config[:base_url]}#{@config[:company][:page_path]}##{full_name(obj).to_slug}")
      else
        raise ArgumentError, "Not sure how to get an IRI for an object of type `#{obj.class}`."
      end
    end

    # Relative path to a document section describing a person
    def description_path(person)
      "#{@config[:company][:page_path]}/##{full_name(person).to_slug}"
    end

    def photo_url(person, global: false)
      "#{@config[:base_url] if global}#{@config[:site][:images_path]}/#{full_name(person).to_slug}.jpg"
    end

    # Fetch all the attributes of the company item.
    #
    # @return [Hash]
    def company
      blk = -> { @items['/company/_'].attributes }
      if @items.frozen?
        @company_attributes ||= blk.call
      else
        blk.call
      end
    end

    def sorted_people
      people = @items.find_all('/company/people/*')
      people.sort_by do |p|
        [p[:last_name], p[:first_name]]
      end
    end

    def person_by_name(full_name)
      people = @items.find_all('/company/people/*')
      people.find { |person| full_name(person) == full_name }
    end
  end
end
