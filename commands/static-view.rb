#frozen_string_literal: true

usage 'view [options]'
summary 'start the web server that serves static files'
description <<~EOS
  Start the static web server. Unless specified, the web server will run on port
  3000 and listen on all IP addresses. Running this static web server requires
  `adsf` (not `asdf`!).
EOS

required :H, :handler, 'specify the handler to use (webrick/mongrel/...)'
required :o, :host,    'specify the host to listen on (default: 127.0.0.1)'
required :p, :port,    'specify the port to listen on (default: 3000)'

module LifePreserver
  class StaticView < ::Nanoc::CLI::Commands::View
    DEFAULT_HANDLER_NAME ||= :thin

    def run
      load_adsf
      require 'rack'

      config = Nanoc::Int::ConfigLoader.new.new_from_cwd

      # Set options
      options_for_rack = {
        Port: (options[:port] || 3000).to_i,
        Host: (options[:host] || '127.0.0.1'),
      }

      # Get handler
      if options.key?(:handler)
        handler = Rack::Handler.get(options[:handler])
      else
        begin
          handler = Rack::Handler.get(DEFAULT_HANDLER_NAME)
        rescue LoadError
          handler = Rack::Handler::WEBrick
        end
      end

      # Build app
      view_config = config.fetch(:view, {})
      site_root = config[:output_dir] + view_config.fetch(:static_root, String.new)
      index_filenames = config[:index_filenames]

      app = Rack::Builder.new do
        use Rack::CommonLogger
        use Rack::ShowExceptions
        use Rack::Lint
        use Rack::Head
        use Adsf::Rack::IndexFileFinder,
          root: site_root,
          index_filenames: index_filenames
        run Rack::File.new(site_root)
      end.to_app

      # Print a link
      url = "http://#{options_for_rack[:Host]}:#{options_for_rack[:Port]}/"
      puts "View the site at #{url}"

      # Run autocompiler
      handler.run(app, options_for_rack)
    end
  end
end

runner LifePreserver::StaticView
