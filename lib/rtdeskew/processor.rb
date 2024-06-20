# frozen_string_literal: true

module Rtdeskew
  # The Processor class is the core component of the Rtdeskew library.
  # Its primary function is to correct the orientation of scanned documents,
  # a process known as "deskewing".
  #
  # In many cases, scanned documents can appear slightly tilted, a problem known as "skew".
  # This skewing can occur due to irregular document placement or scanner feed issues during scanning.
  #
  # The main role of this class is to perform the deskew operation, aligning the document image
  # correctly along the horizontal or vertical axis. Proper alignment is crucial for enhancing the accuracy
  # of OCR (Optical Character Recognition) systems, which rely on well-aligned text to interpret content accurately.
  #
  # Key components of the Processor class:
  # - `input`: specifies the path or source of the image that needs to be processed.
  # - `output`: defines the path where the processed image will be saved after the orientation adjustment.
  # - `configuration`: loads the predefined settings for processing, including input and output paths.
  #
  # Methods:
  # - `execute`: An instance method that validates inputs and performs the deskew operation.
  #
  # Usage example:
  # Rtdeskew::Processor.execute
  #
  # This command initializes and runs the image deskewing process using the default settings specified.
  class Processor
    attr_accessor :input, :output, :configuration

    def initialize
      @configuration = Rtdeskew.configuration
      @input = configuration.input
      @output = configuration.output
    end

    def self.execute
      new.execute
    end

    def execute
      validate
      deskew
    end

    private

    def deskew
      raise NotImplementedError
    end

    def validate
      raise NotImplementedError
    end
  end
end
