# frozen_string_literal: true

require 'log/row'

module Log
  class Statistic
    def initialize(log_rows: rows)
      @log_rows = log_rows
    end

    def by_visits
      rows
        .inject(Hash.new(0)) do |memo, row|
          memo[row.path] += 1
          memo
        end
    end

    def by_uniq_views
      rows
        .uniq { |row| row.path+row.ip }
        .inject(Hash.new(0)) do |memo, row|
          memo[row.path] += 1
          memo
        end
    end

    private

    attr_reader :log_rows
    alias_method :rows, :log_rows 
  end
end
