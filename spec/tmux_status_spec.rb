require 'spec_helper'

describe TmuxStatus do
  describe '.line_from_string' do
    it 'creates container' do
      line = TmuxStatus.line_from_string(['transfer,mocp_status'])

      expect(line).to be_a TmuxStatus::Container
    end
  end
end
