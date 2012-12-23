require 'spec_helper'

describe TmuxStatus::Wrappers::Free do
  before do
    string = File.read("spec/fixtures/free.txt")
    template = ERB.new(string)
    output = template.result(binding)

    subject.stubs(output: output)
  end
  let(:total) { 99*1024*1024 }
  let(:used)  { 33*1024*1024 }
  let(:free)  { 66*1024*1024 }

  its(:total) { should eq(total) }
  its(:used)  { should eq(used) }
  its(:free)  { should eq(free) }
end
