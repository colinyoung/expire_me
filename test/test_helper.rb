require 'rubygems'
require File.expand_path('../../lib/expire_me', __FILE__)

if not defined? ApplicationController
  class ApplicationController
  end
end