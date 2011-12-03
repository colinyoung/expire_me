module ExpireMe
  class Adapter
    
    attr_accessor :response
    
    def set_expiration(r, seconds=0)
      self.response = r
    end
    
    def self.select(adapter_name)
      return self.new if self.name != Adapter.to_s
      
      (ExpireMe.const_get adapter_name.to_s.classify).new
    end
    
  end
end

class Regexp
  def unregex
    self.to_s.gsub('?i-mx:', ''). # Remove initial ruby stuff
      gsub(/(\=\)|)\(\[0-9\]\+\)/, '='). # Empties the value subgroup, heavily escaped because we're operating on a regex
      gsub(/[^\d\w\-\=]/, '') # Replaces all nondigits and words
  end
end

class String
  def interpolate(regex, add)
    self.sub(self[regex], self[regex, 1] << add.to_s)
  end
end

Dir[File.expand_path("../adapters/*.rb", __FILE__)].each {|f| require f }