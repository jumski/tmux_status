
module TmuxStatus
  module Wrappers
    class Mocp
      def title
        return if state == :stopped

        mocp_info.scan(/SongTitle: (.*)/).flatten.first
      end

      def state
        case mocp_info.scan(/State: (.*)/).flatten.first
        when 'STOP'
         return :stopped
        when 'PAUSE'
         return :paused
        when 'PLAY'
         return :playing
        end
      end

      def mocp_info
        %x[ mocp -i ]
      end
    end
  end
end
