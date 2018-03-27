class Oystercard

  attr_reader :balance

  DEFAULT_BALANCE = 0.00
  MAXIMUM_BALANCE = 90.00
  MINIMUM_AMOUNT = 1.00

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    max_balance_error = "Cannot top up past maximum value of £90"
    raise max_balance_error if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    minimum_amount_error = "The minimum amount for a single journey is £1"
    raise minimum_amount_error if @balance < MINIMUM_AMOUNT
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
