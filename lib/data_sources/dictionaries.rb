# frozen_string_literal: true

require 'ffi/hunspell'
require 'locale'

module LifePreserver
  module DataSources
    class Dictionaries < Nanoc::DataSource
      identifier :dictionaries

      def up
        unless @config[:directories].nil?
          FFI::Hunspell.directories = @config.fetch(:directories).flat_map do |d|
            Dir["#{d}/*/"]
          end
        end

        FFI::Hunspell.lang = Locale.default.to_simple.to_s
        Locale.set_current(*@config.fetch(:language_priority, [Locale.default]))
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

      protected

      def dic_to_item(dic_filename)
        first_line = File.open(dic_filename, &:readline)
        kind = case first_line
               when /^\d+$/
                 # a base dictionary will have a similarly named affix file
                 File.exist?(dic_filename.sub(/\.dic$/, '.aff')) ? 'base-dictionary' : 'extra-dictionary'
               when /^-{3,5}$/
                 'acronym-dictionary'
               else
                 'personal-dictionary'
               end

        binary = %w[base-dictionary extra-dictionary].include?(kind)

        entries = case kind
                  when 'personal-dictionary'
                    raw_content = File.read(dic_filename)
                    lines = raw_content.lines.map(&:chomp)
                    { entries: lines }
                  when 'acronym-dictionary'
                    raw_content = File.read(dic_filename)
                    entries_hash = YAML.safe_load(raw_content)
                    { acronym_mappings: entries_hash, entries: entries_hash.keys }
                  else
                    {}
                  end

        attributes = {
          name: File.basename(dic_filename, '.*'),
          kind: kind,
          mtime: File.mtime(dic_filename),
          is_hidden: true,
        }.merge(entries)

        filename = File.expand_path(dic_filename)
        parent_name = File.basename(File.dirname(dic_filename))
        new_item(
          binary ? filename : Nanoc::Core::TextualContent.new(raw_content, filename: filename),
          attributes,
          Nanoc::Identifier.new("/#{parent_name}/#{File.basename(filename)}"),
          binary: binary,
        )
      end
    end
  end
end
