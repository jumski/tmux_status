
module TmuxStatus
  module Segments
    class Container < Segment
      attr_reader :segments

      DEFAULT_OPTIONS = {}

      def initialize(segments, options = {})
        @segments = segments
        @options = DEFAULT_OPTIONS.dup.merge(options)
      end

      def output
        @segments.join(@options[:separator])
      end

      def modes; '' end
    end
  end
end
