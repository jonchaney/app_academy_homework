# require 'colorize'

class Tile
  attr_reader :value

  def initialize(value)
    @value = value
    @given = true
  end

  def to_s
    @value.to_s
  end

end
