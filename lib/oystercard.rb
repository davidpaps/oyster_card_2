require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :journey, :journey_log, :in_journey

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE = 2
  PENALTY_FARE = 6

  def initialize(balance = 0, journey_log = JourneyLog.new(Journey))
    @balance = balance
    @journey_log = journey_log
    @in_journey = false
  end

  def top_up(value)
    fail "Error: Maximum limit of #{MAX_LIMIT} reached" if exceeds_max?(value)
    @balance += value
  end

  def touch_in(station)
    deduct(PENALTY_FARE) if @in_journey == true
   min_amount? ? (fail "Not enough credit") : @journey_log.start(station) && @in_journey = true
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(fare) 
    @in_journey = false

  end

  

  private

  def exceeds_max?(value)
    @balance + value >= MAX_LIMIT
  end

  def min_amount?
    @balance <= MIN_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

  def fare
    @in_journey == true ? MIN_FARE : PENALTY_FARE
  end

end
