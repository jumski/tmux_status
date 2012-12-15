require 'spec_helper'

describe TmuxStatus::Segments::MocpStatus do
  subject { described_class.new(options) }
  let(:options) do
    {
      playing_symbol: 'p',
      stopped_symbol: 's',
    }
  end

  it { should be_a(TmuxStatus::Segment) }

  its(:mocp) { should be_a TmuxStatus::Wrappers::Mocp }

  describe '#output' do
    context 'when mocp is stopped' do
      before { subject.mocp.stubs(state: :stopped) }

      its(:output) { should eq(options[:stopped_symbol]) }
    end

    context 'when player is paused' do
      before do
        subject.mocp.stubs(state: :paused)
        subject.stubs(title: '[title]')
      end

      its(:output) do
        should eq("#{options[:paused_symbol]}[title]")
      end
    end

    context 'when player is playing' do
      before do
        subject.mocp.stubs(state: :playing)
        subject.stubs(title: '[title]')
      end

      its(:output) do
        should eq("#{options[:playing_symbol]}[title]")
      end
    end
  end

  describe '#title' do
    context 'when mocp title is longer than 16 characters' do
      before do
        subject.mocp.stubs(title: 'Black Sun Empire - Arrakis')
      end

      it 'truncates mocp full title to 16 characters' do
        expect(subject.title).to eq('Black Sun Empire')
      end
    end

    context 'when mocp title is equal or shorter than 16 characters' do
      before do
        subject.mocp.stubs(title: 'Rido - Exoplanet')
      end

      it 'shows full title' do
        expect(subject.title).to eq('Rido - Exoplanet')
      end
    end
  end
end
