
class TmuxStatus
  class MocpPlayer < Segment
    def mocp
      @mocp ||= Object.new
    end

    def output
      return @options[:stopped_symbol] if mocp.status == :stopped

      symbol = @options["#{mocp.status}_symbol".to_sym]

      "#{symbol}#{title}"
    end

    # def status
    #   case mocp.status
    #   when :playing then @options[:playing_symbol]
    #   when :paused  then @options[:paused_symbol]
    #   when :stopped then @options[:stopped_symbol]
    #   end
    # end

    # def title
    #   return if mocp.status == :stopped
    # end
  end
end
