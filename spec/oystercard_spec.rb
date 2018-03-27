require 'oystercard'

describe Oystercard do
  subject(:a_oystercard) { described_class.new }
  subject(:b_oystercard) { described_class.new(5.00) }

  it 'Should create an instance (passed no arguments) with a default balance of 0' do
    expect(a_oystercard.balance).to eq 0.00
  end

  it 'Should create an instance (passed starting balance of 5.00) with 5.00 balance' do
    expect(b_oystercard.balance).to eq 5.00
  end

  describe '#top-up' do

    it 'Should allow the user to top up the value on the oyster card by £5' do
      a_oystercard.top_up(5.00)
      expect(a_oystercard.balance).to eq 5.00
    end

    it 'Should not allow the user to top up the value past the maximum of £90' do
      a_oystercard.top_up(70)
      expect { a_oystercard.top_up(21) }.to raise_error "Cannot top up past maximum value of £90"
    end
  end

  describe '#deduct' do

    it 'Should deduct the fare from the balance' do
      a_oystercard.top_up(80)
      a_oystercard.deduct(2)
      expect(a_oystercard.balance).to eq 78
    end
  end

  describe '#touch_in' do

    it 'Should raise an error when user touch in with balance less than minimum amount' do
      expect{ a_oystercard.touch_in }.to raise_error "The minimum amount for a single journey is £1"
    end
  end

  describe '#in_journey?' do

    it 'Initially should not in journey' do
      expect(b_oystercard).not_to be_in_journey
    end

    it 'Should be in journey after touch in' do
      b_oystercard.touch_in
      expect(b_oystercard).to be_in_journey
    end

    it 'Should not be in journey after touch out' do
      b_oystercard.touch_in
      b_oystercard.touch_out
      expect(b_oystercard).not_to be_in_journey
    end
  end


end
