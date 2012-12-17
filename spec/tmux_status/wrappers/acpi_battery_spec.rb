require 'spec_helper'

describe TmuxStatus::Wrappers::AcpiBattery do
  before do
    string = File.read("spec/fixtures/battery_#{state}.txt")
    template = ERB.new(string)
    output = template.result(binding)

    described_class.any_instance.stubs(output: output)
  end
  subject { described_class.new }
  let(:percentage) { 77 }

  context 'when battery is discharging' do
    let(:state) { :discharging }

    its(:percentage)   { should eq(77) }
    its(:discharging?) { should be_true }
    its(:charging?)    { should be_false }
    its(:charged?)     { should be_false }
  end

  context 'when battery is charging' do
    let(:state) { :charging }

    its(:percentage)   { should eq(77) }
    its(:discharging?) { should be_false }
    its(:charging?)    { should be_true }
    its(:charged?)     { should be_false }
  end

  context 'when battery is charged' do
    let(:state) { :charged }

    its(:percentage)   { should eq(100) }
    its(:discharging?) { should be_false }
    its(:charging?)    { should be_false }
    its(:charged?)     { should be_true }
  end
end
