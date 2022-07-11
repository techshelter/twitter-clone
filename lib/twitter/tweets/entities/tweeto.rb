module Tweets
  module Entities
    class Tweeto
      attr_reader :username, :tweets

      def initialize(username)
        @username = username
        @tweets = []
      end

      def add_tweet(tweet)
        @tweets << tweet
      end
    end
  end
end