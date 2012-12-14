current_dir = File.dirname(__FILE__)

require 'rspec'
require 'mocha/api'
require 'pry'
require File.join(current_dir, '../lib/tmux_status')

Dir[File.join(current_dir, 'spec/support/**/*.rb')].each do |path|
  require path
end

RSpec.configure do |config|
  config.mock_with :mocha
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
