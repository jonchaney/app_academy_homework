# assign(key, value), lookup(key), remove(key)
class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    if self.lookup(key) == nil
      @map << [key, value]
    else
      @map.each do |key_val|
        if key == key_val[0]
          key_val[1] = value
        end
      end
    end
  end

  def lookup(key)
    @map.each do |key_val|
      if key == key_val[0]
        return key_val[1]
      end
    end
    nil
  end

  def remove(key)
    unless self.lookup(key) == nil
      @map.each_with_index do |key_val, idx|
        if key == key_val[0]
          @map.delete_at(idx)
          break
        end
      end
    end
  end

end


map = Map.new
map.assign("jon", true)
map.assign("jeff", true)
p "nil"
p map.lookup("bill")
map.assign("jon", true)
map.assign("jeff", true)
p "true"
p map.lookup("jon")
p map.remove("jon")
p "nil"
p map.lookup("jon")
