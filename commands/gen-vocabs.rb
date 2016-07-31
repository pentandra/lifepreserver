usage 'gen-vocabs'
aliases :gv
summary 'generate Ruby::RDF vocabularies from ontologies on the Web'

class GenVocabs < Nanoc::CLI::CommandRunner

  def run

    require 'yaml'
    require 'erb'
    require 'linkeddata'

    load_site

    template = File.read('etc/vocabs.yaml')

    context = Nanoc::Int::Context.new(env)

    vocabs = symbolize(YAML.load(ERB.new(template).result(context.get_binding)))

    vocabs.each do |id, v|
      next if v[:alias]

      puts "Generate lib/vocab/#{id}.rb"

      cmd = "bundle exec rdf"
      if v[:patch]
        File.open("lib/vocab/#{id}.rb_p", "w") {|f| f.write v[:patch]}
        cmd += " patch --patch-file lib/vocab/#{id}.rb_p"
      end
      cmd += " serialize --uri '#{v[:uri]}' --output-format vocabulary"
      cmd += " --module-name #{v.fetch(:module_name, "Vocab")}"
      cmd += " --class-name #{v[:class_name] ? v[:class_name] : id.to_s.upcase}"
      cmd += " --strict" if v.fetch(:strict, true)
      cmd += " --extra #{URI.encode v[:extra].to_json}" if v[:extra]
      cmd += " -o lib/vocab/#{id}.rb_t"
      cmd += " '" + v.fetch(:source, v[:uri]) + "'"

      puts "  #{cmd}"

      begin
        %x{#{cmd} && mv lib/vocab/#{id}.rb_t lib/vocab/#{id}.rb}
      rescue
        puts "Failed to load #{id}: #{$!.message}"
      ensure
        %x{rm -f lib/vocab/#{id}.rb_t lib/vocab/#{id}.rb_p}
      end

    end

  end

  def env
    {
      config: Nanoc::ConfigView.new(site.config, nil)
    }
  end

end

runner GenVocabs
