Class.new(Nanoc::DataSource) do
  identifier :dictionaries

  def items
    items = []

    Dir["#{@config.fetch(:dictionaries_dir)}/**/*.{yaml,dic}"].each do |dic|
      dic_filename = File.expand_path(dic)
      dic_name = File.basename(dic)
      dic_lang = SpellChecker::Dictionary.find_hunspell_lang(Pathname.new(dic).parent.basename)
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

      raw_content = nil
      entries = case kind
                when 'personal-dictionary'
                  raw_content = File.read(dic)
                  lines = raw_content.lines.map(&:chomp)
                  { dic_entries: lines }
                when 'acronym-dictionary'
                  raw_content = File.read(dic)
                  dic_hash = YAML.load(raw_content)
                  { acronym_mappings: dic_hash, dic_entries: dic_hash.keys }
                else
                  {}
                end

      attributes = {
        name: dic_name,
        kind: kind,
        lang: dic_lang,
        is_hidden: true,
      }.merge(entries)

      items << new_item(
        binary ? dic_filename : Nanoc::Int::TextualContent.new(raw_content, filename: dic_filename),
        attributes,
        Nanoc::Identifier.new("/dictionaries/#{dic_lang}/#{dic_name}"),
        binary: binary,
        checksum_data: binary ? "word_count=#{first_line}" : "content=#{raw_content}",
      )
    end

    items
  end
end
