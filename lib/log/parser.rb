# frozen_string_literal: true

require 'log/row'

module Log
  class InvalidLineError < StandardError; end

  # Parse web logs files
  class Parser
    def initialize(file_path, line_parser_class: Row, storage:)
      @file_path = file_path
      @line_parser_class = line_parser_class
      @storage = storage
    end

    def call
      File.foreach(file_path).with_index do |line, i|
        row = parse_line!(line, i + 1)
        storage.update(row.path, row.ip)
      end
    end

    private

    attr_reader :file_path, :line_parser_class, :storage

    def parse_line!(line, line_num)
      row = line_parser_class.new(line)
      raise_line_error(line_num) unless row.valid?
      row
    end

    def raise_line_error(line_num)
      raise InvalidLineError, "Invalid format at line ##{line_num}."
    end
  end
end
