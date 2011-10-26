require 'nanoc3/cli'

def generate_tags
  # Load nanoc site
  site = Nanoc3::Site.new(YAML.load_file('config.yaml'))
  site.load_data
  pages = site.pages

  # Get all tags used on the site
  all_tags = pages.map { |p| p.attribute_named(:tags) }.flatten.compact.uniq

  # Get tags for which an index page exists
  tags_with_pages = pages.map { |p| p.attribute_named(:tags) }

  # Get tags for which no index page exists
  tags_without_pages = all_tags - tags_with_pages

  puts "Generating tags indices..."

  # Build pages for each tag
  tags_without_pages.each do |t|
    # Buid page
    page = Nanoc3::Page.new("Tag: #{t}", { :tag_meta => t, :layout => "tag" }, "/tags/#{t}")
    page.site = site
    page.build_reps
    site.pages << page
    page.save
    puts "    " + page.path
  end

  puts
  puts "Tags indices generated."
end

desc "Generate tags index pages."
task :tags do
  generate_tags()
end
