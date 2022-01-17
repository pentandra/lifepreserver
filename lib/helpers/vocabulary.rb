# frozen_string_literal: true

require 'active_support/core_ext/object/blank'

module LifePreserver
  module Helpers
    module Vocabulary
      # Check METADATA.md at the project root for descriptions of these kinds
      TYPEOF_MAPPING ||= {
        'article' => 'schema:Article',
        'essay' => 'schema:BlogPosting',
        'blogpost' => 'schema:BlogPosting',
        'abstract' => 'fabio:Abstract',
        'concept' => 'skos:Concept',
      }.freeze

      # Generates a string of prefix mappings for the given arguments.
      #
      # @param (see #vocabularies_for)
      #
      # @return [String] A prefix attribute value.
      def prefix_mappings_for(*args)
        vocabularies_for(args)
          .map { |v| "#{v.fetch(:prefix)}: #{v.fetch(:namespace_uri)}" }.join(' ')
      end

      # Finds a vocabulary or vocabularies for the given name.
      #
      # @param [Array<String, Symbol>] args The vocabulary prefixes or prefix
      #   categories. If a category name, it should return the entire category of
      #   vocabularies. If a prefix, it should return a single vocabulary.
      #
      # @return [Array<Nanoc::Core::BasicItemView>] Any applicable items of kind +vocabulary+.
      def vocabularies_for(*args)
        res = []

        Array(args).flatten.each do |arg|
          vocabularies_root = @config.fetch(:vocabularies_root)
          vocabs = @items.find_all(File.join(vocabularies_root, arg.to_s, '*'))
          # Look for a single prefix if no category is found
          vocabs = vocabs.present? ? vocabs : @items[File.join(vocabularies_root, '*', arg.to_s)]

          if vocabs.blank?
            raise ArgumentError, "Unable to find a vocabulary for the argument `#{arg.inspect}`"
          end

          res << vocabs
        end

        res.flatten
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
end
