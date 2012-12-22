
module TmuxStatus
  module Segments
    class Transfer < Segment
      def ifconfig
        @ifconfig ||= Wrappers::Ifconfig.new
      end

      def output
        return nil unless ifconfig.up?

        downloaded = ifconfig.downloaded.to_i / 1024 / 1024
        uploaded   = ifconfig.uploaded.to_i / 1024 / 1024

        "#{modes}#{downloaded}/#{uploaded}"
      end

      private
      def default_options
        { bg: 247, fg: 233, bold: false }
      end
    end
  end
end
