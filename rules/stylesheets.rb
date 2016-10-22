# Stylesheets

compile '/assets/stylesheets/**/*.htc' do
  write '/css/' + File.basename(@item.identifier.to_s)
end

compile '/assets/stylesheets/**/*' do
  filter :sass, Compass.sass_engine_options
  write '/css/' + File.basename("#{@item.identifier.without_ext}#{fingerprint(@item[:filename]) if @config[:production]}.css")
end

route '/assets/components/pygments/css/*' do
  '/css/pygments/' + File.basename(@item.identifier.to_s)
end
