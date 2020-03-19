#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << File.join(__dir__, 'lib')
require 'sp_ruby_app'

file_path = ARGV[0]

begin
  validator = Log::Validator.new(file_path)
  validator.validate!

  parser    = Log::Parser.new(file_path)
  statistic = Log::Statistic.new(parser.rows)
  printer   = Log::Printer.new(statistic)
  printer.call
rescue Log::NoFilePathError,
       Log::FileNotExistsError,
       Log::InvalidLineError => e
  puts e.message
  exit
end
