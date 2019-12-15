# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'digest'

module LifePreserver
  module DataSources
    class People < Nanoc::DataSource
      identifier :people

      def up
        @people =
          File.open(@config[:people_data]) do |file|
            YAML.safe_load(file.read, filename: file.path, symbolize_names: true)
          end
      end

      def items
        @people.map do |person|
          person_to_item(person)
        end
      end

      def person_to_item(person)
        slug = person.fetch(:name).parameterize

        attributes = {
          kind: 'person',
          slug: slug,
          web_id: local_web_id(slug),
          mtime: mtime_of(@config[:people_data]),
          is_hidden: true,
        }

        new_item(
          '-',
          attributes.merge(person),
          Nanoc::Identifier.new("/_#{slug}"),
          attributes_checksum_data: Digest::SHA1.digest(Marshal.dump(person)),
        )
      end

      def mtime_of(meta_filename)
        File.stat(meta_filename).mtime
      end

      # Provide a local Web identifier for a person, a unique reference in the
      # people index document.
      #
      # @see Company#default_web_id
      #
      # @param name [String] The name of the person.
      #
      # @return [String]
      def local_web_id(name)
        File.join(@site_config[:base_url], @config[:items_root] + "##{name.parameterize}")
      end
    end
  end
end
