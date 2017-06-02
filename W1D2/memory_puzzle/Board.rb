require_relative 'Card'

# The Board is responsible for keeping track of all your Cards.
# You'll want a grid instance variable to contain Cards. Useful methods:

#populate should fill the board with a set of shuffled Card pairs

#render should print out a representation of the Board's current state

#won? should return true if all cards have been revealed.

#reveal should reveal a Card at guessed_pos (unless it's already
# face-up, in which case the method should do nothing). It should also
# return the value of the card it revealed (you'll see why later).

class Board
  attr_accessor :grid

  def initialize
    @grid = populate
  end

  def populate
    cards = Array.new(4) { [Card.new(1),
                            Card.new(2),
                            Card.new(3),
                            Card.new(4) ]}
  end

end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  p board.grid
end
