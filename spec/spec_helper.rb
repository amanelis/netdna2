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
NETDNA_CONSUMER_KEY     = 'YOUR_CONSUMER_KEY'
NETDNA_CONSUMER_SECRET  = 'YOUR_CONSUMER_SECRET'
NETDNA_COMPANY_ALIAS    = 'COMPANY_ALIAS'
