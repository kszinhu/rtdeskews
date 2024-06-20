# frozen_string_literal: true

RSpec.describe Rtdeskew::Configuration do
  describe "validations" do
    before do
      Rtdeskew.configure do |config|
        config.reset!
        config.input = "spec/fixtures/sample.png"
      end
    end

    it "raises an error if threshold is not a float" do
      expect { Rtdeskew.configure { |config| config.threshold = "foo" } }
        .to raise_error(ArgumentError, "Threshold must be a float")
    end

    it "raises an error if threshold is not between 0 and 1" do # rubocop:disable RSpec/MultipleExpectations
      expect { Rtdeskew.configure { |config| config.threshold = -1.0 } }
        .to raise_error(ArgumentError, "Threshold must be between 0 and 1")
      expect { Rtdeskew.configure { |config| config.threshold = 2.0 } }
        .to raise_error(ArgumentError, "Threshold must be between 0 and 1")
    end

    it "raises an error if angle is not an integer" do
      expect { Rtdeskew.configure { |config| config.angle = "foo" } }
        .to raise_error(ArgumentError, "Angle must be an integer")
    end

    it "raises an error if input file does not exist" do
      expect { Rtdeskew.configure { |config| config.input = "foo" } }
        .to raise_error(ArgumentError, "Input file doesn't exist")
    end

    it "raises an error if output directory does not exist" do
      expect { Rtdeskew.configure { |config| config.output = "foo/bar" } }
        .to raise_error(ArgumentError, "Output directory doesn't exist")
    end
  end
end
