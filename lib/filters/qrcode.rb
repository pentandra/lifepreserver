class QRCodeFilter < Nanoc::Filter
  identifier :qrcode
  type :text => :binary

  requires 'rqrcode', 'chunky_png', 'optipng'

  def run(content, params = {})

    # Extract params
    size = params[:size] || 4
    module_size = params[:module_size] || 3
    color = params[:color]

    qr = RQRCode::QRCode.new(content, size: size, level: :h)
    image = qr.to_image(module_size, 4, color)

    image.save(output_filename)

    if @config[:production] and Optipng.available?
      Optipng.optimize(output_filename, level: 7 )
    end

  end

end

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
