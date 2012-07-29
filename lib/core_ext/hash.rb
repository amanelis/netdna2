require "addressable/uri"

class Hash
  def to_q
    return '' if self.empty?
    
    # Use the URI lib to create parameter
    # like hash of the values needed to be 
    # sent to the API.
    uri = Addressable::URI.new
    
    # Here is the conversion
    queries = uri.query_values self
  
    # Old way that was not consistent
    # return self.send(:to_query)
    return queries
  end
end