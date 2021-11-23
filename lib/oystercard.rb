# frozen_string_literal: true

require_relative "oystercard"
class Oystercard
  LIMIT = 90
  attr_reader :balance, :in_journey

  def initialize
    @in_journey = false
    @balance = 0
  end

  def top_up(money)
    raise "you have reached your top up limit of #{LIMIT}" if money + @balance > LIMIT
  
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    @in_journey = true
    return "you have touched in"
  end

  def touch_out
    @in_journey = false
    return "you have touched out"
  end
end
