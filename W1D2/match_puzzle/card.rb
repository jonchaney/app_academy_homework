class Card

  attr_accessor :face_value, :face_down

  def initialize(face_value)
    @face_value = face_value
    @face_down = true
  end

  def display
    if @face_down
      "@"
    else
      @face_value
    end
  end

  def ==(other_card)
    @face_value == other_card.face_value
  end

  def to_s
    @face_value.to_s
  end

  def hide
    @face_down = true
  end

  def reveal
    @face_down = false
  end

end
