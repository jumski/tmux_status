# encoding: utf-8
require 'spec_helper'

describe TmuxStatus::Segments::Glue do
  let(:first) { stub('Segment', bg: 1) }
  let(:last)  { stub('Segment', bg: 2) }
  subject { described_class.new(first, last) }

  it { should be_a(TmuxStatus::Segment) }

  its(:to_s) { should eq('#[bg=colour2]#[fg=colour1]⮀') }
end
