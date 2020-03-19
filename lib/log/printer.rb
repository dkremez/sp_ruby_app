# frozen_string_literal: true

module Log
  # Prints calculated page visits statistic
  class Printer
    def initialize(statistic, output: $stdout)
      @statistic = statistic
      @output = output
    end

    def call
      print_lines.each do |line|
        output.puts line
      end
    end

    private

    attr_reader :statistic, :output
    alias stats statistic

    def print_lines
      visits_lines + uniq_view_lines
    end

    def visits_lines
      stats.most_visits.map do |stat|
        Line.new(stat[0], stat[1], 'visit')
      end
    end

    def uniq_view_lines
      stats.most_uniq_views.map do |stat|
        Line.new(stat[0], stat[1], 'unique view')
      end
    end

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
