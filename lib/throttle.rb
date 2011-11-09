require 'throttle/version'
require 'throttle/ipfw'
require 'throttle/bandwidth'
require 'throttle/pipe'
require 'throttle/client'

module Throttle
  def self.new(*args)
    Throttle::Client.new(*args)
  end  
end
