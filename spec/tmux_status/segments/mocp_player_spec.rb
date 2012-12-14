require 'spec_helper'

describe TmuxStatus::MocpPlayer do
  subject { described_class.new(options) }
  let(:options) do
    {
      playing_symbol: 'p',
      stopped_symbol: 's',
    }
  end

  it 'inherits from Segment' do
    expect(subject).to be_a(TmuxStatus::Segment)
  end

  describe '#output' do
    context 'when mocp is stopped' do
      before { subject.mocp.stubs(status: :stopped) }

      its(:output) { should eq(options[:stopped_symbol]) }
    end

    context 'when player is paused' do
      before do
        subject.mocp.stubs(status: :paused)
        subject.stubs(title: '[title]')
      end

      its(:output) do
        should eq("#{options[:paused_symbol]}[title]")
      end
    end

    context 'when player is playing' do
      before do
        subject.mocp.stubs(status: :playing)
        subject.stubs(title: '[title]')
      end

      its(:output) do
        should eq("#{options[:playing_symbol]}[title]")
      end
    end
  end
end
