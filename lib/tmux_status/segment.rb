
module TmuxStatus
  class Segment
    def initialize(options = {})
      @options = options
    end

    def to_s
      modes + cleared_output
    end

    def modes
      modes = ''
      modes << mode(:bg)
      modes << mode(:fg)
      modes << mode(:bold)
      modes
    end

    def cleared_output
      output.to_s.gsub(/\r\n/, ' ').gsub(/[\n\r]/, ' ').strip
    end

    def output
      @options[:string]
    end

    private
      def mode(key)
        if [:bg, :fg].include? key
          prefix = 'colour'
        else
          prefix = nil
        end

        "#[#{key}=#{prefix}#{@options[key]}]"
      end
  end
end
