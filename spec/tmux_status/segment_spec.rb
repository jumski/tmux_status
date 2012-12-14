require 'spec_helper'

describe TmuxStatus::Segment do
  subject { described_class.new }

  describe '#to_s' do
    it 'outputs #output' do
      subject.stubs(output: 'string')

      expect(subject.to_s).to eq(subject.output)
    end

    it 'changes any newlines to spacec in the #output' do
      subject.stubs(output: "this\rstring\nis\r\nawesome")

      expect(subject.to_s).to eq('this string is awesome')
    end

    it 'strip whitespaces #output' do
      subject.stubs(output: ' this string is awesome ')

      expect(subject.to_s).to eq('this string is awesome')
    end
  end
end
