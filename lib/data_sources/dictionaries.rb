require 'ffi/hunspell'

Class.new(Nanoc::DataSource) do
  identifier :dictionaries

  def up
    unless @config[:directories].nil?
      FFI::Hunspell.directories = @config.fetch(:directories).flat_map do |d|
        Dir["#{d}/*/"]
      end
    end
  end

  def items
    items = []

    FFI::Hunspell.directories.each do |dir|
      Dir["#{dir}/*.{dic,yaml}"].each do |dic|
        next if File.symlink?(dic)

        first_line = File.open(dic, &:readline)
        kind = case first_line
               when /^(?<word_count>\d+)$/
                 # FIXME is there a better way to distinguish these?
                 $LAST_MATCH_INFO[:word_count].to_i > 10_000 ? 'base-dictionary' : 'extra-dictionary'
               when /^-{3,5}$/
                 'acronym-dictionary'
               else
                 'personal-dictionary'
               end

        binary = %w(base-dictionary extra-dictionary).include?(kind)

        entries = case kind
                  when 'personal-dictionary'
                    raw_content = File.read(dic)
                    lines = raw_content.lines.map(&:chomp)
                    { entries: lines }
                  when 'acronym-dictionary'
                    raw_content = File.read(dic)
                    entries_hash = YAML.load(raw_content)
                    { acronym_mappings: entries_hash, entries: entries_hash.keys }
                  else
                    {}
                  end

        attributes = {
          name: File.basename(dic, '.*'),
          kind: kind,
        }.merge(entries)

        filename = File.expand_path(dic)
        items << new_item(
          binary ? filename : Nanoc::Int::TextualContent.new(raw_content, filename: filename),
          attributes,
          Nanoc::Identifier.new("/dictionaries/#{File.basename(dir)}/#{File.basename(dic)}"),
          binary: binary,
          checksum_data: binary ? "word_count=#{first_line}" : "content=#{raw_content}",
        )
      end
    end

    items
  end
end
