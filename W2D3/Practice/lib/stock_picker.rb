class Array
  def stock_picker
    result = [0,1]
    max = self[1]-self[0]
    self.each_with_index do |el1,idx1|
      self.each_with_index do |el2,idx2|
        next if idx2<=idx1
        if max < (el2-el1)
          max = el2-el1
          result = [idx1,idx2]
        end
      end
    end
    result
  end
end
