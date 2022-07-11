module Tweets
  module Operations
    class Tweet < Base
      def call(username, content)
        raise Errors::TweetoNotFoundError unless repository.exist?(username)
        raise Errors::MaxCharsError if content.size > 100
        repository.tweet(username, content)
        Twitter::BUS.publish('tweets.tweeted', username: username)
      end
    end
  end
end