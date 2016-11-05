# Favicon and images

route '/static/assets/images/*' do
  '/static/images/' + File.basename(@item.identifier.to_s)
end

# Fonts and other files

route '/static/assets/fonts/**/*' do
  '/static/fonts/' + File.basename(@item.identifier.to_s)
end

ignore '/static/assets/components/mediaelement/build/DO NOT CHANGE THESE FILES. USE -src- FOLDER.txt'
route '/static/assets/components/mediaelement/build/*' do
  '/static/js/mediaelement/' + File.basename(@item.identifier.to_s)
end

ignore '/static/assets/components/**/*'
