# Spelling dictionaries

This folder contains hunspell dictionaries for spellchecking the [lifepreserver
project](https://github.com/pentandra/lifepreserver).

The primary language of this project is US English, but we include other
languages as well. Dictionaries for these languages are found in subfolders
that are named in accordance with hunspell naming conventions. To support a
language, simply create a folder using this naming convention, and drop your
dictionary and affix files into it.

Any files that end with `.dic` or `.yaml` in a subdirectory and do not have a
associated affix file will be automatically added as an _extra dictionary_
during the Nanoc build process. The purpose of the YAML files is to create a
foundation for doing something with acronyms in the future. For YAML files,
only the keys will be added as dictionary entries, and each will be added as an
_acronym dictionary_.

See [the `dictionaries` datasource](../../lib/data_sources/dictionaries.rb) for
more detail on how this process works, and [the `dictionary`
filter](../../lib/filters/spell_checker/dictionary.rb) for detail about mapping
between [BCP47](https://tools.ietf.org/html/bcp47) language tags and these
hunspell conventions.

## Upstream sources

All upstream base dictionaries are included in the project under the Mozilla
Public License. **Please do not edit the upstream base dictionaries!** Instead,
add a domain-specific _extra dictionary_ that can grow alongside the
language-specific base dictionary.

US English ([en_US](en_US/))
: thanks to the [SCOWL (And Friends) project](http://wordlist.aspell.net/)

French ([fr_FR](fr_FR/))
: thanks to the [Dicollete project](http://www.dicollecte.org/home.php?prj=fr)

Spanish ([es_ES](es_ES/))
: thanks to the [rla-es project](https://github.com/sbosio/rla-es)

Dutch ([nl_NL](nl_NL/))
: thanks to the [opentaal project](http://www.opentaal.org/)
