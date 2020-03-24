# frozen_string_literal: true

RSpec.describe Log::Parser do
  let(:stats_storage_spy) { spy('StatsStorageSpy') }
  subject { described_class.new(file_path, storage: stats_storage_spy) }

  describe '#call' do
    context 'valid file' do
      let(:file_path) { fixture_path('logs/valid.log') }
      let(:file_lines_count) { File.open(file_path, 'r').readlines.size }

      it 'return parsed all rows' do
        subject.call
        expect(stats_storage_spy).to have_received(:update).at_least(file_lines_count).times
      end
    end

    context 'invalid file' do
      let(:file_path) { fixture_path('logs/invalid.log') }

      it 'raise invalid line error' do
        expect { subject.call }.to raise_error(Log::InvalidLineError)
      end
    end
  end
end
