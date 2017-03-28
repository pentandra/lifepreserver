class ImageOptimizerFilter < Nanoc::Filter
  identifier :image_optimizer
  type :binary

  requires 'image_optimizer'

  def run(filename, params = {})
    # first, copy the file to the destination
    FileUtils.copy_file(filename, output_filename)

    options = {
      identify: true,
    }

    # then optimize in place
    ImageOptimizer.new(output_filename, options.merge(params)).optimize
  end
end
