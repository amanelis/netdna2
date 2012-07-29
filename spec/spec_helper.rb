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
# TODO - replace these with a complete demo account once approved, coming soon
netdna = YAML.load(File.read("file_path"))
NETDNA_CONSUMER_KEY     = netdna['netdna']['key']
NETDNA_CONSUMER_SECRET  = netdna['netdna']['secret']
NETDNA_COMPANY_ALIAS    = netdna['netdna']['alias']
