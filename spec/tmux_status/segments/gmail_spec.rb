require 'spec_helper'

describe TmuxStatus::Segments::Gmail do
  let(:wrapper) { stub_everything }
  let(:options) do
    {username: 'user', password: 'pass', icon: '[icon]'}
  end
  subject { described_class.new(options) }
  before  { subject.stubs(wrapper: wrapper) }

  context 'when there are no unread messages' do
    before { wrapper.stubs(any_unread?: false) }

    its(:output) { should be_nil }
  end

  context 'when there are 7 unread messages' do
    before do
      wrapper.stubs(any_unread?: true)
      wrapper.stubs(unread_count: 7)
    end

    its(:output) { should eq("[icon] 7")}
  end
end
