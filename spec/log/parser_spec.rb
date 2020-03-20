# frozen_string_literal: true

RSpec.describe Log::Parser do
  subject { described_class.new(file_path) }

  describe '#rows' do
    context 'valid file' do
      let(:file_path) { fixture_path('logs/valid.log') }
      let(:file_lines_count) { File.open(file_path, 'r').readlines.size }

      it 'return parsed all rows' do
        expect(subject.rows.count).to eq file_lines_count
      end
    end

    context 'valid file' do
      let(:file_path) { fixture_path('logs/invalid.log') }

      it 'raise invalid line error' do
        expect { subject.rows }.to raise_error(Log::InvalidLineError)
      end
    end
  end
end
