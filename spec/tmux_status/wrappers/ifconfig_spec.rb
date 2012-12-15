require 'spec_helper'
require 'erb'

describe TmuxStatus::Wrappers::Ifconfig do
  before do
    described_class.any_instance.stubs(ifconfig: ifconfig_output)
  end

  let(:downloaded_bytes) { 1024 * 1024 * 23 }
  let(:uploaded_bytes)   { 1024 * 1024 * 5 }
  let(:ifconfig_output) do
    string = File.read("spec/fixtures/ifconfig_output/ppp0.txt")
    template = ERB.new(string)
    template.result(binding)
  end

  its(:downloaded) { should eq(downloaded_bytes) }
  its(:uploaded)   { should eq(uploaded_bytes) }
end
