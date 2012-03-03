require "shortly"

module UrlShortener

  def shorten(url)
    begin
      googl = Shortly::Clients::Googl
      googl.apiKey = "AIzaSyBrWtN-MJPxlUaJy3hjpqv59P3_4w9BWho"
      googl.shorten(url).shortUrl
    rescue SocketError
      url # Just return the original if we have a network problem
    end
  end

end
