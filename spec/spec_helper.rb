require 'simplecov'

#SimpleCov.start do
  #add_group 'Soundcloud2', 'lib/soundcloud2'
  #add_group 'Specs', 'spec'
#end

require File.expand_path('../../lib/netdna2', __FILE__)
require 'rubygems'
require 'rspec'
require 'vcr'

# Some statics
NETDNA_CONSUMER_KEY     = '7ef3346d7aeaa18dd3cb5d4136f7bd8305001b906'
NETDNA_CONSUMER_SECRET  = 'e758af08b3fdccd9e378ea75ec9ecf63'
NETDNA_COMPANY_ALIAS    = 'zippykid'

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
end