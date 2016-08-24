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
* [hunspell](https://hunspell.github.io/) for spell-checking
* [git](https://git-scm.com/) for version tagging and history management
* A JavaScript runtime, such as [node](https://nodejs.org/en/)
  (or any runtime that [ExecJS](https://github.com/sstephenson/execjs) supports) 
  for [UglifyJS](https://github.com/mishoo/UglifyJS2) and [bower](https://bower.io/).
    _(note: currently you need to install `bower` manually, e.g. `npm install bower -g`)_

### Then clone this repo, install bower components and Ruby gems…

As follows:

```bash
$ git clone https://github.com/pentandra/lifepreserver.git
$ cd lifepreserver
$ bower install
$ bundle install
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

## Thanks

Thanks to the people that helped me come to grips with the power of nanoc,
including:

* Vincent Driessen (https://github.com/nvie/blog)
* Dennis Defreyne, of course (https://github.com/ddfreyne/nanoc)
* Lifepillar (https://github.com/lifepillar/nanoc4-template) for some new
  ideas.
