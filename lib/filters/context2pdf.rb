class Context2Pdf < Nanoc::Filter
  identifier :context2pdf
  type :text => :binary

  requires 'tmpdir', 'open3', 'fileutils'

  def run(content, params = {})
    debug = params.fetch(:debug, false)
    mode = params.fetch(:mode, 'draft')
    trackers = params.fetch(:trackers, [])

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
        cmd = ['context', '--nonstopmode', "--mode=#{mode}", "--trackers=#{trackers.join(',')}", f.path]

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
            puts output.read
            raise "ConTeXt exited with a non-zero status code #{exit_status.exitstatus} (filename: #{filename})"
          end
        end

        FileUtils.cp(f.path.sub('.tex', '.pdf'), output_filename)
      end
    end
  end
end
