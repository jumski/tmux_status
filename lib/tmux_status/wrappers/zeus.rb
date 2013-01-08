
module TmuxStatus
  module Wrappers
    class Zeus
      def running?
        output.split("\n").grep(/zeus slave/).length > 0
      end

      def output
        %x[ ps ax ]
      end
    end
  end
end
