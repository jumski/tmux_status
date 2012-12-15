
module TmuxStatus
  module Segments
    class Transfer < Segment
      def ifconfig
        @ifconfig ||= Wrappers::Ifconfig.new
      end

      def output
        return unless ifconfig.up?

        "#{modes}#{ifconfig.downloaded}/#{ifconfig.uploaded}"
      end
    end
  end
end
