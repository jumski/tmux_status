
module TmuxStatus
  module Wrappers
    class AcpiBattery
      def percentage
        return 100 if charged?

        output.scan(/(\d{1,3})%/).flatten.first.to_i
      end

      def charged?
        output.include? 'Full'
      end

      def charging?
        output.include? 'Charging'
      end

      def discharging?
        output.include? 'Discharging'
      end

      def output
        @output ||= %x[ acpi --battery 2>&1 ]
      end
    end
  end
end
