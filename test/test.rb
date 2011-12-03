require 'test_helper'

class MyController < ApplicationController
  expire_me :now
end