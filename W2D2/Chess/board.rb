require_relative "piece"
require_relative "display"
require_relative "queen"

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8) { nil } }
    make_starting_grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    raise "No Piece" if self[start_pos].nil?
    raise "Unable to move to unvacated spot" unless self[end_pos].nil?
    raise "Position not on board" unless end_pos.all? {|n| n.between?(0,7)}
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  protected

  def make_starting_grid
    @grid.each_with_index do |row, idx|
      next if idx >= 2 && idx < 6
      row.map! { |_| Queen.new(self) }
    end
  end

end

grid = Board.new
# queen = Queen.new(grid)
# p queen.valid_moves([0,0])
display = Display.new(grid)
display.render
