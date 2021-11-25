
class Oystercard
  LIMIT = 90
  MINIMUM_AMOUNT = 1
  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey_list

  def initialize
    @balance = 0
    @journey_list = {
      :entry_station => @entry_station,
      :exit_station => @exit_station
    #   # :1 => [@entry_station, @exit_station]
    }
  end

  def top_up(money)
    raise "you have reached your top up limit of #{LIMIT}" if money + @balance > LIMIT
  
    @balance += money

  end

  
  def touch_in(entry_station)
    raise "Need minimum amount of £#{MINIMUM_AMOUNT} to touch in" if under_minimum_amount
    @in_journey = true
    @entry_station = entry_station
    # return "you have touched in"
    @journey_list[:entry_station] = entry_station
    
  end

  def in_journey?
    !!entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_AMOUNT)
    @in_journey = false
    # @entry_station = nil
    @exit_station = exit_station
    @journey_list[:exit_station] = exit_station
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
