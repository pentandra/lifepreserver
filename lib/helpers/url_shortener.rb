require 'shortly'
require 'yaml'

module LifePreserver

  module UrlShortener

    include Nanoc::Helpers::Text

    def shorten(url)

      hash = md5(url)
      short_urls = YAML.load_file('etc/short_urls.yaml')

      short_url = short_urls[hash]

      if not short_url then
        begin
          googl = Shortly::Clients::Googl
          googl.apiKey = "AIzaSyBrWtN-MJPxlUaJy3hjpqv59P3_4w9BWho"
          short_url = short_urls.store(hash, googl.shorten(url).shortUrl)
          File.open('etc/short_urls.yaml', 'w+') { |io| io.write(YAML.dump(short_urls)) }
        rescue SocketError
          short_url = url # Just return the original if we have a network problem
        end
      end

      short_url
    end

  end

end
