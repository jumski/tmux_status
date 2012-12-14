
class TmuxStatus
  class Segment
    def to_s
      output.gsub(/\r\n/, ' ').gsub(/[\n\r]/, ' ').strip
    end
  end
end
