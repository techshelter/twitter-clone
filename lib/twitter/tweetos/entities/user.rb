module Tweetos
  module Entities
    class User
      attr_accessor :username, :followings

      def initialize(username)
        @username = username
        @followings = []
      end

      def follow(username)
        @followings << username
      end
    end
  end
end