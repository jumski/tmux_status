
module TmuxStatus
  module Segments
    class Transfer < Segment
      def ifconfig
        @ifconfig ||= Wrappers::Ifconfig.new
      end

      def output
        "#{modes}#{ifconfig.downloaded}/#{ifconfig.uploaded}"
      end
    end
  end
end
