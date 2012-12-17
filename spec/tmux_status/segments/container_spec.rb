require 'spec_helper'

describe TmuxStatus::Segments::Container do
  subject { described_class.new(segments, options) }
  let(:segments) { [] }
  let(:options)  { {} }

  it { should be_a(TmuxStatus::Segment) }

  describe '#output' do
    let(:segments) do
      [ stub('Segment', to_s: '[segment 1]'),
        stub('Segment', to_s: '[segment 2]') ]
    end

    its(:output) { should eq('[segment 1][segment 2]') }

    context 'when separator option provided' do
      let(:separator) { 'X' }
      let(:options) { {separator: separator} }

      its(:output) { should eq('[segment 1]X[segment 2]') }
    end
  end

  its(:segments) { should eq(segments) }
end
