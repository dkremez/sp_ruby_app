# frozen_string_literal: true

RSpec.describe Log::Statistic do
  let(:file_path) { fixture_path('logs/valid.log') }
  let(:rows) { Log::Parser.new(file_path).rows }
  subject { described_class.new(rows) }

  describe '#by_visits' do
    let(:expected_result) do
      {
        "/contact"=>3,
        "/about"=>2,
        "/home"=>1
      }
    end

    it 'groups rows by visits from most to least' do
      expect(subject.by_visits).to eq expected_result
    end
  end

  describe '#by_uniq_views' do
    let(:expected_result) do
      {
        "/contact"=>2,
        "/about"=>2,
        "/home"=>1
      }
    end

    it 'groups rows by uniq views from most to least' do
      expect(subject.by_uniq_views).to eq expected_result
    end
  end

  describe '#most_visits' do
    let(:expected_result) do
      [
        ["/contact", 3],
        ["/about", 2],
        ["/home", 1]
      ]
    end

    it 'groups rows by uniq views from most to least' do
      expect(subject.most_visits).to eq expected_result
    end
  end

  describe '#most_uniq_views' do
    let(:expected_result) do
      [
        ["/contact", 2],
        ["/about", 2],
        ["/home", 1]
      ]
    end

    it 'groups rows by uniq views from most to least' do
      expect(subject.most_uniq_views).to eq expected_result
    end
  end
end
