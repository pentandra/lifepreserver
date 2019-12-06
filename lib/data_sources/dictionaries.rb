# frozen_string_literal: true

require 'ffi/hunspell'
require 'locale'

module LifePreserver
  module DataSources
    class Dictionaries < Nanoc::DataSource
      identifier :dictionaries

      def up
        unless @config[:search_paths].nil?
          FFI::Hunspell.directories = @config.fetch(:search_paths).flat_map do |d|
            Dir["#{d}/*/"]
          end
        end

        # Set language tags for available dictionaries
        available_dictionaries = FFI::Hunspell.directories.map { |d| File.basename(d) }
        Locale.set_app_language_tags(*available_dictionaries)

        # Set languages order of priority
        Locale.set_current(*@config.fetch(:ordered_locales, [Locale.default]))
      end

      def items
        items = []

        FFI::Hunspell.directories.each do |dir|
          Dir["#{dir}/*.{dic,yaml,yml}"].each do |dic_file|
            items << dic_to_item(dic_file)

            # TODO: add affix item for base dictionaries?
          end
        end

        items
      end

      def dic_to_item(dic_path)
        expanded_dic_path = File.expand_path(dic_path)
        dirname, basename = File.split(expanded_dic_path)
        parent_name = File.basename(dirname)

        kind = dictionary_peek(expanded_dic_path)

        attributes = {
          name: File.basename(dic_path, '.*'),
          kind: kind,
          lang: parent_name,
          mtime: File.mtime(expanded_dic_path),
          is_hidden: true,
        }

        extended_attributes =
          case kind
          when 'personal-dictionary'
            { entries: File.readlines(expanded_dic_path, chomp: true) }
          when 'acronym-dictionary'
            acronym_dic = File.open(expanded_dic_path) do |dic|
              YAML.safe_load(dic.read, filename: dic.path)
            end
            { acronym_mappings: acronym_dic, entries: acronym_dic.keys }
          else
            {}
          end

        binary = %w[base-dictionary extra-dictionary].include?(kind)

        new_item(
          expanded_dic_path,
          attributes.merge(extended_attributes),
          File.join(File::SEPARATOR, parent_name, basename),
          binary: binary,
        )
      end

      # Discover the kind of dictionary by peeking at the first line of the
      # given dictionary file.
      #
      # @see file:var/dictionaries/README.md
      #
      # @param dic_path [String] The path to the dictionary file.
      #
      # @return [String] The kind of dictionary, either a +base-dictionary+,
      #   an +extra-dictionary+, an +acronym-dictionary+, or a
      #   +personal-dictionary+.
      def dictionary_peek(dic_path)
        case File.open(dic_path, &:readline)
        when /^\d+$/
          # a base dictionary will have a similarly named affix file
          if File.exist?(dic_path.sub(/\.dic$/, '.aff'))
            'base-dictionary'
          else
            'extra-dictionary'
          end
        when /^-{3,5}$/
          'acronym-dictionary'
        else
          'personal-dictionary'
        end
      end
    end
  end
end
