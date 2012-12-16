
module TmuxStatus
  module Wrappers
    class Mocp
      def title
        return if state == :stopped

        output.scan(/SongTitle: (.*)/).flatten.first
      end

      def state
        case output.scan(/State: (.*)/).flatten.first
        when 'STOP'
         return :stopped
        when 'PAUSE'
         return :paused
        when 'PLAY'
         return :playing
        end
      end

      def output
        @output ||= %x[ mocp -i ]
      end
    end
  end
end
