# frozen_string_literal: true

class CompassWithSass < Nanoc::Filter
  identifier :compass

  requires 'compass'

  def run(content, params = {})
    config_file = params.fetch(:config_file, 'config.rb')

    Compass.add_project_configuration(config_file)
    params = params.merge(Compass.sass_engine_options)

    # Delegate to Nanoc's sass filter
    Nanoc::Filters::SassFilter.new(@assigns).setup_and_run(content, params)
  end
end
