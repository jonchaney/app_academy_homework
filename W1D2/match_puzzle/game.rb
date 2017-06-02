require_relative 'board.rb'
require_relative 'card.rb'


class Game
  attr_accessor :board

  def initialize(board)
    board.populate
    @board = board
    @previous_guess = nil
  end

  def play
    puts "Welcome to The Matching Game!"
    @board.render
    until board.won?
      array = []

      2.times do

        puts "Please enter a number between 1 and #{@board.grid.length}"
        row = gets.chomp.to_i-1
        puts "Please enter a number between 1 and 4"
        column = gets.chomp.to_i-1

        pos = [row, column]

        if valid_guess?(pos)
          array << pos
          @previous_guess = pos
          @board.reveal(pos)
          @board.render
        else
          puts "Guess again"
          @board[pos].hide
          break
        end

      end

      if array.length == 2
        make_guess(array[0], array[1])
      end
    end
    puts "game over"
  end

  def valid_guess?(guess)
    @board[guess].face_down
  end

  def make_guess(guessed_pos1, guessed_pos2)
    card1 = @board[guessed_pos1]
    card2 = @board[guessed_pos2]

    unless card1 == card2
      card1.hide
      card2.hide
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new(4)
  game = Game.new(board)
  game.play
end
