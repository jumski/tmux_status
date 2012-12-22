# this trickery is needed because of bug in mail gem
# mail gem sends its diagnostic output to STDOUT instea of err one
old_STDOUT = STDOUT
STDOUT = STDERR
require 'gmail'
STDOUT = old_STDOUT

module TmuxStatus
  module Wrappers
    class Gmail
      def initialize(username, password)
        @username, @password = username, password
      end

      def any_unread?
        unread_count > 0
      end

      def unread_count
        gmail.inbox.count(:unread)
      end

      def gmail
        @gmail ||= ::Gmail.connect(@username, @password)
      end
    end
  end
end
