require 'byebug'
class Piece

  def initialize(board)
    @board = board
  end

  def to_s()
  end

  def empty?()
  end

  def valid_moves(start_pos)
    possible_moves = move_dirs(start_pos)
    # debugger
    actual_moves = []
    possible_moves.each do |direction|
      direction.each do |pos|
        break if @board[pos].class == Queen
        actual_moves << pos
      end
    end
    actual_moves
  end

  private

  def moves_into_check(to_pos)
  end
end

class NullPiece < Piece
  def initialize
  end
end
