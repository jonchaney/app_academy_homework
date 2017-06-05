require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &blk)
    unless blk == nil
      if accumulator.nil?
        accumulator = self.first
        self.each_with_index do |el, idx|
          next if idx == 0
          accumulator = blk.call(accumulator, el)
        end
      else
        self.each do |el|
          accumulator = blk.call(accumulator, el)
        end
      end
    end
    accumulator
  end

end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |n|
    if num % n == 0
      return false
    end
  end
  true
end

def primes(num)
  result = []
  i = 2
  until result.length == num
    if is_prime?(i)
      result << i
    end
    i+=1
  end
  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  if num == 1
    [1]
  else
    facs = factorials_rec(num-1)
    facs << facs.last * (num - 1)
    facs
  end
end

def factorial(n)
  return 1 if n == 0
  n * factorial(n-1)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    result = Hash.new([])
    duplicates = []
    self.each_with_index do |el1, idx1|
      sub_arr = self[0...idx1] + self[idx1+1..-1]
      sub_arr.each_with_index do |el2, idx2|
        next if idx1 <= idx2
        if el1 == el2
          duplicates << el1
        end
      end
    end
    self.each_with_index do |el, idx|
      if duplicates.include?(el)
        result[el] += [idx]
      end
    end
    result
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sub_strings = substrings(self)
    sub_strings.select {|word| word.length > 1 and palindrome?(word)}
  end

  def substrings(str)
    result = []
    i = 0
    while i < str.length
      j = i
      while j < str.length
        result << self[i..j]
        j+=1
      end
      i+=1
    end
    result
  end

  def palindrome?(str)
    str == str.reverse
  end

end

class Array
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end
