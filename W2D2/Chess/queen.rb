require_relative "slidingpiece"

class Queen < Piece
  include SlidingPiece

  def initialize(board)
    @board = board
    super
  end

  def move_dirs(start_pos)
    moves(start_pos)
  end
end
