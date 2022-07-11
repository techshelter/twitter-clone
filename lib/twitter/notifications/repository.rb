module Tweets
  class Repository

    def initialize
      @collection = Entities::ReceiverCollection.new
    end

    def all_messages
      @collection.receivers.map do |receiver|
        { receiver.username => receiver.messages.map(&:content) }
      end
    end

    def notify(username, content)
      receiver = get_receiver(username)
      if receiver
        message = Entities::Message.new(content)
        receiver.add_message(message)
      end
    end

    def create_receiver(username)
      @collection.add_receiver(Entities::Receiver.new(username))
    end

    def add_following(username, following)
      receiver = get_receiver(username)
      receiver.add_following(following) if receiver
    end

    def exist?(username)
      !get_receiver(username).nil?
    end

    private
    def get_receiver(username)
      @collection.receivers.find do |receiver|
        receiver.username == username
      end
    end

    def self.instance
      @repository ||= self.new
    end
  end
end