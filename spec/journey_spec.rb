require 'journey'

RSpec.describe Journey do
  
  describe "#initialize" do
    it "defaults with empty journey list" do
      subject = Journey.new
      expect(subject.journey_list).to eq []
    end
  end
  
  it "have entry station on initialization" do
    subject = Journey.new
    expect(subject.entry_station).to eq nil
  end
end