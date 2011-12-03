module ExpireMe
  
  class << self
    
    @@seconds = 0
      
    def expire=(descriptor, options={})
      
      seconds = 0 # Reset for each request.
      
      if descriptor.is_a? Array
        descriptor = descriptor.first # Ruby 1.9.x makes this an array. I do not know why.
      end
      
      if !descriptor.is_a? Hash
        self.send :in, safe_value(descriptor)
      else
        self.send descriptor.keys.first, descriptor.values.first
      end
    end
    
    def expire_http_response(http_response)
      Response.new({
        :http_response => http_response,
        :seconds => @@seconds,
        :adapter => adapter
      })
    end
    
    protected
    
    def safe_value(v)
      if v.is_a? Array
        begin
          v = v.first.to_i
        rescue Exception => e
          throw "[ExpireMe] You must submit your expiration time in seconds or ruby date."
        end
      end
      
      v
    end
  
    private
    
    def adapter
      # Maybe we'll support others later.
      ExpireMe::Adapter.select(:varnish)
    end
  
    def at time
      @@seconds = (time - Time.now).to_i
    end
    
    def in seconds
      @@seconds = seconds.to_i
    end
  
    def now
      @@seconds = 0
    end
  
  end
  
end