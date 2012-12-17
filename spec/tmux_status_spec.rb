require 'spec_helper'

describe TmuxStatus do
  describe '.line_from_string' do
    subject do
      string = 'music_player,date_time,transfer,battery'
      TmuxStatus.line_from_string(string)
    end

    it { should be_a TmuxStatus::Segments::Container }

    it 'creates segments' do
      segments = subject.segments

      segments[0].should be_a TmuxStatus::Segments::MusicPlayer
      segments[1].should be_a TmuxStatus::Segments::DateTime
      segments[2].should be_a TmuxStatus::Segments::Transfer
      segments[3].should be_a TmuxStatus::Segments::Battery
    end
  end
end
