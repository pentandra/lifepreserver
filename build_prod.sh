#!/bin/bash

# Ready, set...
gem install bundler
bundle install

# Let's make this a fresh build
rm -rf {output,tmp}

nanoc set_env --env production

nanoc compile

nanoc deploy --target public
