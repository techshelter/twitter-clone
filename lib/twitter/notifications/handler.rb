module Notifications
  class Handler
    def on_tweetos_created(payload)
      username = payload[:username]
      Operations::CreateReceiver.new.call(username)
    end

    def on_tweetos_followed(payload)
      username, following = payload[:username], payload[:following]
      Operations::AddFollowing.new.call(username, following)
    end

    def on_tweets_tweeted(payload)
      username = payload[:username]
      content = "The user you are following #{username} has just tweeted"
      repository = Repository.instance
      followers = repository.get_followers(username)
      followers.each do |follower|
        Operations::Notify.new.call(follower, content)
      end
    end
  end
end