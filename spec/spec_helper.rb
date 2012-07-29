require 'rubygems'
require 'rspec'
require 'simplecov'
require 'vcr'
require 'yaml'
require File.expand_path('../../lib/netdna2', __FILE__)

SimpleCov.start do
  add_group 'Netdna2', 'lib/netdna2'
  add_group 'Specs', 'spec'
end

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
end

# netdna = YAML.load(File.read(".keys.yml"))
# NETDNA_CONSUMER_KEY     = netdna['netdna']['key']
# NETDNA_CONSUMER_SECRET  = netdna['netdna']['secret']
# NETDNA_COMPANY_ALIAS    = netdna['netdna']['alias']

# Developer Account NetDNA supplied for this project
NETDNA_CONSUMER_KEY     = '58fee3c34e7a4bea19387abc5dd57e9205015b4f2'
NETDNA_CONSUMER_SECRET  = 'd5efa85f6b34e39d8c8dc1db79450d6c'
NETDNA_COMPANY_ALIAS    = 'amanelis'
