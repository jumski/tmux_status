
module TmuxStatus
  module Segments
    class Zeus < Segment
      def zeus
        Wrappers::Zeus.new
      end

      def output
        return unless zeus.running?

        'Z'
      end

      private
        def default_options
          { bg: 136, fg: 160 }
        end
    end
  end
end
