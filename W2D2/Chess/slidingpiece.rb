require 'byebug'

module SlidingPiece
  DIAGONAL = [
    [-1,-1],
    [-1, 1],
    [1, 1],
    [1, -1]
  ]
  HORIZONTAL = [
    [0, 1],
    [0, -1],
    [-1, 0],
    [1, 0]
  ]

  def moves(start_pos)
    if self.class == Queen
      return horizonal(start_pos) + diagonal(start_pos)
    elsif self.class == Bishop
      return diagonal(start_pos)
    elsif self.class == Rook
      return horizonal(start_pos)
    end
  end

  private

  def horizonal(start_pos)
    start_dup = start_pos
    valid_moves = []
    valid_directions = []

    HORIZONTAL.each do |add|
      start_dup = start_pos
      while start_dup.all? { |n| n.between?(0, 7) }
        row1, col1 = start_dup
        row2, col2 = add
        tmp_pos = [row1 + row2, col1 + col2]
        if tmp_pos.all? { |n| n.between?(0, 7) }
          valid_moves << tmp_pos
          start_dup = tmp_pos
        else
          valid_directions << valid_moves
          valid_moves = []
          break
        end
      end
    end
    valid_directions
  end

  def diagonal(start_pos)
    start_dup = start_pos
    valid_moves = []
    valid_directions = []

    DIAGONAL.each do |add|
      start_dup = start_pos
      while start_dup.all? { |n| n.between?(0, 7) }
        row1, col1 = start_dup
        row2, col2 = add
        tmp_pos = [row1 + row2, col1 + col2]
        if tmp_pos.all? { |n| n.between?(0, 7) }
          valid_moves << tmp_pos
          start_dup = tmp_pos
        else
          valid_directions << valid_moves
          valid_moves = []
          break
        end
      end
    end
    valid_directions
  end
  
end
