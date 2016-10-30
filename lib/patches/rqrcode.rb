require 'rqrcode'

module RQRCode
  class QRCode

    # to_image
    #
    # the module_size parameter indicates the width and height in pixels for each module
    #
    # adapted from http://dagi3d.net/posts/3-generating-qr-code-images-with-rqrcode
    #
    def to_image(module_size = 5, offset = 4, color) 

      color = color || ChunkyPNG::Color::BLACK

      margin = offset * module_size
      dim = module_size * @modules.size + margin * 2
      image = ChunkyPNG::Image.new(dim, dim, ChunkyPNG::Color::WHITE)

      @modules.each_index do |x|
        @modules.each_index do |y|
          image.rect(
            y * module_size + margin,
            x * module_size + margin,
            (y * module_size) + module_size + margin - 1,
            (x * module_size) + module_size + margin - 1,
            color,
            color
          ) if self.dark?(x,y)
        end
      end

      image
    end
  end
end
