class Context2Pdf < Nanoc::Filter
  identifier :context2pdf
  type :text => :binary

  requires 'open3', 'fileutils'

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
    mode = [@config.unwrap.env_name, params.fetch(:mode, 'draft')].join(',')
    trackers = Array(params.fetch(:trackers, [])).join(',')

    unless system('which', 'context', out: '/dev/null')
      warn('Warning: `context` not found; PDF generation disabled.')
      File.write(output_filename, '')
      return
    end

    dir = self.class.tmp_path_for(@config[:output_dir], @item_rep)
    FileUtils.mkdir_p(dir)

    FileUtils.cd(dir) do
      File.open('document.tex', 'w') do |f|
        f.write(content)
        f.flush

        c = Nanoc::CLI::ANSIStringColorizer
        cmd = ['context', '--nonstopmode', "--mode=#{mode}", "--trackers=#{trackers}", f.path]

        Open3.popen3(*cmd) do |_stdin, stdout, stderr, thread|

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

  def self.tmp_path_for(output_dir, item_rep)
    rep_tmp_path = Digest::SHA1.hexdigest("#{item_rep.item.identifier}-#{item_rep.name}")[0..12]
    File.join(tmp_path_prefix(output_dir), rep_tmp_path)
  end

  def self.tmp_path_prefix(output_dir)
    dir = Digest::SHA1.hexdigest(output_dir)[0..12]
    File.join('tmp', 'context', dir)
  end
end
