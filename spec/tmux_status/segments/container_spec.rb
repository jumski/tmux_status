require 'spec_helper'

describe TmuxStatus::Container do
  subject { described_class.new(segments) }
  let(:segments) { [] }

  it { should be_a(TmuxStatus::Segment) }

  describe '#output' do
    let(:segments) do
      [ stub('Segment', to_s: 'segment 1'),
        stub('Segment', to_s: 'segment 2') ]
    end

    it 'concatenates string values of provided segments' do
      expect(subject.output).to eq('segment 1segment 2')
    end
  end
end
