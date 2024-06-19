# frozen_string_literal: true

module Rtdeskew
  class Configuration
    attr_accessor :input, :output, :threshold, :angle, :debug

    def initialize
      @input = nil
      @output = nil
      @threshold = 0.5
      @angle = 0
      @debug = false
    end
  end
end
