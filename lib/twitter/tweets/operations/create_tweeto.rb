module Tweets
  module Operations
    class CreateTweeto < Base
      def call(username)
        repository.create_tweeto(username)
      end
    end
  end
end