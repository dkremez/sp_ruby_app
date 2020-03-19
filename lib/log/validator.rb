# frozen_string_literal: true

module Log
  class NoFilePathError < StandardError; end
  class FileNotExistsError < StandardError; end

  # This class validates the provided log file path in order to ensure
  # that final script will finish succesfully
  class Validator
    def initialize(file_path)
      @file_path = file_path
    end

    def validate!
      raise NoFilePathError, 'Log file path not provided.' unless file_path?
      raise FileNotExistsError, "Log file doesn't exist." unless file_exists?

      true
    end

    private

    attr_reader :file_path

    def file_path?
      !file_path.nil? && !file_path.empty?
    end

    def file_exists?
      File.exist?(file_path)
    end
  end
end
