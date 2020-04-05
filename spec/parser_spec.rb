# frozen_string_literal: true

RSpec.describe 'parser.rb' do
  context 'valid log file' do
    let(:log_path) { fixture_path('logs/valid.log') }
    let(:expected_output) do
      <<~OUTPUT
        +----------+-------+---------+
        | Path     | Count | Message |
        +----------+-------+---------+
        | /contact | 3     | visits  |
        | /about   | 2     | visits  |
        | /home    | 1     | visit   |
        +----------+-------+---------+
        +----------+-------+--------------+
        | Path     | Count | Message      |
        +----------+-------+--------------+
        | /contact | 3     | unique views |
        | /about   | 2     | unique views |
        | /home    | 1     | unique view  |
        +----------+-------+--------------+
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
