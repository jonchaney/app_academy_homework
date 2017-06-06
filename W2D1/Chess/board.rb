require_relative "piece"
require_relative "display"

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
    raise "No Piece" if self[start_pos] == nil
    raise "Unable to move to unvacated spot" if self[end_pos] != nil
  end

  protected

  def make_starting_grid
    @grid.each_with_index do |row, idx|
      next if idx >= 2 && idx < 6
      row.map! { |_| Piece.new }
    end
  end

end

grid = Board.new
# cursor = Cursor.new([0,0], grid)
display = Display.new(grid)
display.render
display.cursor.get_input
p display.cursor.cursor_pos
display.render
p display.cursor.cursor_pos
