# Spelling dictionaries

This folder contains hunspell dictionaries for spellchecking the [lifepreserver
project](https://github.com/pentandra/lifepreserver).

The primary language of this project is US English [en_US](en_US/), but we
include other languages as well. Special dictionaries for these other languages
are found in subfolders that are named in accordance with hunspell naming
conventions.

**Please do not edit the upstream base dictionaries!** Instead, add a
domain-specific _extra dictionary_ that can grow alongside the
language-specific base dictionary. Any files that end with `.dic` or `.yaml` in
a subdirectory and are less than 10,000 lines long will be automatically added
as an extra dictionary in the Nanoc build process. Keys only will be added as
dictionary entries for YAML files. See [the `dictionaries`
datasource](../../lib/data_sources/dictionaries.rb) for more detail on how this
process works, and [the `dictionary`
filter](../../lib/filters/spell_checker/dictionary.rb) for detail about mapping
between [BCP47](https://tools.ietf.org/html/bcp47) language tags and these
hunspell conventions.
