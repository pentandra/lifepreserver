# frozen_string_literal: true

group :red_green_refactor, halt_on_fail: true do
  guard 'rake', task: 'default' do
    watch(%r{^(lib|spec)/})
  end

  guard 'nanoc' do
    watch('nanoc.yaml')
    watch('Rules.rb')
    watch(%r{^rules/.*$})
    watch(%r{^(items|layouts|lib)/.*$})
    watch(%r{^etc/dictionaries/.+\.(yaml|dic)$})
    watch('etc/compass/compass.rb')
    watch(%r{^(etc|var)/.*\.yaml$})
  end

  guard 'livereload', hostname: 'localhost', override_url: true do
    watch(%r{items/.+\.(erb|haml|md|markdown|html|yaml|txt|sass|scss|css|ttl)})
    watch(%r{layouts/.+\.(erb|haml|md|markdown|html|yaml|tex)})
  end
end
