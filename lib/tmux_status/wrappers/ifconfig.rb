
module TmuxStatus
  module Wrappers
    class Ifconfig
      DOWNLOADED_BYTES = /RX bytes:(\d+)/
      UPLOADED_BYTES   = /TX bytes:(\d+)/
      IS_DOWN_MARKER   = 'Device not found'

      def downloaded
        return unless up?

        extract(DOWNLOADED_BYTES).to_i
      end

      def uploaded
        return unless up?

        extract(UPLOADED_BYTES).to_i
      end

      def up?
        ! ifconfig.include?(IS_DOWN_MARKER)
      end

      def ifconfig
        @output ||= %x[ ifconfig ppp0 2>&1 ]
      end

      private
        def extract(pattern)
          ifconfig.scan(pattern).flatten.first
        end
    end
  end
end
