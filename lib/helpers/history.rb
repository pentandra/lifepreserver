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

end
