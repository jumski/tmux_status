
module TmuxStatus
  class Segment
    def initialize(options = {})
      @options = default_options.merge(options)
    end

    def to_s
      return unless present?

      string = "#{modes}#{cleared_output}"

      if debug?
        string = "[ name=#{name},fg=#{fg},bg=#{bg},output='#{output}' ]"
      end

      string
    end

    def modes
      "#[bg=colour#{bg}]#[fg=colour#{fg}]#[bold=#{bold}]"
    end

    def bg;   @options[:bg]   end
    def fg;   @options[:fg]   end
    def bold; @options[:bold] end

    def cleared_output
      @cleared_output ||= output.to_s.gsub(/\r\n/, ' ').gsub(/[\n\r]/, ' ')
    end

    def output
      @options[:string]
    end

    def direction
      @options[:direction] || :left
    end

    def left?
      direction == :left
    end

    def right?
      direction == :right
    end

    def default_options; {} end

    def blank?
      cleared_output.nil? || cleared_output.empty?
    end

    def present?
      ! blank?
    end

    def name
      self.class.name.split('::').last
    end

    private
      def debug?
        !true
      end
  end
end
