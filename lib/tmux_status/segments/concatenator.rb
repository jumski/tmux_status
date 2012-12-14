
class TmuxStatus
  class Concatenator
    def initialize(segments)
      @segments = segments
    end

    def output
      @segments.inject('') do |output, segment|
        output << segment.to_s
      end
    end
  end
end
