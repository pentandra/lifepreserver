require 'nanoc/tasks'

Dir['tasks/**/*.rake'].sort.each { |rakefile| load rakefile }

task :default => [:compile]
task :rebuild => [:fullclean, :compile]

task :fullclean => :clean do
  system('git', 'clean', '-qdf')
  system('rm', '-r', 'output', 'tmp')
end

task :compile do
  system('nanoc', 'compile')
end

task :ping do
  system('scripts/ping.sh')
end

task :optimize_pngs do
  system('find', 'output', '-name', '*.png', '-exec', 'optipng', '-o7', '{}', ';')
end

task :build_staging do
  system('cp', 'settings/staging.rb', 'settings.rb')
  Rake::Task["rebuild"].invoke
end

task :stage do
  system('nanoc', 'deploy', '-t', 'staging')
end

task :build_production do
  system('cp', 'settings/prd.rb', 'settings.rb')
  Rake::Task["rebuild"].invoke
  Rake::Task["optimize_pngs"].invoke
end

task :publish do
  exit unless system("scripts/confirm.sh")
  system('nanoc', 'deploy', '-t', 'public')
end

