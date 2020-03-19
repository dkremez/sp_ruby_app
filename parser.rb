#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << File.join(__dir__, 'lib')
require 'sp_ruby_app'

file_path = ARGV[0]

begin
  validator = Log::Validator.new(file_path)
  validator.validate!
rescue StandardError => e
  puts e.message
  exit
end

parser    = Log::Parser.new(file_path)
# stats     = Log::Statistic.new(lines: parser.lines)
# renderer  = Log::Renderer.new(stats: stats, output: $stdout)

# renderer.call
