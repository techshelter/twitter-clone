module Tweets
  class Handler
    def on_tweetos_created(payload)
      username = payload[:username]
      Operations::CreateTweeto.new.call(username)
    end
  end
end