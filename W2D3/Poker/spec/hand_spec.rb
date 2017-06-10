require 'hand'

describe "hand" do
  subject(:test_hand) { Hand.new([card1, card2, card3, card4, card5]) }
  let(:card1) { double("card1") }
  let(:card2) { double("card2") }
  let(:card3) { double("card3") }
  let(:card4) { double("card4") }
  let(:card5) { double("card5") }

  let(:test_hand2) { Hand.new([card6, card7, card8, card9, card10]) }
  let(:card6) { double("card6") }
  let(:card7) { double("card7") }
  let(:card8) { double("card8") }
  let(:card9) { double("card9") }
  let(:card10) { double("card10") }

  describe "type" do

    it "spots a pair" do
      allow(card1).to receive(:value).and_return(5)
      allow(card2).to receive(:value).and_return(5)
      allow(card3).to receive(:value).and_return(7)
      allow(card4).to receive(:value).and_return(6)
      allow(card5).to receive(:value).and_return(8)
      allow(card1).to receive(:suite).and_return(:d)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      expect(test_hand.type).to eq("one pair")
      expect(test_hand.value).to eq(5)
    end

    it "spots four of a kind" do
      allow(card1).to receive(:value).and_return(5)
      allow(card2).to receive(:value).and_return(5)
      allow(card3).to receive(:value).and_return(5)
      allow(card4).to receive(:value).and_return(5)
      allow(card5).to receive(:value).and_return(8)
      allow(card1).to receive(:suite).and_return(:d)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      expect(test_hand.type).to eq("four of a kind")
      expect(test_hand.value).to eq(5)
    end

    it "spots a straight" do
      allow(card1).to receive(:value).and_return(2)
      allow(card2).to receive(:value).and_return(3)
      allow(card3).to receive(:value).and_return(4)
      allow(card4).to receive(:value).and_return(5)
      allow(card5).to receive(:value).and_return(6)
      allow(card1).to receive(:suite).and_return(:d)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      expect(test_hand.type).to eq("straight")
      expect(test_hand.value).to eq(6)
    end

    it "spots a straight flush" do
      allow(card1).to receive(:value).and_return(2)
      allow(card2).to receive(:value).and_return(3)
      allow(card3).to receive(:value).and_return(4)
      allow(card4).to receive(:value).and_return(5)
      allow(card5).to receive(:value).and_return(6)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      expect(test_hand.type).to eq("straight flush")
      expect(test_hand.value).to eq(6)
    end

    it "spots a two pair" do
      allow(card1).to receive(:value).and_return(3)
      allow(card2).to receive(:value).and_return(3)
      allow(card3).to receive(:value).and_return(4)
      allow(card4).to receive(:value).and_return(4)
      allow(card5).to receive(:value).and_return(6)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:d)

      expect(test_hand.type).to eq("two pair")
      expect(test_hand.value).to eq(4)
    end

    it "spots a two pair with ace high" do
      allow(card1).to receive(:value).and_return(1)
      allow(card2).to receive(:value).and_return(1)
      allow(card3).to receive(:value).and_return(4)
      allow(card4).to receive(:value).and_return(4)
      allow(card5).to receive(:value).and_return(6)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:d)

      expect(test_hand.type).to eq("two pair")
      expect(test_hand.value).to eq(14)
    end

    it "spots three of a kind" do
      allow(card1).to receive(:value).and_return(2)
      allow(card2).to receive(:value).and_return(4)
      allow(card3).to receive(:value).and_return(4)
      allow(card4).to receive(:value).and_return(4)
      allow(card5).to receive(:value).and_return(6)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:d)

      expect(test_hand.type).to eq("three of a kind")
      expect(test_hand.value).to eq(4)
    end

    it "spots a full house" do
      allow(card1).to receive(:value).and_return(2)
      allow(card2).to receive(:value).and_return(4)
      allow(card3).to receive(:value).and_return(4)
      allow(card4).to receive(:value).and_return(4)
      allow(card5).to receive(:value).and_return(2)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:d)

      expect(test_hand.type).to eq("full house")
      expect(test_hand.value).to eq(4)
    end

    it "spots a full house with ace high" do
      allow(card1).to receive(:value).and_return(2)
      allow(card2).to receive(:value).and_return(1)
      allow(card3).to receive(:value).and_return(1)
      allow(card4).to receive(:value).and_return(1)
      allow(card5).to receive(:value).and_return(2)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:d)

      expect(test_hand.type).to eq("full house")
      expect(test_hand.value).to eq(14)
    end

    it "spots a royal flush" do
      allow(card1).to receive(:value).and_return(1)
      allow(card2).to receive(:value).and_return(10)
      allow(card3).to receive(:value).and_return(11)
      allow(card4).to receive(:value).and_return(12)
      allow(card5).to receive(:value).and_return(13)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      expect(test_hand.type).to eq("royal flush")
      expect(test_hand.value).to eq(1)
    end

    it "spots a royal straight" do
      allow(card1).to receive(:value).and_return(1)
      allow(card2).to receive(:value).and_return(10)
      allow(card3).to receive(:value).and_return(11)
      allow(card4).to receive(:value).and_return(12)
      allow(card5).to receive(:value).and_return(13)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:d)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      expect(test_hand.type).to eq("royal straight")
      expect(test_hand.value).to eq(1)
    end

    it "spots a single" do
      allow(card1).to receive(:value).and_return(2)
      allow(card2).to receive(:value).and_return(10)
      allow(card3).to receive(:value).and_return(11)
      allow(card4).to receive(:value).and_return(12)
      allow(card5).to receive(:value).and_return(8)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:d)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      expect(test_hand.type).to eq("single")
      expect(test_hand.value).to eq(12)
    end

    it "spots an ace high" do
      allow(card1).to receive(:value).and_return(1)
      allow(card2).to receive(:value).and_return(10)
      allow(card3).to receive(:value).and_return(11)
      allow(card4).to receive(:value).and_return(12)
      allow(card5).to receive(:value).and_return(8)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:d)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      expect(test_hand.type).to eq("ace high")
      expect(test_hand.value).to eq(14)
    end
  end

  describe "compare hands" do

    it "royal flush better than three of a kind" do
      allow(card1).to receive(:value).and_return(10)
      allow(card2).to receive(:value).and_return(11)
      allow(card3).to receive(:value).and_return(12)
      allow(card4).to receive(:value).and_return(13)
      allow(card5).to receive(:value).and_return(1)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      allow(card6).to receive(:value).and_return(1)
      allow(card7).to receive(:value).and_return(11)
      allow(card8).to receive(:value).and_return(11)
      allow(card9).to receive(:value).and_return(11)
      allow(card10).to receive(:value).and_return(8)
      allow(card6).to receive(:suite).and_return(:c)
      allow(card7).to receive(:suite).and_return(:d)
      allow(card8).to receive(:suite).and_return(:c)
      allow(card9).to receive(:suite).and_return(:c)
      allow(card10).to receive(:suite).and_return(:c)

      expect(test_hand <=> test_hand2).to eq(1)
    end

    it "pair of aces better than pair of kings" do
      allow(card1).to receive(:value).and_return(11)
      allow(card2).to receive(:value).and_return(1)
      allow(card3).to receive(:value).and_return(12)
      allow(card4).to receive(:value).and_return(13)
      allow(card5).to receive(:value).and_return(1)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:d)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      allow(card6).to receive(:value).and_return(1)
      allow(card7).to receive(:value).and_return(13)
      allow(card8).to receive(:value).and_return(13)
      allow(card9).to receive(:value).and_return(11)
      allow(card10).to receive(:value).and_return(8)
      allow(card6).to receive(:suite).and_return(:c)
      allow(card7).to receive(:suite).and_return(:d)
      allow(card8).to receive(:suite).and_return(:c)
      allow(card9).to receive(:suite).and_return(:c)
      allow(card10).to receive(:suite).and_return(:c)

      expect(test_hand <=> test_hand2).to eq(1)
    end

    it "high card flush better than low card flush" do
      allow(card1).to receive(:value).and_return(11)
      allow(card2).to receive(:value).and_return(1)
      allow(card3).to receive(:value).and_return(12)
      allow(card4).to receive(:value).and_return(10)
      allow(card5).to receive(:value).and_return(2)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      allow(card6).to receive(:value).and_return(1)
      allow(card7).to receive(:value).and_return(13)
      allow(card8).to receive(:value).and_return(12)
      allow(card9).to receive(:value).and_return(11)
      allow(card10).to receive(:value).and_return(8)
      allow(card6).to receive(:suite).and_return(:s)
      allow(card7).to receive(:suite).and_return(:s)
      allow(card8).to receive(:suite).and_return(:s)
      allow(card9).to receive(:suite).and_return(:s)
      allow(card10).to receive(:suite).and_return(:s)

      expect(test_hand <=> test_hand2).to eq(-1)
    end

    it "flush better than single" do
      allow(card1).to receive(:value).and_return(11)
      allow(card2).to receive(:value).and_return(1)
      allow(card3).to receive(:value).and_return(12)
      allow(card4).to receive(:value).and_return(10)
      allow(card5).to receive(:value).and_return(2)
      allow(card1).to receive(:suite).and_return(:c)
      allow(card2).to receive(:suite).and_return(:c)
      allow(card3).to receive(:suite).and_return(:c)
      allow(card4).to receive(:suite).and_return(:c)
      allow(card5).to receive(:suite).and_return(:c)

      allow(card6).to receive(:value).and_return(1)
      allow(card7).to receive(:value).and_return(13)
      allow(card8).to receive(:value).and_return(12)
      allow(card9).to receive(:value).and_return(11)
      allow(card10).to receive(:value).and_return(8)
      allow(card6).to receive(:suite).and_return(:s)
      allow(card7).to receive(:suite).and_return(:d)
      allow(card8).to receive(:suite).and_return(:s)
      allow(card9).to receive(:suite).and_return(:s)
      allow(card10).to receive(:suite).and_return(:s)

      expect(test_hand <=> test_hand2).to eq(1)
    end

  end

end
