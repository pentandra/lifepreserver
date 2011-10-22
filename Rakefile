require 'nanoc3/tasks'

task :default => [:compile]
task :rebuild => [:fullclean, :compile]

task :fullclean => :clean do
  system('git', 'clean', '-qdf')
  system('rm', '-r', 'output', 'tmp')
end

task :compile do
  system('nanoc3', 'compile')
end

task :ping do
  system('scripts/ping.sh')
end

task :optimize_pngs do
  system('find', 'output', '-name', '*.png', '-exec', 'optipng', '-o7', '{}', ';')
end

task :build_production do
  system('cp', 'settings/prd.rb', 'settings.rb')
  Rake::Task["rebuild"].invoke
  Rake::Task["optimize_pngs"].invoke
end

task :publish do
  exit unless system("scripts/confirm.sh")
  Rake::Task["build_production"].invoke
  system('rake', 'deploy:rsync', 'config=public')
end

