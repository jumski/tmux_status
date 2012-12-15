
module TmuxStatus
  class Concatenator < Segment
    DEFAULT_OPTIONS = { bg: 20, fg: 100, bold: false }

    def initialize(segments, options = {})
      @segments = segments
      @options = DEFAULT_OPTIONS.dup.merge(options)
    end

    def output
      @segments.inject('') do |output, segment|
        output << segment.to_s
      end
    end
  end
end
