require 'card'

describe "card" do
  subject(:test_card) { Card.new(:c, 8) }

  it "assigns correct suite" do
    expect(test_card.suite).to eq(:c)
  end

  it "recieves suite" do
    expect(test_card).to receive(:suite)
    test_card.suite
  end

  it "assigns correct value" do
    expect(test_card.value).to eq(8)
  end

end
