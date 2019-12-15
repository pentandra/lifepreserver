# frozen_string_literal: true

require_relative 'company'

module LifePreserver
  module Helpers
    module Dependencies
      include Company

      def sorted_dependencies
        @items.find_all(File.join(@config[:dependencies_root], '**', '*')).sort_by(&:identifier)
      end

      # Finds all the dependencies for the given Bundler group name.
      #
      # @param [String, Symbol] group_name The name of the dependency group.
      #
      # @return [Array<Nanoc::Core::CompilationItemView>] The Ruby dependency
      #   items of the given group.
      def dependencies_for(group_name)
        @items.find_all(File.join(@config[:dependencies_root], group_name.to_s, '*')).sort_by(&:identifier)
      end

      def authors_of(dependencies, external_only: true)
        dependencies ||= sorted_dependencies
        authors = dependencies.flat_map { |dep| dep[:authors] }.uniq.sort

        if external_only # Take out our people
          authors -= members.map { |member| member[:name] }
        end

        authors
      end

      def ruby_desc
        gem_info = defined?(Gem) ? "with RubyGems #{Gem::VERSION}" : 'without RubyGems'
        engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'

        %[#{engine} #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) #{gem_info}]
      end
    end
  end
end
