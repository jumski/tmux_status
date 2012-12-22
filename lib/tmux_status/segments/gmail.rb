
module TmuxStatus
  module Segments
    class Gmail < Segment
      def initialize(options)
        @username = options.delete(:username)
        @password = options.delete(:password)

        super(options)
      end

      def output
        return unless wrapper.any_unread?

        "#{@options[:icon]} #{wrapper.unread_count}"
      end

      def wrapper
        Object.new
      end
    end
  end
end
