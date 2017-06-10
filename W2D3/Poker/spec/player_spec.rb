require 'player'

describe "player" do
  subject(:player){Player.new("Bob",100, [1,2,3,4,5,6,5,4,3,4])}

  describe "initalize" do
    it "initializes the name" do
      expect(player.name).to eq("Bob")
    end
    it "initializes the pot" do
      expect(player.pot).to eq(100)
    end
    it "initializes an empty hand" do
      expect(player.hand).to eq([])
    end
    it "initializes the deck" do
      expect(player.deck).to eq ([1,2,3,4,5,6,5,4,3,4])
    end
  end

  describe "draw" do
    it "draws 5 cards" do
      expect(player.draw.length). to eq(5)
    end

  end

  describe "fold" do
    it "folds when player wants to fold" do
      player.draw
      player.fold
      expect(player.hand.length).to eq(0)
    end
  end

  describe "bet" do
    it "raises an error if bet is larger than pot" do
      expect { player.bet(101) }.to raise_error("bet is too big")
    end
  end

  describe "deck" do
    it "updates the deck" do
      player.update_deck([1,2,3])
      expect(player.deck).to eq([1,2,3])
    end

  end

end
