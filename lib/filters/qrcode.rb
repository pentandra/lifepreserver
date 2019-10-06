# frozen_string_literal: true

class QRCode < Nanoc::Filter
  identifier :qrcode
  type :text => :binary

  requires 'rqrcode', 'chunky_png'

  # Encode content into a qrcode PNG
  #
  # @param [String] content the content to encode
  # @param [Hash] params the options for the qrcode
  #
  # @options params [nil] :version to autoselect the smallest version of the qrcode
  #   based on the length of the content
  # @options params [Integer] :version the specific version of the qrcode desired
  # @see https://www.qrcode.com/en/about/version.html
  #
  # @options params [:l, :m, :q, :h] :level (:h) the error correction level
  # @see https://www.qrcode.com/en/about/error_correction.html
  #
  # @options params [Integer] :image_size (90) the desired output image size in pixels
  # @options params [String] :color the foreground color
  # @options params [String] :fill the background color
  def run(content, params = {})
    version = params[:version]
    level = params.fetch(:level, :h)

    # Rendering options
    image_size = params.fetch(:image_size, 90)
    color = params.fetch(:color, ChunkyPNG::Color::BLACK)
    fill = params.fetch(:fill, ChunkyPNG::Color::WHITE)

    qr = RQRCode::QRCode.new(content, size: version, level: level)
    qr.as_png(color: color,
              fill: fill,
              size: image_size,
              color_mode: ChunkyPNG::COLOR_INDEXED,
              file: output_filename)
  end
end
