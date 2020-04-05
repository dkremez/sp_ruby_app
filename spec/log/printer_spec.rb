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
        +----------+--------+
        | Path     | Visits |
        +----------+--------+
        | /contact | 3      |
        | /about   | 2      |
        | /home    | 1      |
        +----------+--------+
        +----------+--------------+
        | Path     | Unique views |
        +----------+--------------+
        | /contact | 2            |
        | /about   | 2            |
        | /home    | 1            |
        +----------+--------------+
      OUTPUT
    end

    it 'prints statistic to the console' do
      expect { subject.call }.to output(expected_output).to_stdout
    end
  end
end
