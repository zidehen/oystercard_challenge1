class Journey
attr_accessor :journey_list, :entry_station
  def initialize
    @journey_list = []
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end
end