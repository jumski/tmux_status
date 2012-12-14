
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

    def title
      mocp.full_title[0..15]
    end
  end
end
