# require 'event_bus'
# require 'twitter/tweets/handler'
# module Twitter
#   BUS = ::EventBus::Bus.new

#   BUS.register('tweetos.created')

#   BUS.subscribe(::Tweets::Handler.new)
# end