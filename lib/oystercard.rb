# frozen_string_literal: true

require_relative "oystercard"
class Oystercard
  LIMIT = 90
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(money)
    raise "you have reached your top up limit of #{LIMIT}" if money + @balance > LIMIT
  
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def in_journey?
  end
end
