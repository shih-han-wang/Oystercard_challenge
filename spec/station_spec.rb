require 'station'

describe Station do

  subject{ described_class.new("name", "zone") }

  it { is_expected.to respond_to(:name, :zone)}
end
