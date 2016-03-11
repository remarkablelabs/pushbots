require 'pushbots/version'
require 'pushbots/config'
require 'pushbots/push'
require 'pushbots/request'
require 'pushbots/response'
require 'pushbots/one'
require 'pushbots/all'

# Pushbots module
module Pushbots
  def self.configure(&block)
    Config.configure(&block)
  end
end
