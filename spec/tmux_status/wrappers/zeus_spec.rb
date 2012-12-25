require 'spec_helper'

describe TmuxStatus::Wrappers::Zeus do
  before do
    running_text = is_running ? 'running' : 'not_running'
    string = File.read("spec/fixtures/zeus_#{running_text}.txt")

    template = ERB.new(string)
    output = template.result(binding)

    described_class.any_instance.stubs(output: output)
  end

  context 'when no zeus process present' do
    let(:is_running) { false }

    its(:running?) { should be_false }
  end

  context 'when there is a live zeus process' do
    let(:is_running) { true }

    its(:running?) { should be_true }
  end
end
