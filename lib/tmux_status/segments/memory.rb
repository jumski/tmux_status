# encoding: utf-8
module TmuxStatus
  module Segments
    class Memory < Segment
      def output
        used = wrapper.used / 1024
        total = wrapper.total / 1024

        "⋆ #{used}/#{total}"
      end

      def wrapper
        @wrapper ||= Wrappers::Free.new
      end

      private
        def default_options
          { bg: 0, fg: 103 }
        end
    end
  end
end
