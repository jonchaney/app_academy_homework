require_relative "card"

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    populate_deck
  end

  private

  def populate_deck
    suites = [:c, :d, :h, :s]
    suites.each do |suite|
      (1..13).each do |num|
        @cards << Card.new(suite, num)
      end
    end
  end
end
