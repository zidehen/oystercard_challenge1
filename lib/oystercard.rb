require_relative 'journey'

class Oystercard
  LIMIT = 90
  MINIMUM_AMOUNT = 1
  attr_reader :balance, :in_journey, :journey_list, :journey

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(money)
    raise "you have reached your top up limit of #{LIMIT}" if money + @balance > LIMIT
  
    @balance += money

  end

  
  def touch_in(entry_station)
    raise "Need minimum amount of £#{MINIMUM_AMOUNT} to touch in" if under_minimum_amount
    @journey.in_journey = true
    @journey.entry_station = entry_station
    return "you have touched in"
    @journey.journey_list << @entry_station
    
  end

  # def in_journey? #
  #   !!entry_station
  # end

  def touch_out(exit_station)
    deduct(MINIMUM_AMOUNT)
    @journey.in_journey = false
    @journey.exit_station = exit_station
    @journey.journey_list << {:entry_station => @entry_station, :exit_station => @exit_station} #
    @entry_station = nil
    return "you have touched out"
  end
  
  private

  def deduct(money)
    @balance -= money
  end
  
  def under_minimum_amount
    @balance < MINIMUM_AMOUNT
  end
  
end