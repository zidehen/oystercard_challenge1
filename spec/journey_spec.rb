require 'journey'

RSpec.describe Journey do

  describe "#initialize" do
    it "defaults with empty journey list" do
      subject = Journey.new
      expect(subject.journey_list).to eq []
    end
  end

end