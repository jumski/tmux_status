require 'spec_helper'

describe TmuxStatus::Segments::MusicPlayer do
  subject { described_class.new(options) }
  let(:options) do
    {
      max_length: 8,
      playing_symbol: 'p',
      stopped_symbol: 's',
    }
  end
  let(:max_length) { options[:max_length] }
  let(:wrapper) { subject.wrapper }

  it { should be_a(TmuxStatus::Segment) }

  its(:wrapper) { should be_a TmuxStatus::Wrappers::Mocp }

  describe '#output' do
    context 'when wrapper is stopped' do
      before { wrapper.stubs(state: :stopped) }

      its(:output) { should eq(options[:stopped_symbol]) }
    end

    context 'when wrapper is paused' do
      before do
        wrapper.stubs(state: :paused, title: '[title]')
      end

      its(:output) do
        should eq("#{options[:paused_symbol]} [title]")
      end
    end

    context 'when wrapper is playing' do
      before do
        wrapper.stubs(state: :playing, title: '[title]')
      end

      its(:output) do
        should eq("#{options[:playing_symbol]} [title]")
      end
    end
  end

  describe '#title' do
    context 'when wrapper title is longer than max_length' do
      before { wrapper.stubs(title: '123456789') }

      it 'truncates wrapper title to max_length characters' do
        expect(subject.title).to eq('12345678')
      end
    end
  end
end
