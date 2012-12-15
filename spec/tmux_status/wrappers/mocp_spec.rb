require 'spec_helper'

describe TmuxStatus::Wrappers::Mocp do
  before { subject.stubs(mocp_info: mocp_info) }
  let(:mocp_info) do
    File.read("spec/fixtures/mocp_output/#{state}.txt")
  end

  context 'when mocp is stopped' do
    let(:state) { :stopped }

    its(:title) { should be_nil }
    its(:state) { should eq(:stopped) }
  end

  context 'when mocp is paused' do
    let(:state) { :paused }

    its(:title) { should eq('some title') }
    its(:state) { should eq(:paused) }
  end

  context 'when mocp is playing' do
    let(:state) { :playing }

    its(:title) { should eq('some title') }
    its(:state) { should eq(:playing) }
  end

  xit '#mocp_info shells out to "mocp -i"'
end
