require 'spec_helper'

describe TmuxStatus::Segments::Battery do
  let(:options) { { discharging_symbol: 'x' } }
  let(:battery) { stub(percentage: 55) }

  subject { described_class.new(options) }

  before { subject.stubs(battery: battery) }

  describe '#output' do
    context 'when battery is discharging' do
      before { battery.stubs(discharging?: true) }

      it 'concatenates modes, symbol and percentage' do
        output = "#{subject.modes}#{options[:discharging_symbol]}55%"

        expect(subject.output).to eq(output)
      end
    end

    context 'when battery is not discharging' do
      before { battery.stubs(discharging?: false) }

      its(:output) { should be_nil }
    end

  end

end
