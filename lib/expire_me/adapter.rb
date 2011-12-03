module ExpireMe
  class Adapter
    
    attr_accessor :response
    
    def set_expiration(r, seconds=0)
      response = r
    end
    
    def self.select(adapter_name)
      return self.new if self.name != Adapter.to_s
      
      (ExpireMe.const_get adapter_name.to_s.classify).new
    end
    
  end
end

Dir[File.expand_path("../adapters/*.rb", __FILE__)].each {|f| require f }