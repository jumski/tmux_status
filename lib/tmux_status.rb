$: << File.expand_path(File.dirname(__FILE__))

class TmuxStatus; end

require "tmux_status/version"
require "tmux_status/unimplemented_error"
require "tmux_status/segment"
require "tmux_status/segments/concatenator"
require "tmux_status/segments/mocp_player"

