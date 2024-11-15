# frozen_string_literal: true

module Rtdeskew
  module Core
    class FFTW
      THREADS = [Concurrent.processor_count, 4].max

      def initialize
      end
    end
  end
end
