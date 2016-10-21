# Aggregated JavaScript scripts
 
compile '/assets/scripts/*.js.erb' do
  filter :erb, trim_mode: '>'
  filter :uglify_js if @config[:production]
  write '/js/' + File.basename("#{@item.identifier.without_exts}#{fingerprint(@item[:filename]) if @config[:production]}.js")
end

# Other JavaScript scripts
 
compile '/assets/scripts/*.js' do
  filter :uglify_js if @config[:production]
  write '/js/' + File.basename(@item.identifier.to_s)
end
