require 'deck'

describe "deck" do
  subject(:deck) { Deck.new }
  let(:card) { double("card", suite: :c, value: 8) }

  it "populates a deck of cards" do
    expect(deck.cards.length).to eq(52)
  end

end
