require_relative 'tile.rb'

class Board
  attr_reader :grid

  def initialize(grid= [])
    @grid = grid
  end

  def self.from_file
    array1 = []

    File.foreach("sudoku.txt") do |line|
      array2 = []
      line.chomp.each_char do |el|
        array2 << Tile.new(el.to_i)
      end
      array1 << array2
    end
    self.new(array1)
  end

  def render
    @grid.each do |row|
      row.each do |tile|
        print tile.value
      end
      print "\n"
    end
  end

  def update_tile_value(pos, value)
    []=(pos, value)
  end

  def [](pos)
    row, column = pos
    @grid[row][column]
  end

  def []=(pos, value)
    row, column = pos
    @grid[row][column] = value
  end

  def solved?

  end


  private

  def rows_solved?
    @grid.each do |row|
      return false if row.any?{|tile| tile.value == 0}
      return false unless row.map(&:value).uniq.length == 9
    end

    true
  end

  def columns_solved?
    @grid.transpose.each do |row|
      return false if row.any?{|tile| tile.value == 0}
      return false unless row.map(&:value).uniq.length == 9
    end

    true
  end

  def cubes_solved?
    array = []

    array += @grid[0..2]
    array += 

  end

end
