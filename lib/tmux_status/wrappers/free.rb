
module TmuxStatus
  module Wrappers
    class Free
      def total
        memory_segments[1].to_i
      end

      def used
        memory_segments[2].to_i
      end

      def free
        memory_segments[3].to_i
      end

      private
        def memory_segments
          output.split("\n").grep(/^Mem:/)[0].split(/\s+/)
        end

        def output
          %x[ free ]
        end
    end
  end
end
