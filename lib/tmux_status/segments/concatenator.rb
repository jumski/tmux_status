
module TmuxStatus
  class Concatenator < Segment
    def initialize(segments, options)
      @segments, @options = segments, options
    end

    def output
      @segments.inject('') do |output, segment|
        output << segment.to_s
      end
    end
  end
end
