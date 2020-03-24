# frozen_string_literal: true

module Log
  # It stores the log statistic of vistis and uniq views
  class StatisticStorage
    def initialize
      @visits = Hash.new(0)
      @uniq_views = Hash.new(0)
      @visits_from_ip = Hash.new(0)
    end

    attr_reader :uniq_views, :visits

    def update(path, ip)
      uniq_views[path] += 1 if visits_from_ip[path + ip].zero?
      visits_from_ip[path + ip] += 1
      visits[path] += 1
    end

    private

    attr_reader :visits_from_ip
  end
end
