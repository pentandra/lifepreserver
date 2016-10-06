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
        RDF::IRI.new("#{@config[:base_url]}#{@config[:company][:page_url]}##{full_name(obj).to_slug}")
      else
        raise ArgumentError, "Not sure how to get an IRI for an object of type `#{obj.class}`."
      end
    end

    # Relative path to a document section describing a person
    def description_path(person)
      "#{@config[:company][:page_url]}/#sec:#{full_name(person).to_slug}"
    end

    def photo_url(person)
      "#{@config[:site][:images_url]}/#{full_name(person).to_slug}-150x150.jpg"
    end

    # Fetch all the attributes of the company item.
    #
    # @return [Hash]
    def company
      @items['/company/_'].attributes
    end

    def sorted_people
      people = @items.find_all('/company/people/*')
      people.sort_by do |p|
        [ p[:last_name], p[:first_name] ]
      end
    end

    def person_by_name(full_name)
      people = @items.find_all('/company/people/*')
      people.find { |person| full_name(person) == full_name }
    end

    # run during preprocessing
    def generate_author_uris(item_set)
      item_set = @items if item_set.nil?

      validate_config

      item_set.each do |item|
        author = person_by_name(item[:author_name])
        if author
          item[:author_uri] ||= "#{@config[:base_url]}#{description_path(author)}"
        end
      end
    end

    protected

    def validate_config
      if @config[:base_url].nil?
        raise Nanoc::Int::Errors::GenericTrivial.new('Cannot generate author URIs: site configuration has no base_url')
      end
    end

  end

end