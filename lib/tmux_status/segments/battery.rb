# encoding: utf-8
module TmuxStatus
  module Segments
    class Battery < Segment
      def output
        return unless battery.discharging?

        "#{@options[:discharging_symbol]} #{battery.percentage}%"
      end

      def battery
        @battery ||= Wrappers::AcpiBattery.new
      end

      private
        def default_options
          { bg: 0, fg: 82, bold: true, discharging_symbol: '⚡' }
        end
    end
  end
end
