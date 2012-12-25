require 'spec_helper'

describe TmuxStatus::Segments::Zeus do
  let(:zeus) { subject.zeus }

  it { should be_a TmuxStatus::Segment }
  its(:zeus) { should be_a TmuxStatus::Wrappers::Zeus }

  context 'when zeus is running' do
    before { zeus.stubs(running?: true) }

    its(:output) { should eq("Z") }
  end

  context 'when zeus is not running' do
    before { zeus.stubs(running?: false) }

    its(:output) { should be_nil }
  end
end
