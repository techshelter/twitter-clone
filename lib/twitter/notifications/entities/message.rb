module Notifications
  module Entities
    class Message
      attr_reader :content

      def initialize(content)
        @id = SecureRandom.uuid
        @content = content
      end
    end
  end
end