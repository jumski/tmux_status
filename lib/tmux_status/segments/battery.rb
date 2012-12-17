
module TmuxStatus
  module Segments
    class Battery < Segment
      def output
        return unless battery.discharging?

        "#{modes}#{@options[:discharging_symbol]}#{battery.percentage}%"
      end

      def battery
        @battery ||= Wrappers::AcpiBattery.new
      end
    end
  end
end
