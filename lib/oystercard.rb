# frozen_string_literal: true

require_relative "oystercard"
class Oystercard
  attr_reader :balance

  def initialize(balance = 0)
  @balance = balance
  end

  def top_up(money)
    @balance += money
  end
end

