require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'rake/testtask'

RuboCop::RakeTask.new(:rubocop) do |task|
  task.formatters = ['simple']
  task.fail_on_error = false
end

SUBDIRS = %w(* data_sources filters helpers).freeze

namespace :test do
  SUBDIRS.each do |dir|
    Rake::TestTask.new(dir == '*' ? 'all' : dir) do |t|
      t.test_files = Dir["test/#{dir}/**/*_spec.rb"] + Dir["test/#{dir}/**/test_*.rb"]
      t.ruby_opts = ['-r./test/helper']
    end
  end
end

RSpec::Core::RakeTask.new(:spec) do |task|
  task.verbose = false
end

task test: [:spec, :'test:all']

task default: [:test, :rubocop]
