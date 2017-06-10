class Array

  def two_sum
    result = []
    self.each_with_index do |el1,idx1|
      self.each_with_index do |el2,idx2|
        next if idx2<=idx1
        if el1+el2 == 0
          result << [idx1,idx2]
        end
      end
    end
    result
  end
end
