module Tweetos
  module Operations
    class ListUsers < Base
      def call
        repository.all
      end
    end
  end
end