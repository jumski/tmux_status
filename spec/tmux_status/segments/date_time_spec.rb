require 'spec_helper'

describe TmuxStatus::Segments::DateTime do
  let(:date_time) { DateTime.now }

  around do |example|
    Timecop.freeze(date_time) { example.run }
  end
  subject { described_class.new }

  it { should be_a TmuxStatus::Segment }

  describe '#output' do
    let(:format) { '%H:%I %d-%m-%Y' }

    it 'outputs date in proper format' do
      expect(subject.output).to eq(date_time.strftime(format))
    end
  end
end
