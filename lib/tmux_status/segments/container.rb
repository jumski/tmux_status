
module TmuxStatus
  module Segments
    class Container < Segment
      attr_reader :segments

      def initialize(segments)
        @segments = segments
      end

      def output
        @segments.join
      end

      def modes; '' end
    end
  end
end
