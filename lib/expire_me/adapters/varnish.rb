module ExpireMe
  class Varnish < Adapter
    
    PARTS = {
      :age => /(max\-age=)([0-9]+)/i
    }
    
    def set_expiration(response, seconds)
      super
      
      puts "Caching for seconds: #{seconds}"
      replace_caching_header :age => seconds
    end
    
    private
    
    def replace_caching_header(h)
      needle = PARTS[h.keys.first]
      value = h.values.first
      return if value.nil? or needle.nil?
      
      if header =~ needle
        header.interpolate! needle, value
      else
        header << header[needle, 1] << value
      end
      puts "header ended as: #{header}"
    end
    
    def header
      response.headers['Cache-Control'] || ""
    end
    
  end
end