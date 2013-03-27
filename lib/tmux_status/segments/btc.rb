# encoding: utf-8
module TmuxStatus
  module Segments
    class Btc < Segment
      def output
        avg = wrapper.ticker['last']

        "฿ #{avg}"
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
