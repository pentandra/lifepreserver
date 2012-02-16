require "rqrcode"
require "chunky_png"

module RQRCode
  class QRCode

    # to_image
    #
    # the size parameter indicates the width and height in pixels for each module
    #
    # adapted from http://dagi3d.net/posts/3-generating-qr-code-images-with-rqrcode
    #
    def to_image(size = 5, offset = 4)
      
      margin = offset * size
      dim = size * @modules.size + margin * 2 
      image = ChunkyPNG::Image.new(dim, dim, ChunkyPNG::Color::WHITE)

      @modules.each_index do |x|
        @modules.each_index do |y|
          if (self.dark?(x,y))
            image.rect(y * size + margin, x * size + margin, 
                       (y * size) + size + margin, (x * size) + size + margin, 
                       ChunkyPNG::Color::from_hex("#544233"), 
                       ChunkyPNG::Color::from_hex("#544233"))
          end
        end
      end

      image
    end
  end
end
