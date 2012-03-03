require "shortly"

module UrlShortener

  def shorten(url)
    puts url
    googl = Shortly::Clients::Googl
    googl.apiKey = "AIzaSyBrWtN-MJPxlUaJy3hjpqv59P3_4w9BWho"
    googl.shorten(url).shortUrl
  end

end
