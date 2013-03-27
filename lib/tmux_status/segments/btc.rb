# encoding: utf-8
module TmuxStatus
  module Segments
    class Btc < Segment
      def output
        ticker = wrapper.ticker

        "฿ #{ticker['buy']} #{ticker['sell']}"
      end

      def wrapper
        Wrappers::Bitcurex
      end

      private
        def default_options
          { bg: 0, fg: 103 }
        end
    end
  end
end
