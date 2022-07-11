module Notifications
  module Operations
    class Base

      def initialize(repository: Repository.instance)
        @repository = repository
      end

      def call()
        raise 'define method call'
      end

      private

      def repository
        @repository
      end
    end
  end
end