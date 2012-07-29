require 'rubygems'
require 'rspec'
require 'simplecov'
require 'vcr'
require File.expand_path('../../lib/netdna2', __FILE__)

SimpleCov.start do
  add_group 'Netdna2', 'lib/netdna2'
  add_group 'Specs', 'spec'
end

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
end

# Some statics
NETDNA_CONSUMER_KEY     = '7ef3346d7aeaa18dd3cb5d4136f7bd8305001b906'
NETDNA_CONSUMER_SECRET  = 'e758af08b3fdccd9e378ea75ec9ecf63'
NETDNA_COMPANY_ALIAS    = 'zippykid'
