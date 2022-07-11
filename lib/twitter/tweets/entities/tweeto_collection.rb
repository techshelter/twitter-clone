module Tweets
  module Entities
    class TweetosCollection
      attr_reader :tweetos

      def initialize
        @tweetos = []
      end

      def add_tweeto(tweeto)
        @tweetos << tweeto
      end
    end
  end
end