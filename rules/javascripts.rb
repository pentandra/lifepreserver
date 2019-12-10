# frozen_string_literal: true

# Aggregated JavaScript scripts

compile '/static/assets/scripts/*.js.erb' do
  filter :erb, @config[:erb]
  filter :uglify_js if @config[:production]
  write '/static/js/' + File.basename("#{@item.identifier.without_exts}#{fingerprint(@item[:filename]) if @config[:production]}.js")
end

# Other JavaScript scripts

compile '/static/assets/scripts/*.js' do
  filter :uglify_js if @config[:production]
  write '/static/js/' + File.basename(@item.identifier.to_s)
end
