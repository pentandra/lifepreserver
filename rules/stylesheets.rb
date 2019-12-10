# frozen_string_literal: true

# Stylesheets

compile '/static/assets/stylesheets/**/*.htc' do
  write '/static/css/' + File.basename(@item.identifier.to_s)
end

compile '/static/assets/stylesheets/**/*' do
  filter :compass, config_file: 'etc/compass/config.rb'
  write '/static/css/' + File.basename("#{@item.identifier.without_ext}#{fingerprint(@item[:filename]) if @config[:production]}.css")
end

route '/static/assets/components/pygments/css/*' do
  '/static/css/pygments/' + File.basename(@item.identifier.to_s)
end
