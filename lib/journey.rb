require 'station'

class Journey

  attr_reader :journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @journey = { entry_station: nil, exit_station: nil }
  end

  def start(station = Station.new)
    @journey[:entry_station] = station
  end

  def finish(station = Station.new)
    @journey [:exit_station] = station
  end

  def compelete?
    !@journey.has_value?(nil)
  end

  def fare
    return MINIMUM_FARE if compelete?
    return PENALTY_FARE if !compelete?
  end

  # private

  # def in_out?
  #   !@journey.has_value?(nil)
  # end

end
