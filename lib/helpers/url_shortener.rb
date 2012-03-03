require "shortly"

module UrlShortener

  def shorten(url)
    begin
      googl = Shortly::Clients::Googl
      googl.apiKey = "AIzaSyBrWtN-MJPxlUaJy3hjpqv59P3_4w9BWho"
      googl.shorten(url).shortUrl
    rescue
      url # Just return the original if we have a problem
    end
  end

end
