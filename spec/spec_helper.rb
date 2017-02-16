require 'simplecov'
SimpleCov.start

require 'nanoc'
require 'nanoc/cli'
require 'nanoc/spec'

module Nanoc
  module CLI
    def self.setup_cleaning_streams
    end
  end
end

Nanoc::CLI.setup

RSpec.configure do |config|
  config.around(:each) do |example|
    Nanoc::CLI::ErrorHandler.disable
    example.run
    Nanoc::CLI::ErrorHandler.enable
  end

  config.around(:each) do |example|
    Dir.mktmpdir('nanoc-test') do |dir|
      FileUtils.cd(dir) do
        example.run
      end
    end
  end

  config.around(:each, chdir: false) do |example|
    FileUtils.cd(File.dirname(__FILE__) + '/..') do
      example.run
    end
  end

  config.before(:each) do
    Nanoc::Int::NotificationCenter.reset
  end

  config.around(:each, stdio: true) do |example|
    orig_stdout = $stdout
    orig_stderr = $stderr

    unless ENV['QUIET'] == 'false'
      $stdout = StringIO.new
      $stderr = StringIO.new
    end

    example.run

    $stdout = orig_stdout
    $stderr = orig_stderr
  end

  config.before(:each, site: true) do
    FileUtils.mkdir_p('content')
    FileUtils.mkdir_p('layouts')
    FileUtils.mkdir_p('lib')
    FileUtils.mkdir_p('output')

    File.write('nanoc.yaml', '{}')

    File.write('Rules', 'passthrough "/**/*"')
  end

  config.include(Nanoc::Spec::HelperHelper, helper: true)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.disable_monkey_patching!
end
