require 'git'

module LifePreserver
  module Meta
    # Run during preprocessing
    def validate_version_history(config = nil)
      config ||= @config
      config[:version] = fetch_git_tag(exact_match: config.fetch(:require_git_tag, false))
    end

    def fetch_git_tag(exact_match: false)
      git = Git.open(File.join(File.dirname(__FILE__), '../../'))
      exact_match ? git.describe('HEAD', exact_match: true) : git.describe('HEAD', abbrev: 0)
    end

    # Finds all the dependencies for the given group name.
    #
    # @param [String, Symbol]
    #
    # @return [Array]
    def dependencies_for(group_name)
      @items.find_all("/lifepreserver/dependencies/#{group_name}/*").sort_by(&:identifier)
    end

    def ruby_desc
      gem_info = defined?(Gem) ? "with RubyGems #{Gem::VERSION}" : "without RubyGems"
      engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'

      %[#{engine} #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) #{gem_info}]
    end
  end
end
