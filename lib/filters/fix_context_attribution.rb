Nanoc::Filter.define(:fix_context_attribution) do |content, params|
  content.gsub(/(---.+?\\par)/m, "\\startattribution\n\\1\n\\stopattribution\n")
end
