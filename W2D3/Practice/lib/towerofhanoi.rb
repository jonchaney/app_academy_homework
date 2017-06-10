class TowerOfHanoi
  attr_accessor :towers

  def initialize
    @towers = [[3,2,1], [nil,nil,nil], [nil,nil,nil]]
  end

  def move(from_tower,to_tower)
    towers[to_tower].each_with_index do |disk,indx|
      if disk == nil
        towers[to_tower][indx] = towers[from_tower].pop
        towers[from_tower] << nil
        return
      end
    end
  end

  def won?
    if towers[2] == [3,2,1] || towers[1] == [3,2,1]
      return true
    end
    false
  end

  def valid_move?(from_tower,to_tower)
    return false if towers[from_tower].first.nil?
    return true if towers[to_tower].first.nil?
    from = 0
    to = 0
    towers[from_tower].each_with_index do |disk,indx|
      if disk.nil?
        from = towers[from_tower][indx-1]
        break
      end
    end
    towers[to_tower].reverse.each_with_index do |disk,indx|
      unless disk.nil?
        to = disk
        break
      end
    end
    return false if from > to
    true
  end

end
