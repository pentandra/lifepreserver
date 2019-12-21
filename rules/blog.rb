# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'

# Weblog index

compile '/static/blog/{index,recent}.erb' do
  filter :erb, @config[:erb]
  layout '/blog/default.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
end

# Weblog feeds

compile '/static/**/feed.erb' do
  filter :erb
  write item.identifier.without_ext + '.atom'
end

# Site tags

compile '/tags/*' do
  layout '/blog/tag.*'
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
  write File.join(@item.identifier.prefix(@config.fetch(:static_root)), 'index.html')
end

# Weblog postings

compile '/static/posts/**/*.md' do
  filter :erb, @config[:erb]
  filter :pandoc, args: [
    { from: :"markdown+emoji", to: :html5 },
    { base_header_level: 2 },
    { syntax_definition: 'etc/syntax/n3.xml' },
    { syntax_definition: 'etc/syntax/turtle.xml' },
    :section_divs,
  ]
  filter :absolutify_paths, type: :html
  filter :spellchecker, type: :html
  filter :abbreviate, type: :html
  filter :old_style_figures, type: :html
  snapshot :pre_robust_anchors
  filter :robust_anchors
  layout "/blog/#{@item[:kind]}.*"
  filter :rubypantsunicode
  filter :cache_buster if @config[:production]
  filter :html5small if @config[:production]
  write item.identifier.without_ext.sub('/posts', '') + '.html'
end

compile '/static/posts/**/*.md', rep: :feed_entry do
  filter :erb, @config[:erb]
  filter :pandoc, args: [
    { from: :"markdown+emoji", to: :html5 },
    { base_header_level: 2 },
    :section_divs,
  ]
  filter :absolutify_paths, type: :html, absolute: true
  filter :rubypantsunicode
end

compile '/static/posts/**/*.{jpg,jpeg,png,gif}' do
  filter :image_optimizer if @config[:production]
end

route '/static/posts/**/*' do
  item.identifier.to_s.sub('/posts', '')
end
