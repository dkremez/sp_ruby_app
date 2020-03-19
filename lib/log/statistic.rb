# frozen_string_literal: true

module Log
  class Statistic
    def initialize(log_rows)
      @log_rows = log_rows
    end

    def by_visits
      tally(rows)
    end

    def by_uniq_views
      tally(rows.uniq { |row| row.path+row.ip })
    end

    def most_visits
      to_sorted_array(by_visits)
    end

    def most_uniq_views
      to_sorted_array(by_uniq_views)
    end

    private

    attr_reader :log_rows
    alias_method :rows, :log_rows 

    ## In Ruby 2.7.0 can be replaced by Array#tally
    def tally(array)
      array.inject(Hash.new(0)) do |memo, row|
        memo[row.path] += 1
        memo
      end
    end

    def to_sorted_array(hash)
      hash.to_a.sort_by { |_, count| -count }
    end
  end
end
