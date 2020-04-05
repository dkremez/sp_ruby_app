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
      Terminal::Table.new headings: %w[Path Count Message], rows: visits_rows
    end

    def uniq_views_table
      Terminal::Table.new headings: %w[Path Count Message], rows: uniq_view_rows
    end

    def visits_rows
      stats.most_visits.map do |stat|
        message = pluralize('visit', stat[1])
        stat + [message]
      end
    end

    def uniq_view_rows
      stats.most_visits.map do |stat|
        message = pluralize('unique view', stat[1])
        stat + [message]
      end
    end

    def pluralize(word, count)
      count > 1 ? "#{word}s" : word
    end
  end
end
