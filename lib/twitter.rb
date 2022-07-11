# frozen_string_literal: true
require 'rubygems'
require 'bundler/setup'
require 'securerandom'
require 'event_bus'
require_relative "twitter/version"
require_relative "twitter/bus"
Dir[File.expand_path("../twitter/tweetos/**/*.rb", __FILE__)].sort.each do |file|
  require file
end
Dir[File.expand_path("../twitter/tweets/**/*.rb", __FILE__)].sort.each do |file|
  require file
end

Dir[File.expand_path("../twitter/notifications/**/*.rb", __FILE__)].sort.each do |file|
  require file
end

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
