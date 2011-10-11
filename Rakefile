require 'nanoc3/tasks'

Dir['tasks/**/*.rake'].sort.each { |rakefile| load rakefile }

desc "compile, validate."
task :default => [ :compile, :validate ]
