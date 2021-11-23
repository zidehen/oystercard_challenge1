# frozen_string_literal: true
 require "oystercard"
RSpec.describe Oystercard do
  describe "#balance" do 
    it { is_expected.to respond_to(:balance) }

    it "will initialize with with a default balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }
  
    it "will top up balance" do
     expect { subject.top_up(3) }.to change{ subject.balance }.by(3) 
    end
    
    it "it raises an error if we try to top up more than our limit" do
      limit = Oystercard::LIMIT
      subject.top_up(limit)
      expect { subject.top_up(4) }.to raise_error "you have reached your top up limit of #{limit}"
    end
  end
  
  describe "#deduct" do
    it { is_expected.to respond_to(:deduct).with(1).argument }
    
    it "will deduct from the balance" do
      expect { subject.deduct(3) }.to change{ subject.balance }.by(-3)
    end
  end

  describe "#in_journey?" do
    it { is_expected.to respond_to(:in_journey?)}
  end
end
