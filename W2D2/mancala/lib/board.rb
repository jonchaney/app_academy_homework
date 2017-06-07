require_relative "player"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    @cups.each_with_index do |_, idx|
      next if idx == 6 || idx == 13
      @cups[idx] += [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
      raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
      raise "Invalid starting cup" if @cups[start_pos].empty?
    end

  def make_move(start_pos, current_player_name)

    stones_to_move = []
    stones_to_move += @cups[start_pos]
    end_pos = 0
    idx = start_pos + 1

    until stones_to_move.empty?

      if idx == 6
        @cups[idx % @cups.length] << stones_to_move.pop if current_player_name == @name1
        end_pos = idx % @cups.length
      elsif idx == 13
        @cups[idx % @cups.length] << stones_to_move.pop if current_player_name == @name2
        end_pos = idx % @cups.length
      else
        @cups[idx % @cups.length] << stones_to_move.pop
        end_pos = idx % @cups.length
      end
      
    end

    @cups[start_pos] = []

    render

    return next_turn(end_pos)
  end

  def next_turn(ending_cup_idx)
    if @cups[ending_cup_idx % @cups.length].empty?
      return :switch
    elsif @cups[ending_cup_idx % @cups.length].length >= 1
      return ending_cup_idx
    else
      return :prompt
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
