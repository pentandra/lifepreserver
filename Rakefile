require 'nanoc/tasks'

task :default => [:compile]

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
  system('nanoc', 'deploy', '-t', 'public')
end

