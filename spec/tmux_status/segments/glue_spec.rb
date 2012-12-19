# encoding: utf-8
require 'spec_helper'

describe TmuxStatus::Segments::Glue do
  subject { described_class.new(first, last) }

  context 'when segments have same bg' do
    let(:first) { stub('Segment', bg: 1, fg: 11) }
    let(:last)  { stub('Segment', bg: 1, fg: 12) }

    it 'uses bg and fg and line separator character' do
      expect(subject.to_s).to eq(' #[bg=colour1]#[fg=colour11]⮁ ')
    end

    it { should be_a(TmuxStatus::Segment) }
  end

  context 'when segments dont have same bg' do
    let(:first) { stub('Segment', bg: 1) }
    let(:last)  { stub('Segment', bg: 2) }

    it 'uses both bgs and triangle separator character' do
      expect(subject.to_s).to eq(' #[bg=colour2]#[fg=colour1]⮀ ')
    end

    it { should be_a(TmuxStatus::Segment) }
  end
end
