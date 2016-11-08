# Rules for the dynamic aspects of the site

compile '/**/*.conf' do
  filter :erb, @config[:erb]
end
