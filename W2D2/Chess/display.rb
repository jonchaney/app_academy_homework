require 'colorize'
require_relative "cursor"

class Display
  attr_reader :cursor
  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    puts "  #{(0..7).to_a.join(" ")}"
    @board.grid.each_with_index do |row, idx|
      print "#{idx} "
      row.each_with_index do |piece, idx2|
        if [idx,idx2] == @cursor.cursor_pos
          print "#{piece} ".red
        end
        print "#{piece} "
      end
      puts "\n"
    end
  end
end
