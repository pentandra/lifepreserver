# Life Preserver

This is the website for [Pentandra Research Solutions][pentandra].

Buckminster Fuller provides an apt description of the current situation in
research communications in the first paragraph of his [Operating Manual for
Spaceship Earth]:

> I am enthusiastic over humanity's extraordinary and sometimes very timely
> ingenuities. If you are in a shipwreck and all the boats are gone, a piano
> top buoyant enough to keep you afloat that comes along makes a fortuitous
> life preserver. But this is not to say that the best way to design a life
> preserver is in the form of a piano top. I think that we are clinging to a
> great many piano tops in accepting yesterday's fortuitous contrivings as
> constituting the only means for solving a given problem.

We're in a state of intellectual shipwreck and all the lifeboats have been
taken. We're on the verge of a new era of communications but we're still
clinging onto yesterday's solutions and thought-forms.

## Development

The source for this project is built using [Nanoc].

### Before compiling…

The following external dependencies or system packages need to be installed and
in scope before compiling:

* Ruby (with [bundler], i.e. `gem install bundler`)
* [pandoc] (>= 2.0) for markdown processing
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
$ bundle exec nanoc [compile] [--verbose] [--env=development]
```

### Start the HTTP server and request the page in your browser

Use either the `static-view` command, which starts an [Adsf::Server] instance
at the static root of the website for simple browsing of statically generated
pages, or the `server` command, which launches a full-fledged [OpenResty]
application server which includes the dynamic aspects of the site as well.

| bundle exec command | scheme                             | port                                                                             |
|---------------------|------------------------------------|----------------------------------------------------------------------------------|
| `nanoc static-view` | HTTP                               | [3000](http://localhost:3000/)                                                   |
| `nanoc server`      | HTTP and HTTPS (using a test cert) | [3125](http://localhost:3125/) and [4125](https://localhost:4125/), respectively |

Then view the page in your browser.

## Testing

### Before testing...

Install test dependencies.

* [Test::Nginx] and Perl for running application server tests

## Contributing

This repository uses [GitFlow] to manage development and release activity. When
starting a new feature, page, blog post, et cetera, please create a new branch
for it based on the `develop` branch to ease review and integration.

* Do your best to adhere to the existing coding conventions and idioms.
* Don’t use hard tabs, and don’t leave trailing whitespace on any line. Before
  committing, run `git diff --check` to make sure of this.

## Environments

This project uses Nanoc environments for `development`, `staging`, and
`production` builds. Be sure to set the `NANOC_ENV` shell variable or command
line argument to set the current environment before a build, for example:

```bash
$ export NANOC_ENV=development          # before running Nanoc commands
# or
$ NANOC_ENV=development bundle exec nanoc [command] # with each command
# or
$ bundle exec nanoc [command] --env=development     # with each command
```

A `production` build must happen on a git tag, or the build will abort.

For sake of completeness, a `static_only` environment exists that will build
only the static items of the website, to give a build environment that avoids
dependence upon any Lua libraries that may be needed to build the dynamic code
upon which OpenResty runs.

## Thanks

Thanks to the people that helped me come to grips with the power of Nanoc,
including:

* Dennis Defreyne, of course (https://github.com/ddfreyne/nanoc)
* Lifepillar (https://github.com/lifepillar/nanoc4-template) for some new
  ideas during the transition to Nanoc 4.

Also, please see [the colophon][colophon] for more raving attributions!

[pentandra]: <https://pentandra.com/>
[Nanoc]: <http://nanoc.ws/>
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
[Operating Manual for Spaceship Earth]: <https://en.wikipedia.org/wiki/Operating_Manual_for_Spaceship_Earth>
[Test::Nginx]: <https://github.com/openresty/test-nginx>
[Adsf::Server]: <https://github.com/ddfreyne/adsf>
