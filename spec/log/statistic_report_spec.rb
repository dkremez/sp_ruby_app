# frozen_string_literal: true

RSpec.describe Log::StatisticReport do
  let(:file_path) { fixture_path('logs/valid.log') }
  let(:storage) do
    double('StatisticStorage',
           visits: {
             '/contact' => 3,
             '/about' => 2,
             '/home' => 1
           },
           uniq_views: {
             '/contact' => 2,
             '/about' => 2,
             '/home' => 1
           })
  end
  subject { described_class.new(storage) }

  describe '#most_visits' do
    let(:expected_result) do
      [
        ['/contact', 3],
        ['/about', 2],
        ['/home', 1]
      ]
    end

    it 'return array of visits from most to least' do
      expect(subject.most_visits).to eq expected_result
    end
  end

  describe '#most_uniq_views' do
    let(:expected_result) do
      [
        ['/contact', 2],
        ['/about', 2],
        ['/home', 1]
      ]
    end

    it 'return array of uniq views from most to least' do
      expect(subject.most_uniq_views).to eq expected_result
    end
  end
end
