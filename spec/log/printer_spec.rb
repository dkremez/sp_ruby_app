# frozen_string_literal: true

RSpec.describe Log::Printer do
  let(:statistic) do
    double('StatisticReport',
           most_visits: [
             ['/contact', 3],
             ['/about', 2],
             ['/home', 1]
           ],
           most_uniq_views: [
             ['/contact', 2],
             ['/about', 2],
             ['/home', 1]
           ])
  end
  subject { described_class.new(statistic) }

  describe '#call' do
    let(:expected_output) do
      <<~OUTPUT
        +----------+-------+---------+
        | Path     | Count | Message |
        +----------+-------+---------+
        | /contact | 3     | visits  |
        | /about   | 2     | visits  |
        | /home    | 1     | visit   |
        +----------+-------+---------+
        +----------+-------+--------------+
        | Path     | Count | Message      |
        +----------+-------+--------------+
        | /contact | 3     | unique views |
        | /about   | 2     | unique views |
        | /home    | 1     | unique view  |
        +----------+-------+--------------+
      OUTPUT
    end

    it 'prints statistic to the console' do
      expect { subject.call }.to output(expected_output).to_stdout
    end
  end
end
