require 'json'
require File.join(File.dirname(__FILE__), '..', 'core_ext/hash')

module NetDna2
  # Used to communicate with the Zones part of the API, return data and change
  # data on the CDN zones. List, Get and change a zone. Enable/Disable and purge
  # zones.
  class Zones < Client
    # Calls the parent classes intialize to OAuth to the NetDNA api. We should
    # probably be checking the response here, notifying the user if there is any
    # failed authentication.
    def initialize
      super(NETDNA_CONSUMER_KEY, NETDNA_CONSUMER_SECRET, NETDNA_COMPANY_ALIAS)
    end
    
    # Returns a list of all zones on your account. This method returns an array
    # of hashes, each containing the zone information.
    #
    # == Example Response
    #   {"code"=>Integer, "data"=>Hash }
    #
    # == Caveats
    #   {data: {"page"=>1, "pages"=>10, "page_size"=>"50", "current_page_size"=>50, "total"=>494}}
    #
    # @param [Hash] options the options to pass in as a query (ie. +{page: 4}+)
    # @return [Hash] the response from NetDNA
    def list_zones options={}
      request :get, "/#{self.company_alias}/zones.json?#{options.to_q}"
    end

    # Gets a summarized count of all zone types on your account. This method
    # returns the summary info with each zone, similar to zones endpoint. Just a
    # lot more data.
    #
    # == Possible Parameters for NetDNA
    # pull:: The number of pull zones for your account 1.0
    # push:: The number of push zones for your account 1.0
    # vod::  The number of vod zones for your account  1.0
    # live:: The number of live zones for your account 1.0
    #
    # @param [Hash] options
    # @return [Hash] the response from NetDNA
    def zone_summary options={}
      request :get, "/#{self.company_alias}/zones.json/summary?#{options.to_q}"
    end

    # Counts all zones on your account. This method will return a single hash
    # with data about how many zones are returned from the zones endpoint.
    #
    # == Possible Parameters for NetDNA
    # count:: The total number of content zones for your account
    #
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def zone_count options={}
      request :get, "/#{self.company_alias}/zones.json/count?#{options.to_q}"
    end


    # Returns a list of all pull zones on your account
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    #
    # == Possible Parameters for NetDNA
    # id::                  Pull Zone ID
    # name::                Pull Zone name
    # url::                 Origin URL
    # port::                Port
    # ip::                  IP address of the Origin URL
    # compress::            GZip compression for the following file types:
    #                       text/plain, text/html, text/javascript, text/css,
    #                       text/xml, application/javascript,
    #                       application/x-javascript, application/xml,
    #                       text/x-component, application/json,
    #                       application/xhtml+xml, application/rss+xml,
    #                       application/atom+xml, app/vnd.ms-fontobject,
    #                       image/svg+xml, application/x-font-ttf, font/opentype
    # queries::             Treat Query Strings as a separate cacheable item
    # cache_valid::         Ignore the origin Cache-Control Header and set every
    #                       request to have a Max-Age of 1d, 7d, 1M or 12M
    # label::               Something that describes your zone
    # valid_referrers::     List of domains for http referrer protection
    #                       (separated by space). Only the domains in the list
    #                       will be treated as valid referrers
    # expires::             Set any request with a no "Cache-Control header"
    #                       from the origin to stay on the server. Possible
    #                       values are 1d, 7d, 1M, 12M
    # disallow_robots::     Enable robots.txt
    # disallow_robots_txt:: Use custom robots.txt
    # content_disposition:: Force files to download
    # sslshared::           Enable Shared SSL. This feature allows you use your
    #                       zone in HTTPS mode. You dont need your own SSL
    #                       certificate, our server netdna-ssl.com will be used.
    # suspend::             Flag denoting if the zone has been suspended
    # locked::              Flag denoting if the zone has been locked
    # inactive::            Flag denoting if the zone has been deleted
    # creation_date::       Date  Created  1.0
    def list_pull_zones options={}
      request :get, "/#{self.company_alias}/zones/pull.json?#{options.to_q}"
    end

    # Creates a new pull zone.
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    #
    # == Possible Parameters for NetDNA
    # name::                Pull Zone Name
    # url::                 Origin URL
    # port::                Port
    # ip::                  Valid IP address of the Origin URL. If omitted, the
    #                       service will try to lookup the IP automatically.
    # compress::            Enable GZip compression for the following file
    #                       types: text/plain, text/html, text/javascript,
    #                       text/css, text/xml, application/javascript,
    #                       application/x-javascript, application/xml,
    #                       text/x-component, application/json,
    #                       application/xhtml+xml, application/rss+xml,
    #                       application/atom+xml, app/vnd.ms-fontobject,
    #                       image/svg+xml, application/x-font-ttf, font/opentype
    # queries::             Treat Query Strings as a separate cacheable item
    # cache_valid::         Ignore the origin Cache-Control Header and set every
    #                       request to have a Max-Age of 1d, 7d, 1M or 12M
    # label::               Something that describes your zone
    # valid_referrers::     List of domains for http referrer protection
    #                       (separated by space). Only the domains in the list
    #                       will be treated as valid referrers
    # expires::             Set any request with a no "Cache-Control header"
    #                       from the origin to stay on the server. Possible
    #                       values are 1d, 7d, 1M, 12M
    # disallow_robots::     Enable robots.txt
    # disallow_robots_txt:: Use custom robots.txt
    # content_disposition:: Force files to download
    # sslshared::           Enable Shared SSL. This feature allows you use your
    #                       zone in HTTPS mode. You don't need your own SSL
    #                       certificate, our server netdna-ssl.com will be used.
    def create_pull_zone options={}
      request :post, "/#{self.company_alias}/zones/pull.json", options
    end

    # Counts all pull zones on your account
    #
    # == Possible Parameters for NetDNA
    # count:: The number of pull zones on your account
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    #
    def pull_zones_count options={}
      request :get, "/#{self.company_alias}/zones/pull.json/count?#{options.to_q}"
    end

    # Gets a pull zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    #
    def get_pull_zone zone_id, options={}
      request :get, "/#{self.company_alias}/zones/pull.json/#{zone_id}?#{options.to_q}"
    end

    # Updates a pull zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    #
    # == Possible Parameters for NetDNA
    # url::                 Origin URL
    # port::                Port
    # compress::            Enable GZip compression for the following file
    #                       types: text/plain, text/html, text/javascript,
    #                       text/css, text/xml, application/javascript,
    #                       application/x-javascript, application/xml,
    #                       text/x-component, application/json,
    #                       application/xhtml+xml, application/rss+xml,
    #                       application/atom+xml, app/vnd.ms-fontobject,
    #                       image/svg+xml, application/x-font-ttf, font/opentype
    # queries::             Treat Query Strings as a separate cacheable item
    # cache_valid::         Ignore the origin Cache-Control Header and set every
    #                       request to have a Max-Age of 1d, 7d, 1M or 12M
    # label::               Something that describes your zone
    # valid_referrers::     List of domains for http referrer protection
    #                       (separated by space). Only the domains in the list
    #                       will be treated as valid referrers
    # expires::             Set any request with a no "Cache-Control header"
    #                       from the origin to stay on the server. Possible
    #                       values are 1d, 7d, 1M, 12M
    # disallow_robots::     Enable robots.txt
    # disallow_robots_txt:: Use custom robots.txt
    # content_disposition:: Force files to download
    # sslshared::           Enable Shared SSL. This feature allows you use your
    #                       zone in HTTPS mode. You don't need your own SSL
    #                       certificate, our server netdna-ssl.com will be used.
    def update_pull_zone zone_id, options={}
      request :put, "/#{self.company_alias}/zones/pull.json/#{zone_id}?#{options.to_q}"
    end

    # Deletes a pull zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id
    #
    # @return [Hash] the response from NetDNA
    def delete_pull_zone zone_id
      request :delete, "/#{self.company_alias}/zones/pull.json/#{zone_id}"
    end

    # Enables a pull zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def enable_pull_zone zone_id, options={}
      request :enable, "/#{self.company_alias}/zones/pull.json/#{zone_id}"
    end

    # Disables a pull zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def disable_pull_zone zone_id, options={}
      request :disable, "/#{self.company_alias}/zones/pull.json/#{zone_id}"
    end

    # Purges pull zone cache
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def purge_cache zone_id, options={}
      request :delete, "/#{self.company_alias}/zones/pull.json/#{zone_id}/cache?#{options.to_q}"
    end

    # Returns a list of all push zones on your account
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def list_push_zones options={}
      request :get, "/#{self.company_alias}/zones/push.json?#{options.to_q}"
    end

    # Creates a new push zone
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    #
    # == Possible Parameters for NetDNA
    # name::                Push Zone name - *REQUIRED*
    # label::               Something that describes your zone
    # valid_referrers::     List of domains for http referrer protection
    #                       (separated by space). Only the domains in the list
    #                       will be treated as valid referrers
    # content_disposition:: Force files to download 1.0
    # sslshared::           Enable Shared SSL. This feature allows you use your
    #                       zone in HTTPS mode. You dont need your own SSL
    #                       certificate, our server netdna-ssl.com will be used.
    def create_push_zone options={}
      request :post, "/#{self.company_alias}/zones/push.json?#{options.to_q}"
    end

    # Counts all push zones on your account
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    #
    # == Possible Parameters for NetDNA
    # count:: The number of pull zones on your account
    def push_zones_count options={}
      request :get, "/#{self.company_alias}/zones/push.json/count?#{options.to_q}"
    end

    # Gets a push zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def get_push_zone zone_id, options={}
      request :get, "/{self.company_alias}/zones/push.json/#{zone_id}?#{options.to_q}"
    end

    # Updates a push zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    #
    # == Possible Parameters for NetDNA
    # label::               Something that describes your zone
    # valid_referrers::     List of domains for http referrer protection
    #                       (separated by space). Only the domains in the list
    #                       will be treated as valid referrers
    # content_disposition:: Force files to download
    # sslshared::           Enable Shared SSL. This feature allows you use your
    #                       zone in HTTPS mode. You dont need your own SSL
    #                       certificate, our server netdna-ssl.com will be used.
    def update_push_zone zone_id, options={}
      request :put, "/#{self.company_alias}/zones/push.json/#{zone_id}?#{options.to_q}"
    end

    # Deletes a push zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    #
    # @return [Hash] the response from NetDNA
    def delete_push_zone zone_id
      request :delete, "/#{self.company_alias}/zones/push.json/#{zone_id}"
    end

    # Enables a push zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def enable_push_zone zone_id, options={}
      request :enable, "/#{self.company_alias}/zones/push.json/#{zone_id}"
    end

    # Disables a push zone specified by the *zone_id* parameter
    #
    # @see http://developer.netdna.com/api/docs
    #
    # @param [Integer] zone_id the id of the zone
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def disable_push_zone zone_id, options={}
      request :disable, "/#{self.company_alias}/zones/push.json/#{zone_id}"
    end
  end
end
    
