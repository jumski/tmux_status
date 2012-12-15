$: << File.expand_path(File.dirname(__FILE__))

module TmuxStatus
end

require 'tmux_status/version'
require 'tmux_status/monkey_patches/string'
require 'tmux_status/wrappers/mocp'
require 'tmux_status/unimplemented_error'
require 'tmux_status/segment'
require 'tmux_status/segments/concatenator'
require 'tmux_status/segments/mocp_status'
require 'tmux_status/segments/transfer'

