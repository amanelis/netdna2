require 'oauth'

module NetDna2
  ### Client class
  # A Class to initialize our OAuth connection, every
  # class in this package will be using and inheriting
  # this class to gain access to the OAuth connection.
  class Client
    # Make the access token accessible so we can call the
    # api with @acces.[HTTP method](/path.json)
    attr_reader :access, :access_status, :company_alias, :consumer_key,
      :consumer_secret, :company_alias

    ### initialize
    # Setup our OAuth connection here and make attr_accessible
    #
    # @param [String] NetDNA Consumer Key
    # @param [String] NetDNA Consumer Secret
    # @param [String] Your company alias in NetDNA
    # @return [OAuth::Consumer]
    def initialize consumer_key, consumer_secret, company_alias      
      # Catch invalid parameters
      raise ArgumentError if consumer_key.nil? || consumer_secret.nil? || company_alias.nil?
      
      # Create the OAuth request
      consumer = OAuth::Consumer.new(
        consumer_key,
        consumer_secret,
        :site => "https://rws.netdna.com",
        :request_token_path => "/oauth/request_token",
        :authorize_path => "/oauth/authorize",
        :access_token_path => "/oauth/access_token",
        :http_method => :get)
      @access = OAuth::AccessToken.new(consumer)

      # API changed from ['code] to now just .code
      @access_status    = @access.get("/#{company_alias}/account.json").code      
      @company_alias    = company_alias
      @consumer_key     = consumer_key
      @consumer_secret  = consumer_secret      
      
      # Raise and halt if authentication failed
      raise SecurityError, "OAuth failed. Check your Key/Secret" if @access_status != "200"
    end

    ### check_access
    # Basically checks if we were/are authenticated or not. We can refactor this
    # later to be less shitty. Lets use _return_ to stop control in the method
    # actually being called so we can halt execution of that method.
    #
    # @return [Hash] Returns execution if you are not authenticated
    def check_access
      return {code: access_status, message: 'Not authenticated'} unless access_status == 200 || access_status == '200'
    end

    ### request
    # Make anytype of request to the Net DNA API. This was made to use their
    # ENABLE/DISABLE methods
    #
    # @param [Symbol] method the request method
    # @param [String] endpoint the path endpoint
    #
    # @return [Hash] of the response
    def request method, endpoint, options={}
      # Check the status of OAuth
      check_access

      # Call the api for the zones endpoint:
      # https://rws.netdna.com/ <companyalias> /zones.json
      response = access.request method, endpoint, options

      # Continue, parse and return the results if we have a successful result
      JSON.parse(response.body)
    end
  end

  autoload :Reports,    "netdna2/reports"
  autoload :Zones,      "netdna2/zones"
end
