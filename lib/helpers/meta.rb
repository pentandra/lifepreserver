# frozen_string_literal: true

require 'git'

module LifePreserver
  module Helpers
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
    end
  end
end
