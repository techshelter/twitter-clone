module Tweets
  module Operations
    class ListTweets < Base
      def call
        repository.all_tweets
      end
    end
  end
end