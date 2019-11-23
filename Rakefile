# frozen_string_literal: true

require 'rake/testtask'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop) do |task|
  task.formatters = ['simple']
  task.fail_on_error = false
end

Rake::TestTask.new(:test_all) do |task|
  task.test_files = Dir['test/**/test_*.rb']
  task.libs << 'test'
  task.verbose = false
end

RSpec::Core::RakeTask.new(:spec) do |task|
  task.verbose = false
end

task test: %i[spec test_all]

task default: %i[test rubocop]
