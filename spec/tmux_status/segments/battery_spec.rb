require 'spec_helper'

describe TmuxStatus::Segments::Battery do
  let(:options) do
    { discharging_symbol: 'x', charging_symbol: 'y' }
  end
  let(:battery) { stub_everything(percentage: 55) }

  subject { described_class.new(options) }

  before { subject.stubs(battery: battery) }

  describe '#output' do
    context 'when battery is discharging' do
      before { battery.stubs(discharging?: true) }

      it 'concatenates symbol and percentage' do
        output = "#{options[:discharging_symbol]} 55%"

        expect(subject.output).to eq(output)
      end
    end

    context 'when battery is charging' do
      before { battery.stubs(charging?: true) }

      context 'percentage is above 80%' do
        before { battery.stubs(percentage: 81) }

        its(:output) { should be_nil }
      end

      context 'percentage is below 80%' do
        before { battery.stubs(percentage: 79) }

        it 'concatenates symbol and percentage' do
          output = "#{options[:charging_symbol]} 79%"

          expect(subject.output).to eq(output)
        end
      end
    end

  end

end
