# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'netdna2/version'

Gem::Specification.new do |s|
  s.name        = 'netdna2'
  s.version     = NetDna2::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Alex Manelis']
  s.email       = ['amanelis@gmail.com']
  s.homepage    = 'http://github.com/amanelis/netdna2'
  s.summary     = %q{A wrapper for the NetDNA API}
  s.description = %q{A wrapper for the NetDNA API}

  s.rubyforge_project = 'netdna2'
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('simplecov')
  s.add_development_dependency('vcr')
  s.add_development_dependency('fakeweb')
  s.add_development_dependency('oauth')
  s.add_development_dependency('faker')

  s.add_runtime_dependency('hashie')
  s.add_runtime_dependency('yajl-ruby')
  s.add_runtime_dependency('multi_json')  
  s.add_runtime_dependency('addressable')

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end