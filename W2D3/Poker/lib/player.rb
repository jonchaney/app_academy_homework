class Player
  attr_accessor :name, :pot, :hand, :deck
  def initialize(name, pot, deck)
    @name = name
    @pot = pot
    @hand = []
    @deck = deck
  end

  def draw
    @deck.shuffle!
    @hand = @deck.take(5)
    @hand
  end

  def fold
    @hand = []
  end

  def update_deck(deck)
    @deck = deck
  end

  def bet(bet)
    if bet < pot
      pot -= bet
    else
      raise "bet is too big"
    end
  end

end
