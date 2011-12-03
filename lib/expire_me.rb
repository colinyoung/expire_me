require 'active_support'
require 'active_support/inflector'

classes = \
[
  :version,
  :railtie,
  :expire,
  :adapter,
  :response
]

classes.map {|c| require File.expand_path("../expire_me/#{c}", __FILE__) }

module ExpireMe
  
end
