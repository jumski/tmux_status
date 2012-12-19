
module TmuxStatus
  module Segments
    class DecoratorContainer < Container
      def output
        index = 0
        count = segments.size
        segments_to_render = []

        while index < count
          glue = Glue.new(segments[index], segments[index + 1])
          segments_to_render << segments[index]
          segments_to_render << glue

          index+= 1
        end

        segments_to_render.pop

        segments_to_render.join
      end
    end
  end
end
