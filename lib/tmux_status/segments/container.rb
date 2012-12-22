
module TmuxStatus
  module Segments
    class Container < Segment
      attr_reader :segments

      def initialize(segments, options = {})
        @segments = segments
        super(options)
      end

      def output
        return unless any_visible?

        segments_with_glues.join
      end

      def modes; end

      def segments_with_glues
        if direction == :left
          glues.zip(visible_segments).flatten
        else
          visible_segments.zip(glues).flatten
        end
      end

      def glues
        glues = []
        glues << left_edge_glue if left?

        visible_segments.each_cons(2) do |segments|
          glues << Glue.new(*segments, direction: direction)
        end

        glues << right_edge_glue if right?
        glues
      end

      def left_edge_glue
        Glue.new(self, visible_segments.first, direction: direction)
      end

      def right_edge_glue
        Glue.new(visible_segments.last, self, direction: direction)
      end

      def any_visible?
        visible_segments.length > 0
      end

      def visible_segments
        @segments.reject(&:blank?)
      end

      def default_options
        {bg: 240, fg: 236 }
      end
    end
  end
end
