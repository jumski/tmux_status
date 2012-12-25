
module TmuxStatus
  module Wrappers
    class Zeus
      def running?
        output.split("\n").length > 1
      end

      def output
        %x[ ps ax | grep "zeus slave" | grep -v grep ]
      end
    end
  end
end
