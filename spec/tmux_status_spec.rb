require 'spec_helper'

describe TmuxStatus do
  describe '.line_from_string' do
    subject do
      TmuxStatus.line_from_string(['transfer,music_player'])
    end

    it { should be_a TmuxStatus::Container }

    it 'creates segments' do
      transfer, music_player = subject.segments

      transfer.should     be_a TmuxStatus::Segments::Transfer
      music_player.should be_a TmuxStatus::Segments::MusicPlayer
    end
  end
end
