class Journey
attr_accessor :journey_list, :entry_station, :exit_station, :in_journey
  def initialize
    @journey_list = []
    @entry_station = nil
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
  end

#   def in_journey?
#     !!entry_station
#   end
end