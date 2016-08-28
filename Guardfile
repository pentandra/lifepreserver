guard 'nanoc' do
  watch('nanoc.yaml')
  watch('Rules')
  watch(%r{^(content|layouts|lib)/.*$})
  watch('etc/dictionary')
  watch('etc/compass/compass.rb')
  watch('etc/*.yaml')
end

guard 'livereload', hostname: 'localhost', override_url: true  do
  watch(%r{content/.+\.(erb|haml|md|markdown|html|yaml|txt|sass|scss|css|ttl)})
  watch(%r{layouts/.+\.(erb|haml|md|markdown|html|yaml)})
end
