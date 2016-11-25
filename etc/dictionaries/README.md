# Spelling dictionaries

This folder contains hunspell dictionaries for spellchecking the [lifepreserver
project](https://github.com/pentandra/lifepreserver).

The primary language of this project is US English, but we include other
languages as well. Special dictionaries for these other languages are found in
subfolders that are named in accordance with the
[BCP47](https://tools.ietf.org/html/bcp47) language tag.

Don't edit the upstream base dictionaries! Instead, add a language-specific
extra dictionary that will be maintained in this project. Any files that end
with `.dic` or `.yaml` in a subdirectory and are less than 10,000 lines long
will be automatically added as an extra dictionary in the Nanoc build process.
Only the keys will be added as dictionary entries for YAML files. See [the
`dictionaries` datasource](../../lib/data_sources/dictionaries.rb) for more
information.
