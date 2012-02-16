require "rqrcode"
require "vpim/vcard"

class QRCodeFilter < Nanoc3::Filter

  identifier :qrcode
  type :text => :binary

  def run(content, params = {})

    # Extract params
    size = params[:size] || 4
    chunk_size = params[:chunk_size] || 3
    color = params[:color]

    qr = RQRCode::QRCode.new(content, :size => size, :level => :h)
    image = qr.to_image(chunk_size, 4, color)

    image.save(output_filename)
  end

end
