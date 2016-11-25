Class.new(Nanoc::DataSource) do
  identifier :dictionaries

  def items
    items = []

    Dir["#{@config.fetch(:dictionaries_dir)}/**/*.{yaml,dic}"].each do |dic|
      dic_filename = File.expand_path(dic)
      dic_name = File.basename(dic)
      dic_lang = Dictionary.find_hunspell_lang(Pathname.new(dic).parent.basename)
      raw_content = File.read(dic)
      kind = case raw_content.lines.first
             when /^[\d]+$/
               'extra-dictionary'
             when /^-{3,5}$/
               'acronym-dictionary'
             else
               'personal-dictionary'
             end

      binary = (kind == 'extra-dictionary')

      attributes = {
        name: dic_name,
        kind: kind,
        is_hidden: true,
      }

      entries = case kind
                when 'personal-dictionary'
                  lines = raw_content.lines.map(&:chomp)
                  { dic_entries: lines }
                when 'acronym-dictionary'
                  dic_hash = YAML.load(raw_content)
                  { acronym_mappings: dic_hash, dic_entries: dic_hash.keys }
                else
                  {}
                end

      attributes.merge!(entries)

      items << new_item(
        binary ? dic_filename : Nanoc::Int::TextualContent.new(raw_content, filename: dic_filename),
        attributes,
        Nanoc::Identifier.new("/dictionaries/#{dic_lang}/#{dic_name}"),
        binary: binary,
        checksum_data: "content=#{raw_content}",
      )
    end

    items
  end
end
