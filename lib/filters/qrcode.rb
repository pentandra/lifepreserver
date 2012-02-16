require "rqrcode"
require "vpim/vcard"

class QRCodeFilter < Nanoc3::Filter

  identifier :qrcode
  type :text => :binary

  def run(content, params = {})

    # Extract params
    size = params[:size] || 4
    pixels = params[:pixels] || 3

    qr = RQRCode::QRCode.new(content, :size => size, :level => :h)
    image = qr.to_image(pixels)

    image.save(output_filename)
  end

end
