# frozen_string_literal: true

require_relative 'company'

module LifePreserver
  module Dependencies
    include LifePreserver::Company

    def sorted_dependencies
      @items.find_all('/lifepreserver/dependencies/**/*').sort_by(&:identifier)
    end

    # Finds all the dependencies for the given Bundler group name.
    #
    # @param [String, Symbol]
    #
    # @return [Array]
    def dependencies_for(group_name)
      @items.find_all("/lifepreserver/dependencies/#{group_name}/*").sort_by(&:identifier)
    end

    def authors_of(dependencies, external_only: true)
      dependencies ||= sorted_dependencies
      authors = dependencies.flat_map { |dep| dep[:authors] }.uniq.sort

      if external_only # Take out our people
        authors -= sorted_people.map { |person| full_name(person) }
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
