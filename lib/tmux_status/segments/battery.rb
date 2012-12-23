# encoding: utf-8
module TmuxStatus
  module Segments
    class Battery < Segment
      def output
        case
        when battery.discharging?
          "#{@options[:discharging_symbol]} #{battery.percentage}%"
        when battery.charging?
          return if battery.percentage > 80

          "#{@options[:charging_symbol]} #{battery.percentage}%"
        end
      end

      def battery
        @battery ||= Wrappers::AcpiBattery.new
      end

      private
        def default_options
          {
            bg: 0,
            fg: 82,
            bold: true,
            discharging_symbol: '⚡',
            charging_symbol: '↥'
          }
        end
    end
  end
end
