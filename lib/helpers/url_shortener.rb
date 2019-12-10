# frozen_string_literal: true

require 'shortly'
require 'yaml/store'
require 'digest/md5'

module LifePreserver
  module Helpers
    module UrlShortener
      def shorten(url)
        hash = Digest::MD5.hexdigest(url)
        store.transaction { store[hash] || generate_short_url(hash, url) }
      end

      private

      # This method should only be called within a PStore::Transaction
      def generate_short_url(key, long_url)
        validate_config

        begin
          googl = Shortly::Clients::Googl
          googl.apiKey = @config.fetch(:google_api_key)

          store[key] = googl.shorten(long_url).shortUrl
        rescue => e
          warn("Unable to shorten '#{long_url}' due to the following error: #{e.message}")
          long_url
        end
      end

      def validate_config
        unless @config.key?(:google_api_key)
          raise 'Cannot generate short urls without a @config[:google_api_key]'
        end
      end

      def store
        short_urls_cache = File.expand_path(@config[:cache][:short_urls])
        FileUtils.mkdir_p(File.dirname(short_urls_cache))
        @store ||= YAML::Store.new(short_urls_cache)
      end
    end
  end
end
