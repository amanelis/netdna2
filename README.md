# NetDna2 API Client
[![Build Status](https://secure.travis-ci.org/amanelis/netdna2.png)](http://travis-ci.org/amanelis/netdna2)

Simple Ruby wrapper for the NetDNA API.  

## Overview

This library allows you complete access to the NetDNA API for CDN manipulation and alteration of your data. Sample invocation is as follows:

    @client = NetDna2::Client.new NETDNA_CONSUMER_KEY, NETDNA_CONSUMER_SECRET, NETDNA_COMPANY_ALIAS

The client's sole purpose is to make requests and check for authentication. It will return an error status if you are either not authenticated
or if you have not added your IP address you are making requests from to the whitelist section of the NetDNA preferences section.
    
## Basic Usage and examples

## Dependencies
#### Install dependencies using bundler  
    $ bundle
  
#### Run rspec  
    $ rspec spec/

## Issues
  None.

## How to contribute
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright (c) 2011 [Alex Manelis](http://twitter.com/amanelis).