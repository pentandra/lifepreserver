# frozen_string_literal: true

class QRCode < Nanoc::Filter
  identifier :qrcode
  type :text => :binary

  requires 'rqrcode'

  def run(content, params = {})
    size = params[:size] || 4
    module_size = params[:module_size] || 3
    color = params[:color]

    qr = RQRCode::QRCode.new(content, size: size, level: :h)
    image = qr.to_image(module_size, 4, color)

    image.save(output_filename)
  end
end
