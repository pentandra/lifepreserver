guard 'nanoc' do
  watch('nanoc.yaml')
  watch('Rules')
  watch(%r{^(etc|content|layouts|lib)/.*$})
end

guard 'livereload', hostname: 'localhost', grace_period: 0.5, override_url: true  do
  watch(%r{content/.+\.(erb|haml|md|markdown|html|yaml|txt|sass|scss|css|ttl)})
  watch(%r{layouts/.+\.(erb|haml|md|markdown|html|yaml)})
end
