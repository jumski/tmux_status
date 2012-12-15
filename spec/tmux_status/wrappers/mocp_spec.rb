require 'spec_helper'

describe TmuxStatus::Wrappers::Mocp do
  before { subject.stubs(output: output) }
  let(:output) do
    File.read("spec/fixtures/mocp_#{state}.txt")
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

  xit '#output shells out to "mocp -i"'
end
