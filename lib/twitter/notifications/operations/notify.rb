module Notifications
  module Operations
    class Notify < Base
      def call(username, content)
        raise Errors::ReceiverNotFoundError unless repository.exist?(username)
        repository.notify(username, content)
      end
    end
  end
end