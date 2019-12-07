require 'simplecov'
SimpleCov.start do
  add_group 'Helpers', 'lib/helpers'
  add_group 'Filters', 'lib/filters'
  add_group 'Data Sources', 'lib/data_sources'
  add_group 'Commands', 'commands'
end

require 'fuubar'
require 'rspec/its'
require 'timecop'
require 'tty-command'
require 'yard'

require 'nanoc'
require 'nanoc/cli'
require 'nanoc/spec'

RSpec.configure do |c|
  c.include(Nanoc::Spec::Helper)

  c.include(Nanoc::Spec::HelperHelper, helper: true)

  # TODO: Only really relevant when using the filesystem data source
  c.before(:each, site: true) do
    FileUtils.mkdir_p('content')
    FileUtils.mkdir_p('layouts')
    FileUtils.mkdir_p('lib')
    FileUtils.mkdir_p('output')

    File.write('nanoc.yaml', '{}')

    File.write('Rules', 'passthrough "/**/*"')
  end

  c.fuubar_progress_bar_options = {
    format: '%c/%C |<%b>%i| %p%%',
  }

  c.before(:each, fork: true) do
    skip 'fork() is not supported on Windows' if Nanoc::Core.on_windows?
  end

  c.before do
    Nanoc::Core::NotificationCenter.reset
  end

  c.around do |example|
    should_chdir =
      !example.metadata.key?(:chdir) ||
      example.metadata[:chdir]

    if should_chdir
      Dir.mktmpdir('nanoc-test') do |dir|
        chdir(dir) { example.run }
      end
    else
      example.run
    end
  end

  c.around(:each, stdio: true) do |example|
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
end

module Nanoc
  module CLI
    def self.setup_cleaning_streams; end
  end
end

Nanoc::CLI.setup

RSpec.configure do |c|
  c.around do |example|
    Nanoc::CLI::ErrorHandler.disable
    example.run
    Nanoc::CLI::ErrorHandler.enable
  end

  c.before(:each, fork: true) do
    skip 'fork() is not supported on Windows' if Nanoc::Core.on_windows?
  end
end

RSpec::Matchers.define :raise_wrapped_error do |expected|
  supports_block_expectations

  include RSpec::Matchers::Composable

  match do |actual|
    begin
      actual.call
    rescue Nanoc::Core::Errors::CompilationError => e
      values_match?(expected, e.unwrap)
    end
  end

  description do
    "raise wrapped error #{expected.inspect}"
  end

  failure_message do |_actual|
    "expected that proc would raise wrapped error #{expected.inspect}"
  end

  failure_message_when_negated do |_actual|
    "expected that proc would not raise wrapped error #{expected.inspect}"
  end
end

RSpec::Matchers.alias_matcher :some_textual_content, :be_some_textual_content
RSpec::Matchers.alias_matcher :some_binary_content, :be_some_binary_content

RSpec.shared_context 'with tmp dir' do
  around do |example|
    Dir.mktmpdir('nanoc-test') do |dir|
      @tmp_dir = dir
      example.run
    end
  end

  attr_reader :tmp_dir
end
