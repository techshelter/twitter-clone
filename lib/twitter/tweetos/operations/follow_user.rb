module Tweetos
  module Operations
    class FollowUser < Base
      def call(username, following)
        repository.add_follower(username, following)
        Twitter::BUS.publish('tweetos.followed', username: username, following: following)
      end
    end
  end
end