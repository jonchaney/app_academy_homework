require 'byebug'

def range(start, final)
  return [] if final < start
  return [start] if final == start
  [start] + range(start+1,final-1).uniq + [final]
end

# p range(0,2)

def range_iterative(start, final)
  range = []
  (start..final).each do |i|
    range << i
  end
  range
end

# p range_iterative(4, 20)

def exponent1(base, exp)
  return 1 if exp == 0
  base * exponent1(base, exp - 1)
end

# p exponent1(3, 3)

def exponent2(base, exp)
  return 1 if exp == 0
  return base if exp == 1
  if exp.even?
    exponent2(base, (exp / 2)) ** 2
  else
    base * exponent2(base, ((exp - 1) / 2)) ** 2
  end
end
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

# robot_parts = [1, [2], [3, [4]]]
# robot_parts_copy = deep_dup(robot_parts)

# shouldn't modify robot_parts
# robot_parts_copy[2][1] << "LEDs"
# # but it does
# p robot_parts # => ["capacitors", "resistors", "inductors", "LEDs"]
# p robot_parts_copy

def fibonacci_recursive(n)
  return [] if n < 1
  return [1] if n == 1
  return [1, 1] if n == 2
  fib_arr = fibonacci_recursive(n-1)
  fib_arr << fib_arr[-2..-1].reduce(:+)
end

# p fibonacci_recursive(5)

def subsets(arr)
  return [arr] if arr.empty?
  old_subsets = subsets(arr.take(arr.length-1))
  old_subsets + old_subsets.map {|set| set + [arr.last]}
end

# p subsets([1,2,3])

def binary_search(array, target)
  debugger
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

# arr = [1,2,3]
# p binary_search(arr,1)

# Similar to the subsets problem, we observe that to get the permutations
# of [1, 2, 3] we can look at the permutations of [1, 2] which are
# [1, 2] and [2, 1] and add the last element to every possible index getting
# [3, 1, 2], [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1], [2, 1, 3]
def permutations(array)
  debugger
  return [array] if array.length <= 1
  # pop off the last element
  first = array.shift
  # make the recursive call
  perms = permutations(array)
  # we will need an array to store all our different permutations
  total_permutations = []


  # Now we iterate over the result of our recusive call say [[1, 2], [2, 1]]
  # and for each permutation add first into every index. This new subarray
  # gets added to total_permutations.
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total_permutations
end

permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]
