require 'spec_helper'

describe String do
  it '#to_underscore converts CamelCase to snake_case' do
    expect('CamelCase'.to_underscore).to eq('camel_case')
  end

  it '#camelize converts string to constant' do
    class DummyA
      class DummyB
        class DummyC
        end
      end
    end

    string = "DummyA::DummyB::DummyC"
    expect(string.constantize).to eq(DummyA::DummyB::DummyC)
  end
end
