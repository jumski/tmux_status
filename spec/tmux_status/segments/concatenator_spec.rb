require 'spec_helper'

describe TmuxStatus::Concatenator do
  describe '#output' do
    it 'concatenates string values of provided segments' do
      segments = [
        stub('Segment', to_s: 'segment 1'),
        stub('Segment', to_s: 'segment 2')
      ]

      subject = described_class.new(segments)

      expect(subject.output).to eq('segment 1segment 2')
    end
  end
end
