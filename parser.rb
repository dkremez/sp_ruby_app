#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << File.join(__dir__, 'lib')
require 'colorize'
require 'sp_ruby_app'

file_path = ARGV[0]

begin
  validator = Log::Validator.new(file_path)
  validator.validate!

  stats_storage = Log::StatisticStorage.new
  parser        = Log::Parser.new(file_path, storage: stats_storage)
  parser.call

  stats_report  = Log::StatisticReport.new(stats_storage)
  printer       = Log::Printer.new(stats_report)
  printer.call
rescue Log::NoFilePathError,
       Log::FileNotExistsError,
       Log::InvalidLineError => e
  warn(e.message&.colorize(:red))
  exit
end
