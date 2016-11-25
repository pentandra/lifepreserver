guard 'rake', task: 'default' do
  watch(%r{^(lib|test|spec)/})
end

guard 'nanoc' do
  watch('nanoc.yaml')
  watch('Rules.rb')
  watch(%r{^rules/.*$})
  watch(%r{^(items|layouts|lib)/.*$})
  watch('etc/dictionaries/*.dic')
  watch('etc/compass/compass.rb')
  watch(%r{^(etc|var)/.*\.yaml$})
end

guard 'livereload', hostname: 'localhost', override_url: true do
  watch(%r{items/.+\.(erb|haml|md|markdown|html|yaml|txt|sass|scss|css|ttl)})
  watch(%r{layouts/.+\.(erb|haml|md|markdown|html|yaml|tex)})
end
