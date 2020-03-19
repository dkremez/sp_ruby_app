# frozen_string_literal: true

require 'log/row'

module Log
  class InvalidLineError < StandardError; end

  # Parse web logs files into PORO []Row
  class Parser
    def initialize(file_path)
      @file_path = file_path
    end

    def rows
      rows = []
      File.foreach(file_path).with_index do |line, i|
        row = parse_line!(line, i + 1)
        rows.push(row)
      end
      rows
    end

    private

    attr_reader :file_path

    def parse_line!(line, line_num)
      row = Row.new(line)
      raise_line_error(line_num) unless row.valid?
      row
    end

    def raise_line_error(line_num)
      raise InvalidLineError, "Invalid format at line ##{line_num}."
    end
  end
end
