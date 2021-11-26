require "oystercard"

RSpec.describe Oystercard do
  # let(:station){ double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

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
  

  describe "#touch_in" do

    it { is_expected.to respond_to(:touch_in).with(1).argument } 
    
    it "can touch in" do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(entry_station)
      expect(subject.in_journey).to eq true
    end

    it 'raises an error if we touch in with funds less than minimum amount' do
      # allow(subject).to receive(:touch_in).and_return true
      # subject.balance
      minimum_amount = Oystercard::MINIMUM_AMOUNT
      expect { subject.touch_in(entry_station) }.to raise_error "Need minimum amount of £#{minimum_amount} to touch in"
    end 
  end


  describe "#touch_out" do

    it "can touch out" do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.in_journey).to eq false
    end

    it "on touch out it will deduct from balance " do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_AMOUNT)
    end

    it { is_expected.to respond_to(:touch_out).with(1).argument } 

  end

  describe "#entry_station" do
    
    # it { is_expected.to respond_to(:entry_station)} 

    it 'remembers the entry station after touch in' do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
  end

  describe "#exit_station" do
    
    # it { is_expected.to respond_to(:exit_station)} 

    it 'remembers the exit station after touch out' do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end

  # describe '#journey_list' do
    
  #   it 'stores list of journeys' do
  #     subject.top_up(Oystercard::MINIMUM_AMOUNT)
  #     station = subject.touch_in(station)
  #     expect(subject.touch_in(station)).to eq station
  # end

  # it 'stores list of journeys' do
  #   subject.top_up(Oystercard::MINIMUM_AMOUNT)
  #   expect(subject.touch_in(station)).to eq :journey_list["station"]
  # end

  end



end
