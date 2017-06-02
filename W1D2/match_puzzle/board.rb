require_relative 'card.rb'

class Board
  attr_accessor :grid
  def initialize(size)
    @grid = Array.new(size) {[]}
  end

  def populate

    values = []

    (@grid.length*2).times do |n|
      values << n << n
    end

    values.shuffle!

    @grid.each do |arr|
      4.times do
        arr << Card.new(values.shift)
      end
    end

  end

  def render
    @grid.each do |arr|
      arr.each do |card|
        print card.display
      end
      print "\n"
    end
  end

  def won?
    @grid.each do |arr|
      return false if arr.any?(&:face_down)
    end
    true
  end

  def reveal(guessed_pos)
    row, col = guessed_pos

    @grid[row][col].reveal

    @grid[row][col].face_value
  end

  def [](pos)
    row, column = pos
    @grid[row][column]
  end

  def []=(pos, value)
    row, column = pos
    @grid[row][column] = value
  end


end
