# Favicon and images

route '/assets/images/*' do
  '/images/' + File.basename(@item.identifier.to_s)
end

# Fonts and other files

route '/assets/fonts/**/*' do
  '/fonts/' + File.basename(@item.identifier.to_s)
end

ignore '/assets/components/mediaelement/build/DO NOT CHANGE THESE FILES. USE -src- FOLDER.txt'
route '/assets/components/mediaelement/build/*' do
  '/js/mediaelement/' + File.basename(@item.identifier.to_s)
end

ignore '/assets/components/**/*'
