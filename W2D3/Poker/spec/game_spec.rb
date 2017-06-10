require 'game'

describe "game" do
  subject(:test_game) { Game.new(player1, player2) }
  let(:player1) { double("player1") }
  let(:player2) { double("player2") }

  describe "initialize" do
    it "holds the deck" do
      expect(test_game.deck).not_to eq([])
    end

    it "starts with an empty pot" do
      expect(test_game.pot).to eq(0)
    end

    it "takes two players" do
      expect(test_game.players.length).to eq(2)
    end
  end

  describe "play_game" do

    it "deals cards to players" do
      allow(player1).to receive(:draw).and_return([])
      allow(player2).to receive(:draw).and_return([])
      test_game.play_game
      expect(test_game)
    end

  end



end
