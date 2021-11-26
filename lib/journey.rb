class Journey
attr_reader :journey_list 
  def initialize(entry_station)
    @journey_list = []
    @entry_station = entry_station
  end
end