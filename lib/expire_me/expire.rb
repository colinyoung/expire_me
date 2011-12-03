module ExpireMe
  
  class << self
    
    attr_accessor :seconds
      
    def expire=(descriptor, options={})
      
      seconds = 0 # Reset for each request.
      
      if options.empty?
        self.send :in, descriptor
      else
        self.send descriptor, options        
      end
    end
    
    def expire_http_response(http_response)
      Response.new({
        :http_response => http_response,
        :seconds => seconds,
        :adapter => adapter
      })
    end
  
    private
    
    def adapter
      # Maybe we'll support others later.
      ExpireMe::Adapter.select(:varnish)
    end
  
    def at time
      seconds = (time - Time.now).to_i
    end
    
    def in seconds
      seconds = seconds
    end
  
    def now
      seconds = 0
    end
  
  end
  
end