module ExpireMe
  class Response
      
    attr_accessor :hash
    
    def initialize(h={ :adapter => nil, :seconds => 0, :http_response => nil })
      self.hash = h
      puts "Seconds is #{seconds}"
      adapter.set_expiration(http_response, seconds)
    end
      
    def method_missing(t)
      hash[t]
    end
  
  end
  
end
