class Card
  attr_reader :face_value

  def initialize(face_value)
    @face_value = face_value
    @face_down = true
  end

  def hide
    @face_down = true
  end

  def reveal
    @face_down = false
  end

  def ==(card)
    @face_value == card.face_value
  end

  def display
    if @facedown == true
      puts " "
    else
      puts @face_value
    end
  end

end
# A Card has two useful bits of information: its face value, and whether
# it is face-up or face-down. You'll want instance variables to keep
# track of this information. You'll also want a method to display
# information about the card: nothing when face-down, or its value
# when face-up. I also wrote:

#hide, #reveal, #to_s, and #== methods, face_down?
