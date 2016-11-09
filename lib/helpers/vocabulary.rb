require "active_support/core_ext/object/blank"

module LifePreserver
  module Vocabulary
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

      res.flatten.map { |vocab| "#{vocab.fetch(:prefix)}: #{vocab.fetch(:namespace_uri)}" }.join(" ")
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
      vocabs = @items.find_all("/_project/vocabularies/#{name}/*")
      vocabs.present? ? vocabs : @items["/_project/vocabularies/*/#{name}"]
    end
  end
end
