# frozen_string_literal: true

# Sitemap and other meta files

# Fallback HTML files for httpRange-14 redirection of concepts, etc.
compile '/**/*.yaml' do
  filter :erb
  layout '/redirect.*'
  write case item[:kind]
        when 'concept'
          item.identifier.without_ext + '.html'
        when 'redirect'
          item.identifier.without_ext + '/index.html'
        else
          raise "YAML item #{@item.identifier} must be either a 'concept' or a 'redirect'"
        end
end

compile '/static/sitemap.erb' do
  filter :erb
  write item.identifier.without_ext + '.xml'
end

compile '/static/{robots,humans}.*' do
  filter :erb
  write item.identifier.without_ext
end

route '/static/404.erb' do
  item.identifier.without_ext + '.html'
end
