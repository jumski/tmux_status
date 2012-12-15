
module TmuxStatus
  class Concatenator < Segment
    def initialize(segments)
      @segments = segments
    end

    def output
      @segments.join
    end

    def modes; '' end
  end
end
