module Notifications
  module Operations
    class ListMessages < Base
      def call
        repository.all_messages
      end
    end
  end
end