module ExpireMe
  class Varnish < Adapter
    
    PARTS = {
      :age => /(max\-age=)([0-9]+)/i
    }
    
    def set_expiration(response, seconds)
      super
      
      replace_caching_header :age => seconds
    end
    
    private
    
    def replace_caching_header(h)
      needle = PARTS[h.keys.first]
      value = h.values.first
      return if value.nil? or needle.nil?
      
      if header =~ needle
        self.header = header.interpolate(needle, value)
      else
        if header.empty?
          self.header = needle.unregex << value.to_s
        else
          self.header = header << ", " << needle.unregex << value.to_s
        end
      end
    end
    
    def header
      response.headers['Cache-Control'] || ""
    end
    
    def header=(s)
      response.headers['Cache-Control'] = s
    end
    
  end
end