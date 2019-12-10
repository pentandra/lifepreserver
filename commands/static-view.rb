# frozen_string_literal: true

usage 'view [options]'
summary 'start the web server that serves static files'
description <<~EOS
  Start the static web server. Unless specified, the web server will run on port
  3000 and listen on all IP addresses. Running this static web server requires
  `adsf` (not `asdf`!).
EOS

required :H, :handler, 'specify the handler to use (webrick/mongrel/...)'
required :o, :host,    'specify the host to listen on (default: 127.0.0.1)', default: '127.0.0.1'
required :p, :port,    'specify the port to listen on (default: 3000)', transform: Nanoc::CLI::Transform::Port, default: 3000
flag :L, :'live-reload', 'reload on changes'
no_params

module LifePreserver
  class StaticView < ::Nanoc::CLI::Commands::View
    def run
      load_adsf

      config = Nanoc::Core::ConfigLoader.new.new_from_cwd

      # Create output dir so that viewer/watcher doesn’t explode.
      FileUtils.mkdir_p(config.output_dir)

      # Configure the static root as the site root
      if (view_config = config[:view])
        site_root = File.join(config.output_dir, view_config.fetch(:static_root, ''))
      end

      server =
        Adsf::Server.new(
          root: File.absolute_path(site_root),
          live: options[:'live-reload'],
          index_filenames: config[:index_filenames],
          host: options[:host],
          port: options[:port],
          handler: options[:handler],
        )

      server.run
    end
  end
end

runner LifePreserver::StaticView
