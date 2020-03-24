# frozen_string_literal: true

module Log
  # Calculates the most visited routes
  # and the most visited unique routes
  class StatisticReport
    def initialize(storage)
      @storage = storage
    end

    def most_visits
      to_sorted_array(storage.visits)
    end

    def most_uniq_views
      to_sorted_array(storage.uniq_views)
    end

    private

    attr_reader :storage

    def to_sorted_array(hash)
      hash.to_a.sort_by { |_, count| -count }
    end
  end
end
