# frozen_string_literal: true

RSpec.describe 'parser.rb' do
  context 'valid log file' do
    let(:log_path) { fixture_path('logs/valid.log') }
    let(:expected_output) do
      <<~OUTPUT
        /contact 3 visits
        /about 2 visits
        /home 1 visit
        /about 2 unique views
        /contact 2 unique views
        /home 1 unique view
      OUTPUT
    end

    xit 'prints the visits' do
      expect(`./parser.rb #{log_path}`).to eq expected_output
    end
  end

  context 'file path not provided' do
    it 'raise no path error' do
      expect(`./parser.rb`).to eq "Log file path not provided.\n"
    end
  end

  context 'invalid path' do
    it 'raise no file error' do
      expect(`./parser.rb no_path.log`).to eq "Log file doesn't exist.\n"
    end
  end
end
