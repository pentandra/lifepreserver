usage 'gen-vocabs'
aliases :gv
summary 'generate Ruby::RDF vocabularies from ontologies on the Web'

flag :a, :all,  'generate all vocabularies'
flag :L, :list, 'list all vocabularies'

class GenVocabs < ::Nanoc::CLI::CommandRunner
  def run
    require 'yaml'
    require 'erb'
    require 'linkeddata'
    require 'active_support/core_ext/hash/keys'

    validate_options_and_arguments

    @site = load_site

    template = File.read('etc/vocabs_additional.yaml')

    context = Nanoc::Int::Context.new(env)

    vocabs = YAML.safe_load(ERB.new(template).result(context.get_binding)).deep_symbolize_keys

    if options[:list]
      list_vocabs(vocabs)
      return
    end

    vocabs.each do |id, v|
      next if v[:alias]

      puts "Generate lib/vocab/#{id}.rb"

      cmd = 'bundle exec rdf'
      if v[:patch]
        File.open("lib/vocab/#{id}.rb_p", 'w') { |f| f.write v[:patch] }
        cmd += " patch --patch-file lib/vocab/#{id}.rb_p"
      end
      cmd += " serialize --uri '#{v[:uri]}' --output-format vocabulary"
      cmd += " --module-name #{v.fetch(:module_name, 'RDF::Vocab')}"
      cmd += " --class-name #{v[:class_name] ? v[:class_name] : id.to_s.upcase}"
      cmd += ' --strict' if v.fetch(:strict, true)
      cmd += " --extra #{URI.encode v[:extra].to_json}" if v[:extra]
      cmd += " -o lib/vocab/#{id}.rb_t"
      cmd += ' "' + v.fetch(:source, v[:uri]) + '"'

      puts "  #{cmd}"

      begin
        `#{cmd} && mv lib/vocab/#{id}.rb_t lib/vocab/#{id}.rb`
      rescue
        require 'English'
        puts "Failed to load #{id}: #{$ERROR_INFO.message}"
      ensure
        `rm -f lib/vocab/#{id}.rb_t lib/vocab/#{id}.rb_p`
      end
    end
  end

  protected

  def validate_options_and_arguments
    if arguments.empty? && !options[:all] && !options[:list]
      raise(Nanoc::Int::Errors::GenericTrivial, 'nothing to do (pass either --all, --list, or a list of prefixes)')
    end
  end

  def list_vocabs(vocabs)
    puts 'Available vocabularies:'
    puts
    puts vocabs.map { |id, v| "#{v.fetch(:class_name, id.to_s.upcase)}: #{v[:uri]}" }.sort.join("\n")
  end

  def env
    self.class.env_for_site(@site)
  end

  def self.reps_for(site)
    Nanoc::Int::ItemRepRepo.new.tap do |reps|
      action_provider = Nanoc::Int::ActionProvider.named(:rule_dsl).for(site)
      builder = Nanoc::Int::ItemRepBuilder.new(site, action_provider, reps)
      builder.run
    end
  end

  def self.view_context_for(site)
    Nanoc::ViewContext.new(
      reps: reps_for(site),
      items: site.items,
      dependency_tracker: Nanoc::Int::DependencyTracker::Null.new,
      compilation_context: nil,
      snapshot_repo: nil,
    )
  end

  def self.env_for_site(site)
    view_context = view_context_for(site)

    {
      items: Nanoc::ItemCollectionWithRepsView.new(site.items, view_context),
      layouts: Nanoc::LayoutCollectionView.new(site.layouts, view_context),
      config: Nanoc::ConfigView.new(site.config, view_context),
    }
  end
end

runner GenVocabs
