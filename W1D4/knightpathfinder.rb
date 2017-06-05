require 'byebug'
class KnightPathFinder

  def initialize(position = [0, 0])
    @pos = position
    @tree = build_move_tree
    @visited_positions = [position]
  end

  def self.valid_moves(pos)
    x, y = pos
    possible_moves = [ [1, 2], [2, 1], [2, -1], [1, -2],
                       [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

    actual_moves = possible_moves.select do |move|
      (x + move[0]).between?(0, 7) && (y + move[1]).between?(0, 7)
    end

    actual_moves

  end

  def new_move_positions(pos)
    debugger
    if @visited_positions.include?(pos)
      positions = KnightPathFinder.valid_moves(pos)
      unvisited_positions = positions.reject do |move|
        @visited_positions.include?(move)
      end
      @visited_positions += unvisited_positions
    end
    unvisited_positions
  end

  def build_move_tree
  end

  def find_path
  end
end
if $PROGRAM_NAME == __FILE__
  kpf = KnightPathFinder.new
  p kpf.new_move_positions([0,0])
end
