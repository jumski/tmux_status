# encoding: utf-8
require 'date'

module TmuxStatus
  module Segments
    class DateTime < Segment
      DEFAULT_OPTIONS = {
        bg: 16, fg: 237, bold: false, format: '%H:%M %d-%m-%Y'
      }

      def initialize(options = {})
        @options = DEFAULT_OPTIONS.dup.merge(options)
      end

      def output
        ::DateTime.now.strftime(@options[:format])
      end
    end
  end
end
