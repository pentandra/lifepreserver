# frozen_string_literal: true

require_relative 'link_to'
require_relative 'dates'

module Nanoc::Helpers
  # @see http://nanoc.ws/doc/reference/helpers/#xmlsitemap
  module XMLSitemap
    include LifePreserver::Helpers::LinkTo
    include LifePreserver::Helpers::Dates

    # @option params [Array] :items
    # @option params [Proc] :rep_select
    #
    # @return [String]
    def xml_sitemap(params = {})
      require 'builder'

      # Extract parameters
      items       = params.fetch(:items) { @items.reject { |i| i._unwrap.attributes[:is_hidden] } }
      select_proc = params.fetch(:rep_select, nil)

      # Create builder
      buffer = +''
      xml = Builder::XmlMarkup.new(target: buffer, indent: 2)

      # Check for required attributes
      if @config[:base_url].nil?
        raise 'The Nanoc::Helpers::XMLSitemap helper requires the site configuration to specify the base URL for the site.'
      end

      # Build sitemap
      xml.instruct!
      xml.urlset(xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9') do
        # Add item
        items.sort_by(&:identifier).each do |item|
          reps = item.reps.reject { |r| r.raw_path.nil? }
          reps.select! { |r| select_proc[r] } if select_proc
          reps.sort_by { |r| r.name.to_s }.each do |rep|
            xml.url do
              xml.loc URI.escape(path_to(rep, absolute: true))
              xml.lastmod date_or_time(item[:mtime]).iso8601 unless item[:mtime].nil?
              xml.changefreq item[:changefreq] unless item[:changefreq].nil?
              xml.priority item[:priority] unless item[:priority].nil?
            end
          end
        end
      end

      # Return sitemap
      buffer
    end
  end
end
