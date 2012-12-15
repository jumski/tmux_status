require 'spec_helper'

describe TmuxStatus do
  describe '.line_from_string' do
    subject do
      TmuxStatus.line_from_string(['transfer,mocp_status'])
    end

    it { should be_a TmuxStatus::Container }

    it 'creates segments' do
      transfer, mocp_status = subject.segments

      transfer.should    be_a TmuxStatus::Segments::Transfer
      mocp_status.should be_a TmuxStatus::Segments::MocpStatus
    end
  end
end
