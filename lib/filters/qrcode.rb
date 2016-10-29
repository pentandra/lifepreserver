class QRCode < Nanoc::Filter
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
