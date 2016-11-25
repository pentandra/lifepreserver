require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require 'nanoc'
require 'nanoc/cli'

Nanoc::CLI.setup
