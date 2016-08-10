usage 'gen-vocabs'
aliases :gv
summary 'generate Ruby::RDF vocabularies from ontologies on the Web'

flag :a, :all,  'generate all vocabularies'
flag :L, :list, 'list all vocabularies'

class GenVocabs < Nanoc::CLI::CommandRunner

  def run

    require 'yaml'
    require 'erb'
    require 'linkeddata'

    validate_options_and_arguments

    load_site

    template = File.read('etc/vocabs.yaml')

    context = Nanoc::Int::Context.new(env)

    vocabs = symbolize(YAML.load(ERB.new(template).result(context.get_binding)))

    if options[:list]
      list_vocabs(vocabs)
      return
    end

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

  protected

  def env
    self.class.env_for_site(site)
  end

  def self.env_for_site(site)
    {
      config: Nanoc::ConfigView.new(site.config, nil)
    }
  end

  def validate_options_and_arguments
    if arguments.empty? && !options[:all] && !options[:list]
      raise(Nanoc::Int::Errors::GenericTrivial,
            "nothing to do (pass either --all, --list, or a list of prefixes)"
           )
    end
  end

  def list_vocabs(vocabs)
    puts "Available vocabularies:"
    puts
    puts vocabs.map { |id, v| "#{v.fetch(:class_name, id.to_s.upcase)}: #{v[:uri]}" }.sort.join("\n")
  end

end

runner GenVocabs
