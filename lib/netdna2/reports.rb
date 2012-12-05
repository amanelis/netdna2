require 'json'
require File.join(File.dirname(__FILE__), '..', 'core_ext/hash')

module NetDna2
  # This class returns reports on the CDN's data of the account.
  class Reports < Client
    # Calls the parent classes intialize to OAuth to the NetDNA api. We should
    # probably be checking the response here, notifying the user if there is any
    # failed authentication.
    def initialize
      super(NETDNA_CONSUMER_KEY, NETDNA_CONSUMER_SECRET, NETDNA_COMPANY_ALIAS)
    end

    # Gets all zone usage statistics optionally broken up by +report_type+. If
    # no +report_type+ is given the request will return the total usage for the
    # zones.
    #
    # == Possible Parameters for NetDNA
    # date_from:: Start date
    # date_to::   End date
    #
    # @param [String] report_type String(hourly, daily, monthly)
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def list_zone_stats report_type, options={}
      request :get, "/#{self.company_alias}/reports/stats.json/#{report_type}?#{options.to_q}"
    end

    # Gets all zone usage statistics specified by +zone_type+ and optionally
    # broken up by +report_type+. If no +report_type+ is given the request will
    # return the total usage for the zone type.
    #
    # == Possible Parameters for NetDNA
    # date_from:: Start date
    # date_to::   End date
    #
    # @param [String] zone_type String(push, pull, vod, live)
    # @param [String] report_type String(hourly, daily, monthly)
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def list_zone_stats_by_type zone_type, report_type, options={}
      request :get, "/#{self.company_alias}/reports/#{zone_type}/stats.json/#{report_type}?#{options.to_q}"
    end

    # Gets the +zone_id+ usage statistics optionally broken up by +report_type+.
    # If no +report_type+ is given the request will return the total usage for
    # the zones.
    #
    # == Possible Parameters for NetDNA
    #   date_from    now() - 1 month     Y-m-d (e.g. 2012-01-01)    Start date    1.0
    #   date_to    now()      Y-m-d (e.g. 2012-01-01)    End date    1.0
    #
    # @param [Integer] zone_id
    # @param [String] report_type String(hourly, daily, monthly)
    # @param [Hash] options
    #
    # @return [Hash] the response from NetDNA
    def list_stats_per_zone zone_id, report_type, options={}
      request :get, "/#{self.company_alias}/reports/#{zone_id}/stats.json/#{report_type}?#{options.to_q}"
    end
  end
end
  