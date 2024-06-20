# frozen_string_literal: true

RSpec.describe Rtdeskew::Processor do
  describe "#execute" do
    it "calls validate and deskew" do # rubocop:disable RSpec/MultipleExpectations
      processor = described_class.new
      allow(processor).to receive(:validate)
      allow(processor).to receive(:deskew)

      processor.execute

      expect(processor).to have_received(:validate)
      expect(processor).to have_received(:deskew)
    end
  end
end
