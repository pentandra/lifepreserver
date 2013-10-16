#!/bin/bash

# First check to make sure bundler is installed
if [ `gem list bundler -i` = "false" ]; then
  gem install bundler
fi

# Ready, set...
bundle install

# Let's make this a fresh build
rm -rf {output,tmp}

nanoc set_env --env production

nanoc compile

nanoc deploy --target public
