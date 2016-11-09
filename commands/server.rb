usage 'server [options]'
summary 'start the dynamic web server (nginx/OpenResty)'
description <<-EOS
Start the dynamic web server. Running this web server requires OpenResty
to be installed and in scope.
EOS

required :c, :conf,   'specify the configuration file to use (default: nginx.conf)'
required :g, :global, 'specify any global directives (default: daemon off;)'

module LifePreserver
  class Server < ::Nanoc::CLI::CommandRunner
    NGINX_BIN = 'nginx'
    NGINX_SEARCH_PATHS = [
      '/usr/local/openresty/nginx/sbin/',
      '/usr/local/opt/openresty/bin/',
      '/usr/local/bin/',
      '/usr/sbin/',
      '/opt/openresty/nginx/sbin/'
    ]

    class Error < ::Nanoc::Int::Errors::Generic
      def initialize(command, exit_code)
        @command   = command
        @exit_code = exit_code
      end

      def message
        "command exited with a nonzero status code #{@exit_code} (command: #{@command.join(' ')})"
      end
    end

    def run
      require 'open3'

      load_site

      c = Nanoc::CLI::ANSIStringColorizer

      conf = options[:conf] || 'nginx.conf'
      directives = options[:global] || 'daemon off;'


      nginx = find_nginx
      output_dir = site.config[:output_dir]
      cmd = [ nginx, '-p', output_dir, '-c', conf, '-g', directives ]

      Open3.popen3(*cmd) do |_stdin, stdout, stderr, wait_thr|
        puts c.c("Starting OpenResty with config file (#{File.join(output_dir, conf)})", :bold)
        puts "OpenResty executable: #{nginx}"
        puts "Global directives: #{directives}"

        { stdout: stdout, stderr: stderr }.each do |key, stream|
          Thread.new do
            while (line = stream.gets)
              puts (key == :stderr) ? c.c(line.chomp, :yellow) : line
            end
          end
        end

        wait_thr.join # don't exit until the external process is done

        exit_status = wait_thr.value
        unless exit_status.success?
          raise Error.new(cmd, exit_status.to_i)
        end
      end
    end

    protected

    def find_nginx
      NGINX_SEARCH_PATHS.each do |path|
        to_check = path + NGINX_BIN
        if File.file?(to_check) && openresty?(to_check)
          return to_check
        end
      end

      # As a last resort, check the PATH
      require 'mkmf'
      to_check = find_executable0(NGINX_BIN)
      if to_check && openresty?(to_check)
        return to_check
      end

      raise "Cannot find the OpenResty executable in any of the following places: #{NGINX_SEARCH_PATHS.join(', ')} or in the current path (#{ENV['PATH']})"
    end

    def openresty?(path_to_check)
      output, _status = Open3.capture2e(path_to_check, '-v')
      output && output['openresty']
    end
  end
end

runner LifePreserver::Server
