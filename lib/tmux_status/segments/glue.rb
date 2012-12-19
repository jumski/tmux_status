# encoding: utf-8
module TmuxStatus
  module Segments
    class Glue < Segment
      def initialize(first, last)
        @first, @last = first, last
      end

      def to_s
        if @first.bg == @last.bg
          separator = '⮁'
          bg = @last.bg
          fg = @first.fg
        else
          separator = '⮀'
          bg = @last.bg
          fg = @first.bg
        end

        " #[bg=colour#{bg}]#[fg=colour#{fg}]#{separator} "
      end
    end
  end
end
