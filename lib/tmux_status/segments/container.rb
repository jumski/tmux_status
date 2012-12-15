
module TmuxStatus
  class Container < Segment
    def initialize(segments)
      @segments = segments
    end

    def output
      @segments.join
    end

    def modes; '' end
  end
end
