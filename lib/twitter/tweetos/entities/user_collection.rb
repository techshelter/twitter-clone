module Tweetos
  module Entities
    class UserCollection
      attr_accessor :users

      def initialize
        @users = []
      end

      def add_user(user)
        @users << user
      end
    end
  end
end