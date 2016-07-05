require 'shortly'
require 'yaml'

module UrlShortener

  include Nanoc::Helpers::Text

  def shorten(url)

    hash = md5(url)
    short_urls = YAML.load_file('var/short_urls.yaml')

    short_url = short_urls[hash]

    if !short_url then
      begin
        googl = Shortly::Clients::Googl
        googl.apiKey = @config[:google_api_key]
        short_url = short_urls.store(hash, googl.shorten(url).shortUrl)
        File.open('var/short_urls.yaml', 'w+') { |io| io.write(YAML.dump(short_urls)) }
      rescue SocketError
        short_url = url # Just return the original if we have a network problem
      end
    end

    short_url
  end

end
