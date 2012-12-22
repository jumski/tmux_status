# encoding: utf-8
require 'spec_helper'

describe TmuxStatus::Segments::Glue do
  subject { described_class.new(left, right, options) }
  let(:direction) { :right }
  let(:options) { {direction: direction, bg: 77, fg: 88, bold: false} }

  context 'when segments have same bg' do
    let(:left) { stub('Segment', bg: 1, fg: 11) }
    let(:right)  { stub('Segment', bg: 1, fg: 12) }

    it 'uses bg and fg and line separator character' do
      expect(subject.output).to eq(' ⮁ ')
    end

    context "when direction left" do
      let(:direction) { :left }

      its(:fg) { should == right.bg }
      its(:bg) { should == left.bg }
    end

    context "when direction right" do
      let(:direction) { :right }

      its(:fg) { should == left.bg }
      its(:bg) { should == right.bg }
    end

    it { should be_a(TmuxStatus::Segment) }
  end

  context 'when segments dont have same bg' do
    let(:left) { stub('Segment', bg: 1) }
    let(:right)  { stub('Segment', bg: 2) }

    it 'uses both bgs and triangle separator character' do
      expect(subject.output).to eq('█⮀ ')
    end

    it { should be_a(TmuxStatus::Segment) }
  end
end
