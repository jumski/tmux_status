require 'spec_helper'
require 'erb'

describe TmuxStatus::Wrappers::Ifconfig do
  before do
    string = File.read("spec/fixtures/ifconfig_iface_#{iface_status}.txt")
    template = ERB.new(string)
    output = template.result(binding)

    described_class.any_instance.stubs(ifconfig: output)
  end

  context 'when ppp0 interface is found' do
    let(:iface_status) { :found }

    let(:downloaded_bytes) { 1024 * 1024 * 23 }
    let(:uploaded_bytes)   { 1024 * 1024 * 5 }

    it { should be_up }
    its(:downloaded) { should eq(downloaded_bytes) }
    its(:uploaded)   { should eq(uploaded_bytes) }
  end

  context 'when ppp0 interface is not found' do
    let(:iface_status) { :not_found }

    it { should_not be_up }
    its(:downloaded) { should be_nil }
    its(:uploaded)   { should be_nil }
  end
end
