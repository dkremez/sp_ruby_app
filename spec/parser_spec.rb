# frozen_string_literal: true

RSpec.describe 'parser.rb' do
  context 'valid log file' do
    let(:log_path) { fixture_path('logs/valid.log') }
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

    it 'prints the visits' do
      expect { system("./parser.rb #{log_path}") }.to output(expected_output).to_stdout_from_any_process
    end
  end

  context 'file path not provided' do
    it 'raise error' do
      expect { system('./parser.rb') }.to output.to_stderr_from_any_process
    end
  end

  context 'invalid path' do
    it 'raise error' do
      expect { system('./parser.rb no_path.log') }.to output.to_stderr_from_any_process
    end
  end

  context 'invalid file' do
    let(:log_path) { fixture_path('logs/invalid.log') }

    it 'raise error' do
      expect { system("./parser.rb #{log_path}") }.to output.to_stderr_from_any_process
    end
  end
end
