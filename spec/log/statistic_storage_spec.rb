# frozen_string_literal: true

RSpec.describe Log::StatisticStorage do
  let(:file_path) { fixture_path('logs/valid.log') }
  subject { described_class.new }

  before do
    Log::Parser.new(file_path, storage: subject).call
  end

  describe '#visits' do
    let(:expected_result) do
      {
        '/contact' => 3,
        '/about' => 2,
        '/home' => 1
      }
    end

    it 'groups rows by visits from most to least' do
      expect(subject.visits).to eq expected_result
    end
  end

  describe '#uniq_views' do
    let(:expected_result) do
      {
        '/contact' => 2,
        '/about' => 2,
        '/home' => 1
      }
    end

    it 'groups rows by uniq views from most to least' do
      expect(subject.uniq_views).to eq expected_result
    end
  end
end
