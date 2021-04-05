#!/usr/bin/env ruby

# Script for automated meming
require 'yaml'
require 'clipboard'
require_relative 'lib/config'

config = Config.new(YAML.load_file('config.yml'))
structure = config.random_structure
out = config.expand structure

Clipboard.copy out
return if defined?(Ocra)

puts out
gets