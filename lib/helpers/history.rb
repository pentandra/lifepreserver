require 'git'

module History

  # Run during preprocessing
  def populate_version_history(config = nil)
    config ||= @config
    config[:version] = fetch_git_tag(exact_match: config.fetch(:production, false))
  end

  def fetch_git_tag(exact_match: false)
    git = Git.open(File.join(File.dirname(__FILE__), '../../'))
    exact_match ? git.describe('HEAD', exact_match: true) : git.describe('HEAD', abbrev: 0) # All production releases must be at a tag
  end

  def sorted_dependencies
    @items.find_all('/_project/dependencies/*').sort_by(&:identifier)
  end

  def ruby_desc
    gem_info = defined?(Gem) ? "with RubyGems #{Gem::VERSION}" : "without RubyGems"
    engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'

    %[#{engine} #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) #{gem_info}]
  end
end
