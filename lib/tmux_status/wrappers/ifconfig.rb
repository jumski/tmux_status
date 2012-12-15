
module TmuxStatus
  module Wrappers
    class Ifconfig
      DOWNLOADED = /RX bytes:(\d+)/
      UPLOADED   = /TX bytes:(\d+)/

      def downloaded
        extract(DOWNLOADED).to_i
      end

      def uploaded
        extract(UPLOADED).to_i
      end

      def ifconfig
        %x[ ifconfig ppp0 ]
      end

      private
        def extract(pattern)
          ifconfig.scan(pattern).flatten.first
        end
    end
  end
end
