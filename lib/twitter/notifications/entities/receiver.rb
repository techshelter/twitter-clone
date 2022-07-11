module Notifications
  module Entities
    class Receiver
      attr_reader :username, :messages, :followings

      def initialize(username)
        @username = username
        @messages = []
        @followings = []
      end

      def add_message(message)
        @messages << message
      end

      def add_following(username)
        @followings << username
      end
    end
  end
end