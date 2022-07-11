module Notifications
  module Entities
    class ReceiverCollection
      attr_reader :receivers

      def initialize
        @receivers = []
      end

      def add_receiver(receiver)
        @receivers << receiver
      end
    end
  end
end