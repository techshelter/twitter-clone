# frozen_string_literal: true
require 'rubygems'
require 'bundler/setup'
require 'securerandom'
require 'event_bus'
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir(File.expand_path("../twitter", __FILE__))


loader.setup


module Twitter
  class Error < StandardError; end
  # Your code goes here...

  BUS = ::EventBus::Bus.new

  BUS.register('tweetos.created')
  BUS.register('tweetos.followed')
  BUS.register('tweets.tweeted')

  BUS.subscribe(::Tweets::Handler.new)
  BUS.subscribe(::Notifications::Handler.new)
end