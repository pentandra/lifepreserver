# Lifepreserver

This is the website for [Pentandra Research Solutions](https://pentandra.com/).

## Development

The source for this project is built using [nanoc](http://nanoc.ws/).

### Before compiling…

The following external dependencies or system packages need to be installed and
in scope before compiling:

* Ruby (with [bundler], i.e. `gem install bundler`)
* [pandoc] for markdown processing
* [ConTeXt] for PDF generation of reports
* [hunspell] _(>= 1.3.4)_ for spell-checking
* [git] for version tagging and history management
* A JavaScript runtime, such as [node] (or any runtime that [ExecJS] supports),
  for [UglifyJS] and [bower]. _(note: currently you need to install `bower`
    manually, e.g. `npm install bower -g`)_

#### Optional dependencies

* [optipng], [pngquant], [jpegoptim], and [gifsicle] for optimizing PNG, JPEG,
  and GIF images, respectively.
* A Java 8 runtime for running the [Nu HTML] checker.
* [OpenResty] for running the dynamic parts of the site via `nanoc server`.

### Then clone this repo (including submodules), install bower components and Ruby gems…

As follows:

```bash
$ git clone https://github.com/pentandra/lifepreserver.git
$ cd lifepreserver
$ git submodule init
$ git submodule update
$ bower install
$ bundle install --with development test
```

### And compile!

```bash
$ bundle exec nanoc [compile] [--verbose]
```

### Start the HTTP server and request the page in your browser

```bash
# either
$ nanoc view   # if you are only dealing with statically generated pages
# or
$ nanoc server # if you are dealing with both the static and dynamic aspects of the site
```

And view the page in your browser at [port 3000](http://localhost:3000/) for
`nanoc view` or [port 4125](https://localhost:4125/) for `nanoc server`.

## Contributing

This repository uses [GitFlow] to manage development and release activity. When
starting a new feature, page, blog post, et cetera, please create a new branch
for it based on the `develop` branch to ease review and integration.

* Do your best to adhere to the existing coding conventions and idioms.
* Don’t use hard tabs, and don’t leave trailing whitespace on any line. Before committing, run `git diff --check` to make sure of this.

## Thanks

Thanks to the people that helped me come to grips with the power of nanoc,
including:

* Dennis Defreyne, of course (https://github.com/ddfreyne/nanoc)
* Lifepillar (https://github.com/lifepillar/nanoc4-template) for some new
  ideas during the transition to Nanoc 4.

Also, please see [the colophon][colophon] for more raving attributions!

[GitFlow]: <http://nvie.com/posts/a-successful-git-branching-model/>
[Nu HTML]: <https://validator.github.io/validator/>
[UglifyJS]: <https://validator.github.io/validator/>
[bower]: <https://bower.io/>
[ExecJS]: <https://github.com/sstephenson/execjs>
[node]: <https://nodejs.org/en/>
[apostrophe fix]: <https://github.com/en-wl/wordlist/issues/122>
[optipng]: <http://optipng.sourceforge.net/>
[pngquant]: <https://pngquant.org/>
[jpegoptim]: <http://freecode.com/projects/jpegoptim>
[gifsicle]: <https://www.lcdf.org/gifsicle/>
[hunspell]: <https://hunspell.github.io/>
[pandoc]: <http://pandoc.org/>
[git]: <https://git-scm.com/>
[ConTeXt]: <http://wiki.contextgarden.net/>
[pygments]: <http://pygments.org/>
[bundler]: <http://bundler.io/>
[colophon]: <https://pentandra.com/colophon/>
[OpenResty]: <http://openresty.org/>
