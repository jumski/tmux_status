$: << File.expand_path(File.dirname(__FILE__))

module TmuxStatus
  module_function

  def run(args)
    opts = { bg: 16, fg: 251, bold: true }

    segments = args[0].split(',').map do |name|
      klass_name = name.split('_').map(&:capitalize).join
      klass = "TmuxStatus::Segments::#{klass_name}".constantize

      klass.new(opts)
    end

    puts Concatenator.new(segments)
    exit 0
  end
end

require 'tmux_status/version'
require 'tmux_status/monkey_patches/string'
require 'tmux_status/wrappers/mocp'
require 'tmux_status/wrappers/ifconfig'
require 'tmux_status/unimplemented_error'
require 'tmux_status/segment'
require 'tmux_status/segments/concatenator'
require 'tmux_status/segments/mocp_status'
require 'tmux_status/segments/transfer'

