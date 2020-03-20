# frozen_string_literal: true

RSpec.describe Log::Validator do
  subject { described_class.new(file_path) }

  describe '#validate!' do
    context 'valid path' do
      let(:file_path) { fixture_path('logs/valid.log') }

      it { expect(subject.validate!).to be_truthy }
    end

    context 'file path not provided' do
      let(:file_path) { nil }

      it 'raise no path error' do
        expect { subject.validate! }.to raise_error(Log::NoFilePathError, 'Log file path not provided.')
      end
    end

    context 'invalid path' do
      let(:file_path) { 'no_file.log' }

      it 'raise file not exists error' do
        expect { subject.validate! }.to raise_error(Log::FileNotExistsError, "Log file doesn't exist.")
      end
    end
  end
end
