require 'shortly'
require 'yaml/store'

module LifePreserver

  module UrlShortener

    include Text

    SHORT_URLS_FILENAME ||= 'var/short_urls.yaml'.freeze

    private_constant :SHORT_URLS_FILENAME

    def shorten(url)
      hash = md5(url)
      store.transaction { store.fetch(hash, generate_short_url(hash, url)) }
    end

    private

    def generate_short_url(key, long_url)
      if @config[:google_api_key]
        begin
          googl = Shortly::Clients::Googl
          googl.apiKey = @config[:google_api_key]
          short_url = googl.shorten(url).shortUrl

          store.transaction { store[hash] = short_url }

          short_url
        rescue
          long_url
        end
      else
        long_url
      end
    end

    def store
      FileUtils.mkdir_p(File.dirname(SHORT_URLS_FILENAME))

      @store ||= YAML::Store.new(SHORT_URLS_FILENAME)
    end

  end
end
