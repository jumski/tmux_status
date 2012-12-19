
module TmuxStatus
  module Segments
    class Transfer < Segment
      def ifconfig
        @ifconfig ||= Wrappers::Ifconfig.new
      end

      def output
        return unless ifconfig.up?
        downloaded = ifconfig.downloaded.to_i / 1024 / 1024
        uploaded   = ifconfig.uploaded.to_i / 1024 / 1024

        "#{modes}#{downloaded}/#{uploaded}"
      end
    end
  end
end
