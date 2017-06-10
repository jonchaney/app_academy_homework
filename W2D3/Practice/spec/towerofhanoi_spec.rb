require 'towerofhanoi.rb'

describe "towers of hanoi" do
  subject(:test_tower) { TowerOfHanoi.new }

  describe "initialize" do

    it 'has three sub-arrays' do
      expect(test_tower.towers).to eq([ [3,2,1], [nil,nil,nil], [nil,nil,nil]])
    end
  end

  describe "move" do
    it "moves a tower" do
      test_tower.move(0,1)
      expect(test_tower.towers).to eq([ [3,2,nil], [1,nil,nil], [nil,nil,nil]])
    end
  end

  describe "won" do
    it "returns true if won" do
      test_tower.towers = [ [nil,nil,nil], [3,2,1], [nil,nil,nil]]
      expect(test_tower.won?).to eq(true)
    end
  end

  describe "valid move" do
    it "returns true if moving to empty tower" do
      expect(test_tower.valid_move?(0,1)).to eq(true)
    end

    it "returns true if putting small on big" do
      test_tower.towers = [ [1,nil,nil], [3,2,nil], [nil,nil,nil]]
      expect(test_tower.valid_move?(0,1)).to eq(true)
    end

    it "returns false if moving from empty" do
      expect(test_tower.valid_move?(1,0)).to eq(false)
    end

    it "returns false if putting big on small" do
      test_tower.towers = [ [1,nil,nil], [3,2,nil], [nil,nil,nil]]
      expect(test_tower.valid_move?(1,0)).to eq(false)
    end
  end
end
