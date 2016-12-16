require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new(:rubocop) do |task|
  task.formatters = ['simple']
  task.fail_on_error = false
end

RSpec::Core::RakeTask.new(:spec) do |task|
  task.verbose = false
end

desc 'Run all tests and specs'
task test: [:spec]

task default: [:test, :rubocop]
