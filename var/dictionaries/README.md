# Spelling dictionaries

This folder contains hunspell dictionaries for spellchecking the [LifePreserver
project](https://github.com/pentandra/lifepreserver).

The primary language of this project is US English, but we support checking the
spelling of other languages as well. In HTML or XHTML, simply add the proper
[BCP47] code to a `lang` or `xml:lang` attribute of the enclosing element of
the text you want to have checked.

Dictionaries for these languages are grouped here into subfolders corresponding
to specific languages and regions. To support a language, simply create a
folder and put your base dictionary and the associated affix file into it. Both
the folder and the base dictionary and affix files should be named using the
following naming convention, described in [Augmented Backus-Naur Form][ABNF]:

```abnf
naming-convention = langtag "/" langtag suffix
langtag           = language "_" region
language          = 2*3ALPHA       ; shortest ISO 639 code
region            = 2ALPHA         ; ISO 3166-1 code
suffix            = "." extension
extension         = "dic"          ; for Hunspell dictionary files
                  / "aff"          ; for Hunspell affix files
                  / "yaml"         ; for acronym dictionary files
                  / "yml"
```

As Hunspell dictionary files and the simple tags from the Ruby [locale] library
already follow this convention, I'm hoping it should not be too difficult to
manage this. Since some Hunspell dictionaries have several base variants, it is
perfectly fine to (soft) link one of these variants using the convention above,
as I have done with `en_US/en_US-large.{aff,dic}`.

In order to support multiple extra and/or personal dictionaries per language,
we have adopted the following convention: to each base dictionary found in a
given folder, any file that ends with `.dic` or `.yaml` in that folder (and
does not have a associated affix file, i.e. is not a base dictionaries itself)
will be added as a _personal_ or _extra_ dictionary during the Nanoc build
process and supplement their respective base dictionaries.

The YAML files are used for identifying and defining acronyms. Acronym keys and
long-form values will be added as dictionary entries in an _acronym
dictionary_. The acronym terms are added to their respective base dictionaries.
In addition, the [the `abbreviate` filter](../../lib/filters/abbreviate.rb) can
use the long-form values to supplement some representations.

See [the `dictionaries` datasource](../../lib/data_sources/dictionaries.rb) for
more detail on how the Nanoc dictionary items are created from these files, and
[the `dictionary` helper](../../lib/helpers/dictionaries.rb) for more detail
about mapping between [BCP47] language tags and these hunspell conventions.

## Upstream sources

All upstream base dictionaries are included in the project under the Mozilla
Public License. **Please do not edit the upstream base dictionaries in this
repository!** Instead, add a domain-specific _extra dictionary_ that can grow
alongside the language-specific base dictionary.

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

[BCP47]: https://tools.ietf.org/html/bcp47
[ABNF]: http://www.ietf.org/rfc/rfc5234.txt
[locale]: https://github.com/ruby-gettext/locale
