
class TmuxStatus
  class Segment
    def initialize(options = {})
      @options = options
    end

    def to_s
      modes + cleared_output
    end

    def modes
      modes = '#['
      modes << "bg=colour#{@options[:bg]},"
      modes << "fg=colour#{@options[:fg]},"
      modes << "bold=#{@options[:bold]}"
      modes << ']'
      modes
    end

    def cleared_output
      output.gsub(/\r\n/, ' ').gsub(/[\n\r]/, ' ').strip
    end

    def output
      raise UnimplementedError.new
    end
  end
end
