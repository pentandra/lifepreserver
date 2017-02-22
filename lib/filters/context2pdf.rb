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

    odebug(content) if debug

    Dir.mktmpdir('nanoc-context') do |dir|
      File.open("#{dir}/document.tex", 'w+') do |f|
        f.write(content)
        f.flush

        Open3.popen2e('context', '--nonstopmode', "--mode=#{mode}", "--trackers=#{trackers.join(',')}", f.path, chdir: dir) do |_stdin, output, thread|
          status = thread.value

          unless status.success?
            puts output.read
            raise "ConTeXt exited with a non-zero status code #{status.exitstatus} (filename: #{filename})"
          end

          odebug(output) if debug
        end

        FileUtils.cp(f.path.sub('.tex', '.pdf'), output_filename)
      end
    end
  end

  private

  def odebug(msg)
    msg.each_line { |l| puts "\033[1;31mDEBUG:\033[0m #{l}" }
  end
end
