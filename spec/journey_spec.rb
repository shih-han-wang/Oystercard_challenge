require 'journey'

describe Journey do

  let(:station){double :station}
  subject{ described_class.new }

  it 'Initially should not compelete the journey' do
    expect(subject).not_to be_compelete
  end

  describe '#start' do

    it 'Should push station as a value into entry station' do
      subject.start(station)
      expect(subject.journey).to have_value(station)
    end

  end

  describe '#finish' do

    it 'Should push station as a value into exit station' do
      subject.finish(station)
      expect(subject.journey).to have_value(station)
    end

  end

  describe '#compelete?' do

    it 'Should not be compelete when either entry station or exit station missing' do
      expect(subject).not_to be_compelete
      subject.start(station)
      expect(subject).not_to be_compelete
    end

    it 'Should be compelete when there are both entry and exit station' do
      subject.start(station)
      subject.finish(station)
      expect(subject).to be_compelete
    end

  end

  describe '#fare' do

    it 'Should return penalty fare when the journey is not compeleted' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
      subject.start(station)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'Should return minimum fare when the journey is not compeleted' do
      subject.start(station)
      subject.finish(station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

  end


end
