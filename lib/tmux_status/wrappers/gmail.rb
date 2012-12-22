require 'gmail'

module TmuxStatus
  module Wrappers
    class Gmail
      attr_reader :username, :password

      def initialize(username = nil, password = nil)
        @username, @password = username, password
      end

      def any_unread?
        unread_count > 0
      end

      def unread_count
        gmail.inbox.count(:unread)
      end

      def gmail
        @gmail ||= ::Gmail.connect(username, password)
      end

      def username
        @username || ENV['GMAIL_USERNAME']
      end

      def password
        @password || ENV['GMAIL_PASSWORD']
      end
    end
  end
end
