require 'spec_helper'

describe TmuxStatus::Segments::DecoratorContainer do
  subject { described_class.new(segments, options) }
  let(:options)  { {} }
  let(:segments) do
    [ stub('Segment', to_s: '[s1]', bg: 1),
      stub('Segment', to_s: '[s2]', bg: 2),
    stub('Segment', to_s: '[s3]', bg: 3) ]
  end

  it { should be_a TmuxStatus::Segments::Container }

  describe '#output' do
    context 'when separator option provided' do
      it 'renders glue between segments' do
        fake_glue_a = stub('Glue', to_s: '[glue a]')
        fake_glue_b = stub('Glue', to_s: '[glue b]')
        TmuxStatus::Segments::Glue.
          expects(:new).at_least_once.
          returns(fake_glue_a).then.returns(fake_glue_b)

        expect(subject.output).to eq('[s1][glue a][s2][glue b][s3]')
      end
    end
  end
end
