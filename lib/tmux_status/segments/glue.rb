# encoding: utf-8
module TmuxStatus
  module Segments
    class Glue < Segment
      def initialize(first, last)
        @first, @last = first, last
      end

      def to_s
        "#[bg=colour#{@last.bg}]#[fg=colour#{@first.bg}]⮀"
      end
    end
  end
end
