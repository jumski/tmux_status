require 'spec_helper'

describe TmuxStatus::Segments::Transfer do
  let(:ifconfig) { stub(downloaded: 23, uploaded: 5) }
  before do
    subject.stubs(ifconfig: ifconfig)
  end

  it { should be_a TmuxStatus::Segment }

  describe '#output' do
    it do
      expected_output = "#{subject.modes}#{ifconfig.downloaded}/#{ifconfig.uploaded}"
      expect(subject.output).to eq(expected_output)
    end
  end
end
