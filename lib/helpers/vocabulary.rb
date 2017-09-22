# frozen_string_literal: true

require 'active_support/core_ext/object/blank'

module LifePreserver
  module Vocabulary
    # Check METADATA.md at the project root for descriptions of these kinds
    TYPEOF_MAPPING ||= {
      'article'  => 'schema:Article',
      'essay'    => 'schema:BlogPosting',
      'blogpost' => 'schema:BlogPosting',
      'abstract' => 'fabio:Abstract',
      'concept'  => 'skos:Concept',
    }.freeze

    # Finds all prefix mappings for the given arguments.
    #
    # @param [String, Symbol]
    #
    # @return [String]
    def prefix_mappings_for(*args)
      res = []

      args.each do |arg|
        vocabs = vocabularies_for(arg)

        if vocabs.blank?
          raise ArgumentError, "Unable to find a vocabulary for the argument `#{arg.inspect}`"
        end

        res << vocabs
      end

      res.flatten.map { |vocab| "#{vocab.fetch(:prefix)}: #{vocab.fetch(:namespace_uri)}" }.join(' ')
    end

    # Finds a vocabulary or vocabularies for the given name.
    #
    # Accepts either group names or vocabulary prefixes. If the name is a group
    # name, it should return the group. If it is a prefix, it should return a
    # single vocabulary.
    #
    # @param [String, Symbol]
    #
    # @return [Array, Hash]
    def vocabularies_for(name)
      vocabs = @items.find_all("/lifepreserver/vocabularies/#{name}/*")
      vocabs.present? ? vocabs : @items["/lifepreserver/vocabularies/*/#{name}"]
    end

    def typeof(item)
      type = item.fetch(:typeof, TYPEOF_MAPPING[item[:kind]])
      RDF::Vocabulary.expand_pname(type).pname
    end

    def rdfs_label(pname)
      RDF::Vocabulary.expand_pname(pname).label
    end
  end
end
