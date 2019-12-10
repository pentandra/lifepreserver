# frozen_string_literal: true

module LifePreserver
  module Filters
    class QRCode < Nanoc::Filter
      identifier :qrcode
      type :text => :binary # rubocop:disable Style/HashSyntax

      requires 'rqrcode', 'chunky_png'

      # Encode content into a qrcode PNG
      #
      # @param [String] content the content to encode
      # @param [Hash] params the options for the qrcode
      #
      # @option params [nil] :version To autoselect the smallest version of the qrcode
      #   based on the length of the content.
      # @option params [Integer] :version To manually select a specific version of the
      #   qrcode.
      # @see https://www.qrcode.com/en/about/version.html
      #
      # @option params [:l, :m, :q, :h] :level (:h) the error correction level
      # @see https://www.qrcode.com/en/about/error_correction.html
      #
      # @option params [Integer] :image_size (90) The desired output image size in pixels.
      # @option params [Integer, String] :color ('black') The foreground color to use.
      # @option params [Integer, String] :fill ('white') The background color to use.
      # @option params [Integer] :color_mode The color mode to use. Use one of the
      #   +ChunkyPNG::COLOR_*+ constants.
      # @see ChunkyPNG#Color
      # @option params [Boolean] :interlace (false) Whether to use interlacing.
      def run(content, params = {})
        version = params[:version]
        level = params.fetch(:level, :h)

        # Rendering options
        image_size = params.fetch(:image_size, 90)
        color = params.fetch(:color, ChunkyPNG::Color::BLACK)
        fill = params.fetch(:fill, ChunkyPNG::Color::WHITE)
        interlace = params.fetch(:interlace, false)

        qr = RQRCode::QRCode.new(content, size: version, level: level)
        qr.as_png(color: color,
                  fill: fill,
                  size: image_size,
                  color_mode: ChunkyPNG::COLOR_INDEXED,
                  interlace: interlace,
                  file: output_filename)
      end
    end
  end
end
