require 'spec_helper'

describe TmuxStatus::Segments::Transfer do
  let(:ifconfig) do
    stub(downloaded: 1024*1024*23, uploaded: 1024*1024*5)
  end
  before do
    subject.stubs(ifconfig: ifconfig)
  end

  it { should be_a TmuxStatus::Segment }

  describe '#output' do
    context 'when interface is up' do
      before { ifconfig.stubs(up?: true) }

      it 'builds transfers string' do
        downloaded = ifconfig.downloaded.to_i / 1024 / 1024
        uploaded   = ifconfig.uploaded.to_i / 1024 / 1024

        expected_output = "#{subject.modes}#{ifconfig.downloaded}/#{ifconfig.uploaded}"

        expect(subject.output).to eq(expected_output)
      end
    end

    context 'when interface is down' do
      before { ifconfig.stubs(up?: false) }

      its(:output) { should be_nil }
    end

  end
end
