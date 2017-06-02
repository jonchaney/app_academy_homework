require 'byebug'

# tabled for later; perhaps there is a solution without uniq
# def range(start, final)
#   return [] if final < start
#   return [start] if final == start
#   [start] + range(start+1,final-1) + [final]
# end
#
# p range(0,2)

# def range_iterative(start, final)
#   range = []
#   (start..final).each do |i|
#     range << i
#   end
#   range
# end
#
# p range_iterative(4, 20)

# def exponent1(base, exp)
#   return 1 if exp == 0
#   base * exponent1(base, exp - 1)
# end
#
# p exponent1(3, 3)

# def exponent2(base, exp)
#   return 1 if exp == 0
#   return base if exp == 1
#   if exp.even?
#     exponent2(base, (exp / 2)) ** 2
#   else
#     base * exponent2(base, ((exp - 1) / 2)) ** 2
#   end
# end
#
# p exponent2(2, 256)
# exp = 4
#  3 * 3 * 3 * 3
#
# exp = 2
#  (3^2) * (3^2)

def deep_dup(arr)
  copy = arr.dup
  copy.each_with_index do |el, i|
    copy[i] = deep_dup(el) if el.is_a?(Array)
  end
end
#
# robot_parts = [1, [2], [3, [4]]]
# robot_parts_copy = deep_dup(robot_parts)
#
# # shouldn't modify robot_parts
# robot_parts_copy[2][1] << "LEDs"
# # but it does
# p robot_parts # => ["capacitors", "resistors", "inductors", "LEDs"]
# p robot_parts_copy

# def fibonacci_iterative(n)
#   return [] if n < 1
#   return [1] if n == 1
#   arr = [1, 1]
#   (n - 2).times do
#     arr << arr[-2..-1].reduce(:+)
#   end
#   arr
# end

# p fibonacci_iterative(500)

# def fibonacci_recursive(n)
#   return [] if n < 1
#   return [1] if n == 1
#   return [1, 1] if n == 2
#   fib_arr = fibonacci_recursive(n-1)
#   fib_arr << fib_arr[-2..-1].reduce(:+)
# end
#
# p fibonacci_recursive(50)

# def subsets(arr)
#   return [arr] if arr.empty?
#   old_subsets = subsets(arr.take(arr.length-1))
#   old_subsets + old_subsets.map {|set| set + [arr.last]}
#   # [arr, arr + subsets(arr[0...-1])]
# end

# def subset_iteration(arr)
#   final_arr = [[]]
#   arr.each do |el|
#     copy = deep_dup(final_arr)
#     copy.each do |el2|
#       final_arr << (el2 << el)
#     end
#   end
#   final_arr
# end

# p subsets([1,2,3])
def ==
def binary_search(array, target)
  middle = array.length / 2
  return nil if array.empty?
  return middle if array[middle] == target
  if array[middle] > target
    binary_search(array[0...middle], target)
  else
    upper_half = binary_search(array[(middle + 1)..-1], target)
    upper_half ? (middle + 1) + upper_half : nil
  end
end
#
# arr = [4,1,2,3,5,6,7,8,9]
#
# p binary_search(arr,1)
# p binary_search(arr,4)
# p binary_search(arr,-1)
# p binary_search(arr,12)
