class Hand
  attr_accessor :type, :value, :suite, :card_info

  def initialize((card1, card2, card3, card4, card5))

    hand = [card1, card2, card3, card4, card5]

    @card_info = hand.map do |card|
      [card.suite, card.value]
    end

    calculate_value
  end

  def calculate_value

    card_values = []
    card_suites = []

    @card_info.each do |card|
      card_values << card.last
      card_suites << card.first
    end

    card_values = card_values.sort
    card_suites = card_suites.sort

    if card_values.include?(1)
      @type = "ace high"
      @value = 14
    else
      @type = "single"
      @value = card_values[-1]
    end

    # finds pair
    if card_values.length == card_values.uniq.length + 1
      card_values.each_with_index do |card, idx|
        @value = card if card_values[0...idx].include?(card)
      end
      @type = "one pair"
      if @value == 1
        @value = 14
      end
    end

    #full house and four of a kinds
    if card_values.length == card_values.uniq.length + 3
      card_values.each_with_index do |card, idx|
        @value = card if card_values[0...idx].include?(card)
      end
      @type = "four of a kind"
      unless card_values[2] == card_values[1] && card_values[2] == card_values[3]
        @type = "full house"
        if card_values[2] == card_values[1]
          @value = card_values[2]
        else
          @value = card_values[4]
        end
        if card_values[0] == 1
          @value = 14
        end
      end
    end

    #flush
    if flush?(card_suites)
      @type = "flush"
      @value = card_values[-1]
    end

    #straight and straight flush
    if (0..3).all? { |num| card_values[num] == card_values[num+1]-1 }
      if flush?(card_suites)
        @type = "straight flush"
      else
        @type = "straight"
      end
      @value = card_values[-1]
    end

    #two pairs and three of a kind
    if card_values.length == card_values.uniq.length + 2
      #three of a kind
      unless three_of_a_kind?(card_values)
        @type = "two pair"
        if card_values[-1] == card_values[-2]
          @value = card_values[-1]
        else
          @value = card_values[-2]
        end
        if card_values[0] == 1
          @value = 14
        end
      end
    end

    #royal flush and royal straight
    if card_values == [1,10,11,12,13]
      if flush?(card_suites)
        @type = "royal flush"
      else
        @type = "royal straight"
      end
      @value = 1
    end
  end

  def <=>(other_hand)
    hand_order = ["royal flush", "straight flush", "four of a kind",
                  "full house", "flush", "royal straight",
                  "straight", "three of a kind", "two pair", "one pair",
                  "ace high", "single"]

    hand_order1 = hand_order.find_index(self.type)
    hand_order2 = hand_order.find_index(other_hand.type)

    case hand_order1 <=> hand_order2
    when -1
      return 1
    when 1
      return -1
    when 0
      return self.value <=> other_hand.value
    end
  end

  private

  def flush?(card_suites)
    card_suites.uniq.length == 1
  end

  def three_of_a_kind?(card_values)
    (0..2).each do |num|
      if card_values[num] == card_values[num+1] && card_values[num] == card_values[num+2]
        @type = "three of a kind"
        @value = card_values[num]
      end
    end
    if @value == 1
      @value = 14
    end
    @type == "three of a kind"
  end

end
