# frozen_string_literal: true

module Log
  class Printer
    def initialize(statistic, output: $stdout)
      @statistic = statistic
      @output = output
    end

    def call
      stats.most_visits.each do |stat|
        line = Line.new(stat[0], stat[1], 'visit')
        output.puts line
      end

      stats.most_uniq_views.each do |stat|
        line = Line.new(stat[0], stat[1], 'unique view')
        output.puts line
      end
    end

    private

    attr_reader :statistic, :output
    alias_method :stats, :statistic 

    Line = Struct.new(:path, :count, :message) do
      def to_s
        "#{path} #{count} #{postfix}"
      end

      def postfix
        return message + 's' if count > 1
        message
      end
    end
  end
end
