require 'spec_helper'

describe String do
  it '#to_underscore converts CamelCase to snake_case' do
    expect('CamelCase'.to_underscore).to eq('camel_case')
  end
end
