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
      File.open(file_path).each_line do |line|
        row = parse_line!(line)
        rows.push(row)
      end
      rows
    end

    private

    attr_reader :file_path

    def parse_line!(line)
      row = Row.new(line)
      raise InvalidLineError unless row.valid?

      row
    end
  end
end
