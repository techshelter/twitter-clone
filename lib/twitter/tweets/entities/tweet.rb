module Tweets
  module Entities
    class Tweet
      attr_reader :content, :created_at, :id

      def initialize(content)
        @id = SecureRandom.uuid
        @content = content
        @created_at = Time.now
      end
    end
  end
end