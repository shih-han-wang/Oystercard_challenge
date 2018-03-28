class Oystercard
  attr_reader :balance, :entry_station

  DEFAULT_BALANCE = 0.00
  MAXIMUM_BALANCE = 90.00
  MINIMUM_AMOUNT = 1.00
  CHARGE = 2.40

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    max_balance_error = 'Cannot top up past maximum value of £90'
    raise max_balance_error if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    minimum_amount_error = 'The minimum amount for a single journey is £1'
    raise minimum_amount_error if less_minimum?
    @entry_station = station
  end

  def touch_out
    deduct(CHARGE)
    @entry_station = nil
  end

  def in_journey?
    @entry_station
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def less_minimum?
    @balance < MINIMUM_AMOUNT
  end

end
