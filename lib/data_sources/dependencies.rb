# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'rubygems'
require 'bundler'

module LifePreserver
  module DataSources
    class Dependencies < Nanoc::DataSource
      identifier :dependencies

      def items
        items = []

        Bundler.definition.current_dependencies.each do |dependency|
          dependency.groups.each do |group|
            items << gem_to_item(dependency.to_spec, group.to_s)
          end
        end

        items
      end

      protected

      def gem_to_item(gem, group_name)
        new_item(
          '-',
          {
            kind:      'dependency',
            name:      gem.name,
            summary:   gem.summary,
            homepage:  gem.homepage,
            version:   gem.version.to_s,
            group:     group_name,
            authors:   gem.authors,
            is_hidden: true,
          },
          Nanoc::Identifier.new("/dependencies/#{group_name.parameterize}/#{gem.name.parameterize}"),
          checksum_data: "name=#{gem.name},version=#{gem.version},group=#{group_name}",
        )
      end
    end
  end
end
