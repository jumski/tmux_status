require 'date'

module TmuxStatus
  module Segments
    class DateTime < Segment
      DEFUALT_OPTIONS = { format: '%H:%M %d-%m-%Y' }

      def initialize(options = {})
        @options = DEFUALT_OPTIONS.dup.merge(options)
      end

      def output
        ::DateTime.now.strftime(@options[:format])
      end
    end
  end
end
