require "addressable/uri"

class Hash
  def to_q
    return '' if self.empty? || self.nil?
    queries = ''
    map { |k,v| queries += "#{k}=#{v}&" }
    queries.chomp!('&')
    queries
  end
end