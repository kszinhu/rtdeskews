# frozen_string_literal: true

module Rtdeskew
  class Configuration
    attr_reader :input, :output, :threshold, :angle, :debug, :color

    THRESHOLD_RANGE = (0..1)
    VALIDATIONS_MAP = {
      input: ->(path) do
        raise ArgumentError,
          "Input file doesn't exist" unless File.exist?(path || "")
      end,
      output: ->(path) do
        raise ArgumentError,
          "Output directory doesn't exist" unless Dir.exist?(File.dirname(path || "")) # rubocop:disable Layout/LineLength
      end,
      threshold: ->(value) do
        raise ArgumentError,
          "Threshold must be a float" unless value.is_a?(Float)
        raise ArgumentError,
          "Threshold must be between 0 and 1" unless THRESHOLD_RANGE.cover?(value) # rubocop:disable Layout/LineLength
      end,
      angle: ->(value) do
        raise ArgumentError,
          "Angle must be an integer" unless value.is_a?(Integer)
      end,
      debug: ->(mode) do
        raise ArgumentError,
          "Debug must be a boolean" unless [true, false].include?(mode)
      end
    }

    def initialize(input: nil, output: nil, threshold: 0.5, color: "white",
                  angle: 0, debug: false)
      @input = input
      @output = output
      @threshold = threshold
      @color = color
      @angle = angle
      @debug = debug
    end

    # Reset configuration to default values
    def reset!
      @input = nil
      @output = nil
      @threshold = 0.5
      @color = "white"
      @angle = 0
      @debug = false
    end

    # Define setter methods for configuration settings to trigger validation
    VALIDATIONS_MAP.keys.each do |key|
      define_method("#{key}=") do |value|
        instance_variable_set("@#{key}", value)
        validate(key, value)
      end
    end

    private

    def validate(key, value)
      VALIDATIONS_MAP[key].call(value)
    end
  end

  # Rtdeskew.configure allows the user to set configuration options for the Rtdeskew library.
  #
  # Example:
  # ```ruby
  # Rtdeskew.configure { |config| config.threshold = 0.6 }
  # ```
  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
