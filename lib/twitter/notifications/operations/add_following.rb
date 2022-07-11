module Notifications
  module Operations
    class AddFollowing < Base
      def call(username, following)
        repository.add_following(username, following)
      end
    end
  end
end