class Oystercard

  attr_reader :balance

  DEFAULT_BALANCE = 0.00
  MAXIMUM_BALANCE = 90.00

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    max_balance_error = "Cannot top up past maximum value of £90"
    raise max_balance_error if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end
end
