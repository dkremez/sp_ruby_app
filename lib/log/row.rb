# frozen_string_literal: true

module Log
  # Parse logs lines into row to validate it and make easier to handle
  class Row
    PATH_REGEX = %r{^/.?}.freeze
    IP_REGEX = /^\d{3}.\d{3}.\d{3}.\d{3}$/.freeze

    def initialize(line)
      @line = line
    end

    def path
      @line.split(' ')[0]
    end

    def ip
      @line.split(' ')[1]
    end

    def valid?
      [path, ip].all? { |f| exists?(f) } &&
        valid_path? && valid_ip?
    end

    private

    def exists?(field)
      !field.nil? && !field.empty?
    end

    def valid_path?
      !(path =~ PATH_REGEX).nil?
    end

    def valid_ip?
      !(ip =~ IP_REGEX).nil?
    end
  end
end
