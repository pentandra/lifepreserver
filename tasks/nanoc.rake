require 'rake/clean'
CLEAN.include("output/**")

desc "Compile site HTML using nanoc."
task :compile do
  system 'nanoc co'
end

desc "Start the nanoc autocompiler."
task :auto do
  system 'nanoc autocompile -p 9210 > nanoc-autocompile.log 2>&1 &'
end
