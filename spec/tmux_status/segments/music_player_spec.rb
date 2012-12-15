require 'spec_helper'

describe TmuxStatus::Segments::MusicPlayer do
  subject { described_class.new(options) }
  let(:options) do
    {
      playing_symbol: 'p',
      stopped_symbol: 's',
    }
  end
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
        should eq("#{options[:paused_symbol]}[title]")
      end
    end

    context 'when wrapper is playing' do
      before do
        wrapper.stubs(state: :playing, title: '[title]')
      end

      its(:output) do
        should eq("#{options[:playing_symbol]}[title]")
      end
    end
  end

  describe '#title' do
    context 'when wrapper title is longer than 16 characters' do
      before { wrapper.stubs(title: 'Black Sun Empire - Arrakis') }

      it 'truncates wrapper title to 16 characters' do
        expect(subject.title).to eq('Black Sun Empire')
      end
    end

    context 'when wrapper title is equal or shorter than 16 characters' do
      before { wrapper.stubs(title: 'Rido - Exoplanet') }

      it 'shows full title' do
        expect(subject.title).to eq('Rido - Exoplanet')
      end
    end
  end
end
