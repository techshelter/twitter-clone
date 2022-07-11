module Tweets
  class Repository

    def initialize
      @collection = Entities::TweetosCollection.new
    end

    def all_tweets
      @collection.tweetos.map do |tweeto|
        { tweeto.username => tweeto.tweets.map(&:content) }
      end
    end

    def tweet(username, content)
      tweeto = get_tweeto(username)
      if tweeto
        tweet = Entities::Tweet.new(content)
        tweeto.add_tweet(tweet)
      end
    end

    def create_tweeto(username)
      @collection.add_tweeto(Entities::Tweeto.new(username))
    end

    def exist?(username)
      !get_tweeto(username).nil?
    end

    private
    def get_tweeto(username)
      @collection.tweetos.find do |tweeto|
        tweeto.username == username
      end
    end

    def self.instance
      @repository ||= self.new
    end
  end
end