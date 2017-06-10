class Array
  def my_uniq
    ans = []
    self.each do |el|
      ans << el unless ans.include?(el)
    end
    ans
  end
end
