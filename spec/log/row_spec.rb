# frozen_string_literal: true

RSpec.describe Log::Row do
  subject { described_class.new(line) }

  describe '#valid?' do
    context 'valid line' do
      let(:line) { "/contact 184.123.665.067" }

      it { expect(subject.valid?).to be_truthy }
    end

    context 'invalid line' do
      let(:line) { "sometext" }

      it { expect(subject.valid?).to be_falsy }
    end

    context 'invalid ip' do
      let(:line) { "/sometext asdad1.123" }

      it { expect(subject.valid?).to be_falsy }
    end

    context 'invalid path' do
      let(:line) { "123sometext 184.123.665.067" }

      it { expect(subject.valid?).to be_falsy }
    end
  end

end
