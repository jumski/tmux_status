# encoding: utf-8
module TmuxStatus
  module Segments
    class Glue < Segment
      ONE_COLOR_SEPARATORS =   { left: ' ⮃ ', right: ' ⮁ ' }
      MULTI_COLOR_SEPARATORS = { left: ' ⮂█', right: '█⮀ ' }

      def initialize(left, right, options = {})
        @left, @right = left, right
        super(options)
      end

      def output
        separator
      end

      def separator
        if segments_have_same_bg?
          ONE_COLOR_SEPARATORS[direction]
        else
          MULTI_COLOR_SEPARATORS[direction]
        end
      end

      def fg
        left? ? @right.bg : @left.bg
      end

      def bg
        left? ? @left.bg : @right.bg
      end

      def segments_have_same_bg?
        @left.bg == @right.bg
      end

      def segments
        [@left, @right]
      end

      def left?
        @options[:direction] == :left
      end

      def right?
        @options[:direction] == :right
      end

      def default_options
        super.merge(direction: :left)
      end
    end
  end
end
