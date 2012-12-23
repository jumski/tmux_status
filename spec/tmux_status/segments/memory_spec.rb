# encoding: utf-8
require 'spec_helper'

describe TmuxStatus::Segments::Memory do
  subject { described_class.new }

  its(:wrapper) { should be_a TmuxStatus::Wrappers::Free }

  it '#output prints used/total info in megabytes' do
    wrapper = stub(total: 100*1024, used: 23*1024)
    subject.stubs(wrapper: wrapper)

    expect(subject.output).to eq('⋆ 23/100')
  end

end
