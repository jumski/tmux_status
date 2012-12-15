
module TmuxStatus
  class Concatenator < Segment
    def initialize(segments)
      @segments = segments
    end

    def output
      @segments.inject('') do |output, segment|
        output << segment.to_s
      end
    end

    def modes; '' end
  end
end
