# Lifepreserver

This is the website for [Pentandra Research Solutions](https://pentandra.com/).

## Development

The source for this project is built using [nanoc](http://nanoc.ws/).

### Before compiling…

The following external dependencies or system packages need to be installed and
in scope before compiling:

* Ruby (with [bundler](http://bundler.io/), i.e. `gem install bundler`)
* Python (for [pygments](http://pygments.org/))
* [pandoc](http://pandoc.org/) and [ConTeXt](http://wiki.contextgarden.net/)
  for PDF generation of reports
* [optipng](http://optipng.sourceforge.net/) (optional) for optimizing PNG images
* [hunspell](https://hunspell.github.io/) for spell-checking (with the [optional
  fix](https://github.com/en-wl/wordlist/issues/122) for the en_US apostrophe
  handling)
* [git](https://git-scm.com/) for version tagging and history management
* A JavaScript runtime, such as [node](https://nodejs.org/en/)
  (or any runtime that [ExecJS](https://github.com/sstephenson/execjs) supports) 
  for [UglifyJS](https://github.com/mishoo/UglifyJS2) and [bower](https://bower.io/).
    _(note: currently you need to install `bower` manually, e.g. `npm install bower -g`)_

### Then clone this repo (including submodules), install bower components and Ruby gems…

As follows:

```bash
$ git clone https://github.com/pentandra/lifepreserver.git
$ cd lifepreserver
$ git submodule init
$ git submodule update
$ bower install
$ bundle install
```

### Add experimental Nanoc feature for environments support (for now)

```bash
$ export NANOC_FEATURES=environments # or place this in `.bashrc` or equivalent
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

And view the page in your browser.

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

Also, please see [the colophon](https://pentandra.com/colophon/) for more
raving attributions!

[GitFlow]: <http://nvie.com/posts/a-successful-git-branching-model/>
