class Context2Pdf < Nanoc::Filter
  identifier :context2pdf
  type :text => :binary

  requires 'tmpdir', 'open3', 'fileutils'

  class Error < ::Nanoc::Int::Errors::Generic
    def initialize(command, exit_code)
      @command   = command
      @exit_code = exit_code
    end

    def message
      "ConTeXt exited with a nonzero status code #{@exit_code} (command: #{@command.join(' ')})"
    end
  end

  def run(content, params = {})
    debug = params.fetch(:debug, false)
    mode = Array(params.fetch(:mode, 'draft')).join(',')
    trackers = Array(params.fetch(:trackers, [])).join(',')

    unless system('which', 'context', out: '/dev/null')
      warn('Warning: `context` not found; PDF generation disabled.')
      File.write(output_filename, '')
      return
    end

    Dir.mktmpdir('nanoc-context') do |dir|
      File.open("#{dir}/document.tex", 'w+') do |f|
        f.write(content)
        f.flush

        c = Nanoc::CLI::ANSIStringColorizer
        cmd = ['context', '--nonstopmode', "--mode=#{mode}", "--trackers=#{trackers}", f.path]

        Open3.popen3(*cmd, chdir: dir) do |_stdin, stdout, stderr, thread|

          if debug
            { stdout: stdout, stderr: stderr }.each do |key, stream|
              Thread.new do
                while (line = stream.gets)
                  $stderr.print key == :stderr ? c.c(line, :yellow) : line
                end
              end
            end
          end

          thread.join # don't exit until the external process is done

          exit_status = thread.value

          unless exit_status.success?
            raise Error.new(cmd, exit_status.to_i)
          end
        end

        FileUtils.cp(f.path.sub('.tex', '.pdf'), output_filename)
      end
    end
  end
end
