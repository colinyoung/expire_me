require 'rails'

module ExpireMe
  
  module Controller
    def expire_me(descriptor, options={})
      ExpireMe.expire = descriptor, options
      
      include ExpireMe::Controller::InstanceMethods
      after_filter :update_cache_expiration
    end
    
    def no_cache
      expire_me :now
    end
    
    module InstanceMethods
      
      def update_cache_expiration
        ExpireMe.expire_http_response(response)
      end
      
    end
  end
  
  class Railtie < Rails::Railtie
    config.to_prepare do
      ApplicationController.send(:extend, ExpireMe::Controller)
    end
  end
  
end