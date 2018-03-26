require 'oystercard'

describe Oystercard do
  subject(:a_oystercard) { described_class.new }

    it 'Should create an instance (passed no arguments) with a default balance of 0' do
      expect(a_oystercard.balance).to eq 0.00
    end

    describe '#top-up' do
      it 'Should allow the user to top up the value on the oyster card by £5' do
        a_oystercard.top_up(5.00)
        expect(a_oystercard.balance).to eq 5.00
      end
    end

  subject(:b_oystercard) { described_class.new(5.00) }

    it 'Should create an instance (passed starting balance of 5.00) with 5.00 balance' do
      expect(b_oystercard.balance).to eq 5.00
    end

end
