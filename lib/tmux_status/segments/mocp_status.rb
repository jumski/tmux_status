
module TmuxStatus
  module Segments
    class MocpStatus < Segment
      def mocp
        @mocp ||= Wrappers::Mocp.new
      end

      def output
        return @options[:stopped_symbol] if mocp.state == :stopped

        symbol = @options["#{mocp.state}_symbol".to_sym]

        "#{symbol}#{title}"
      end

      def title
        mocp.title[0..15]
      end
    end
  end
end
