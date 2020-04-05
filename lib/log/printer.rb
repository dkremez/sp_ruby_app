# frozen_string_literal: true

require 'terminal-table'

module Log
  # Prints calculated page visits statistic
  class Printer
    def initialize(statistic, output: $stdout)
      @statistic = statistic
      @output = output
    end

    def call
      puts visits_table
      puts uniq_views_table
    end

    private

    attr_reader :statistic, :output
    alias stats statistic

    def visits_table
      Terminal::Table.new headings: %w[Path Visits], rows: visits_rows
    end

    def uniq_views_table
      Terminal::Table.new headings: ['Path', 'Unique views'], rows: uniq_view_rows
    end

    def visits_rows
      stats.most_visits
    end

    def uniq_view_rows
      stats.most_uniq_views
    end
  end
end
