# frozen_string_literal: true

require_relative "oystercard"
class Oystercard
  LIMIT = 90
  MINIMUM_AMOUNT = 1
  attr_reader :balance, :in_journey

  def initialize
    @in_journey = false
    @balance = 0
  end

  def top_up(money)
    raise "you have reached your top up limit of #{LIMIT}" if money + @balance > LIMIT
  
    @balance += money
  end

  
  def touch_in
    raise "Need minimum amount of £#{MINIMUM_AMOUNT} to touch in" if under_minimum_amount
    @in_journey = true
    # return "you have touched in"
    
  end
  
  def touch_out
    deduct(MINIMUM_AMOUNT)
    @in_journey = false
  
    return "you have touched out"
  end
  
  def under_minimum_amount
    @balance < MINIMUM_AMOUNT
  end
  
  private

  def deduct(money)
    @balance -= money
  end
  
end
