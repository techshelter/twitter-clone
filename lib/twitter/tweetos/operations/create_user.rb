module Tweetos
  module Operations
    class CreateUser < Base
      def call(username)
        raise Errors::AlreadyExistError if repository.exist?(username)
        repository.create_user(username)
        Twitter::BUS.publish('tweetos.created', username: username)
      end
    end
  end
end