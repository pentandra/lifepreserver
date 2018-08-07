# Spelling dictionaries

This folder contains hunspell dictionaries for spellchecking the [lifepreserver
project](https://github.com/pentandra/lifepreserver).

The primary language of this project is US English, but we support checking the
spelling of other languages as well. In HTML or XHTML, simply add the proper
[BCP47](https://tools.ietf.org/html/bcp47) code to a `lang` or `xml:lang`
attribute of the enclosing element of the text you want to have checked.

Dictionaries for these languages are grouped here into subfolders corresponding
to specific languages and regions. To support a language, simply create a
folder and put your base dictionary and the associated affix file into it.

In order to support multiple extra and/or personal dictionaries per language,
we have adopted the following convention: to each base dictionary found in a
given folder, any file that ends with `.dic` or `.yaml` in that folder (and
does not have a associated affix file, i.e. is not a base dictionaries itself)
will be added as a _personal_ or _extra_ dictionary during the Nanoc build
process.

See [the `dictionaries` datasource](../../lib/data_sources/dictionaries.rb) for
more detail on how this process works, and [the `dictionary`
helper](../../lib/filters/spell_checker/dictionary.rb) for more detail about
mapping between [BCP47](https://tools.ietf.org/html/bcp47) language tags and
these hunspell conventions.

The purpose of the YAML files is to create a foundation for doing something
with acronyms in the future. For YAML files, only the keys will be added as
dictionary entries, and each will be added as an _acronym dictionary_.

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

German ([de_DE](de_DE/))
: thanks to [Björn Jacke](https://www.j3e.de/ispell/igerman98/)

Italian ([it_IT](it_IT/))
: thanks to the [Linguistico project](http://sourceforge.net/projects/linguistico/)

*[HTML]: HyperText Markup Language
*[XHTML]: eXtensible HyperText Markup Language
*[BCP47]: BCP 47: Tags for Identifying Languages, comprised of RFC5646 and RFC4647
