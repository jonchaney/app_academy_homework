class Array
  def my_transpose
    result = []

    (0...length).each do |idx1|
      result_new = []
      (0...length).each do |idx2|
        result_new << self[idx2][idx1]
      end
      result << result_new
    end
    result
  end
end
