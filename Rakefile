require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new(:rubocop) do |task|
  task.options = %w(--display-cop-names --format simple)
  task.patterns = [ 'lib/**/*.rb', 'spec/**/*.rb' ]
end

RSpec::Core::RakeTask.new(:spec) do |task|
  task.verbose = false
end

task test: [ :spec ]

task default: [ :test, :rubocop ]
