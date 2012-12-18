require 'spec_helper'

describe TmuxStatus::Segment do
  subject { described_class.new(options) }
  let(:string)  { 'some string' }
  let(:options) { {string: string, bg: 1, fg: 2, bold: false} }

  its(:output) { should == string }

  describe '#to_s' do
    it 'concatenates #modes with #cleared_output' do
      subject.stubs(cleared_output: '[output]', modes: '[modes]')

      expect(subject.to_s).to eq('[modes][output]')
    end
  end

  describe '#modes' do
    it 'outputs Tmux modes string containing various options' do
      expect(subject.modes).to eq('#[bg=colour1]#[fg=colour2]#[bold=false]')
    end
  end

  its(:bg) { should eq(1) }
  its(:fg) { should eq(2) }

  describe '#cleared_output' do
    it 'changes any newlines to spaces in the #output' do
      subject.stubs(output: "this\rstring\nis\r\nawesome")

      expect(subject.cleared_output).to eq('this string is awesome')
    end

    it 'strip whitespaces from #output' do
      subject.stubs(output: ' this string is awesome ')

      expect(subject.cleared_output).to eq('this string is awesome')
    end

    it 'does not raise any errors if #output is nil' do
      subject.stubs(output: nil)

      expect { subject.cleared_output }.to_not raise_error
    end
  end
end
