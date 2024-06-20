# frozen_string_literal: true

module Rtdeskew
  class Error < StandardError; end
  class InvalidImage < Error; end
  class InvalidPath < Error; end
  class InvalidOutput < Error; end
end
