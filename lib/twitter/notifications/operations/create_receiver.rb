module Notifications
  module Operations
    class CreateReceiver < Base
      def call(username)
        repository.create_receiver(username)
      end
    end
  end
end