# frozen_string_literal: true
require "oystercard"
RSpec.describe Oystercard do

  it { is_expected.to respond_to(:balance) }

  it "will initialize with with a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "will top up balance" do
   expect{ subject.top_up(3) }.to change{subject.balance}.by(3) 
  end
end
