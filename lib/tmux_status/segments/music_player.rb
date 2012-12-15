
module TmuxStatus
  module Segments
    class MusicPlayer < Segment
      def wrapper
        @wrapper ||= Wrappers::Mocp.new
      end

      def output
        return @options[:stopped_symbol] if wrapper.state == :stopped

        symbol = @options["#{wrapper.state}_symbol".to_sym]

        "#{symbol}#{title}"
      end

      def title
        wrapper.title[0..15]
      end
    end
  end
end
