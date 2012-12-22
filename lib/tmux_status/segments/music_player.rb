# encoding: utf-8
module TmuxStatus
  module Segments
    class MusicPlayer < Segment
      def wrapper
        @wrapper ||= Wrappers::Mocp.new
      end

      def output
        symbol = @options["#{wrapper.state}_symbol".to_sym]

        return symbol if wrapper.state == :stopped

        "#{symbol} #{title}"
      end

      def title
        wrapper.title[0..(@options[:max_length]-1)]
      end

      private
        def default_options
          { bg: 235, fg: 59, playing_symbol: '♪', max_length: 30 }
        end
    end
  end
end
