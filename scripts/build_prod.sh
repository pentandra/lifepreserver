#!/bin/bash

SCRIPT_PATH=$(dirname `which $0`)

cd $SCRIPT_PATH/../

# First check to make sure bundler is installed
if [ `gem list bundler -i` = "false" ]; then
  gem install bundler
fi

# Ready, set...
bundle install --without development

# Let's make this a fresh build
rm -rf {output,tmp}

nanoc set_env --env production

nanoc compile

nanoc deploy --target public
