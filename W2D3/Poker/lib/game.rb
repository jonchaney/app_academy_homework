require_relative "deck"
require_relative "player"

class Game
  attr_accessor :deck, :pot, :players

  def initialize(player1, player2)
    @deck = Deck.new
    @pot = 0
    @players = [player1, player2]
  end

  def play_game
    # hand1 = players.first.draw(deck)
    # hand2 = players.last.draw(deck)
    #
    # p hand1.card_info
    # p hand2.card_info
    #
    # case hand1 <=> hand2
    # when -1
    #   puts "#{players.last.name} has won with #{hand2.type}!"
    #   puts "#{players.first.name} has lost with #{hand1.type}!"
    #   players.first.pot -= 5
    #   players.last.pot += 5
    # when 1
    #   puts "#{players.first.name} has won with #{hand1.type}!"
    #   puts "#{players.last.name} has lost with #{hand2.type}!"
    #   players.last.pot -= 5
    #   players.first.pot += 5
    # else
    #   puts "it's a tie!"
    # end
    #
    # puts "#{players.first.name} has #{players.first.pot}"
    # puts "#{players.last.name} has #{players.last.pot}"

  end

end

# player1 = Player.new("jon", 100)
# player2 = Player.new("li hsuan", 100)
#
# user_desire = "y"
#
# while user_desire == "y"
#   game = Game.new(player1, player2)
#   game.play_game
#   puts "Do you want to continue?"
#   user_desire = gets.chomp
# end
