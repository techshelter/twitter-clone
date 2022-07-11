module Tweetos
  class Repository

    def initialize
      @collection = Entities::UserCollection.new
    end

    def all
      @collection.users.map do |user|
        user.username
      end
    end

    def get_user(user_name)
      @collection.users.find do |user|
        user.username == user_name
      end
    end

    def create_user(username)
      user = Entities::User.new(username)
      @collection.add_user(user)
    end

    def add_follower(username, following)
      user = get_user(username)
      user.follow(following) if user && exist?(following)
    end

    def exist?(username)
      user = get_user(username)
      !user.nil?
    end

    def self.instance
      @repository ||= self.new
    end
  end
end