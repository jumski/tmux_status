# encoding: utf-8

$: << File.expand_path(File.dirname(__FILE__))

module TmuxStatus
  module_function

  def line_from_string(string)
    segments = string.split(',').map do |segment_name|
      klass_name = segment_name.split('_').map(&:capitalize).join
      klass = "TmuxStatus::Segments::#{klass_name}".constantize

      klass.new
    end

    Segments::Container.new(segments, direction: :left)
  end
end

require 'tmux_status/version'
require 'tmux_status/monkey_patches/string'
require 'tmux_status/wrappers/mocp'
require 'tmux_status/wrappers/ifconfig'
require 'tmux_status/wrappers/acpi_battery'
require 'tmux_status/unimplemented_error'
require 'tmux_status/segment'
require 'tmux_status/segments/container'
require 'tmux_status/segments/glue'
require 'tmux_status/segments/music_player'
require 'tmux_status/segments/transfer'
require 'tmux_status/segments/date_time'
require 'tmux_status/segments/battery'

