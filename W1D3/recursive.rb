MAX_STACK_SIZE = 90
tracer = proc do |event|
  if event == 'call' && caller_locations.length > MAX_STACK_SIZE
    fail "Probable Stack Overflow"
  end
end
set_trace_func(tracer)

# Write a function sum_to(n) that uses recursion to calculate the sum
# from 1 to n (inclusive of n).
def sum_to(n)
  return n if n <= 1
  n + sum_to(n-1)
end

# Write a function add_numbers(nums_array) that takes in an array of
# Fixnums and returns the sum of those numbers.
def add_numbers(nums_array)
  return nums_array[0] if nums_array.length == 1
  nums_array[0] + add_numbers(nums_array[1..-1])
end

# Let's write a method that will solve Gamma Function recursively.
# The Gamma Function is defined Γ(n) = (n-1)!.
def gamma_fnc(n)
  return nil if n == 0
  factorial(n-1)
end

def factorial(n)
  return 1 if n <= 1
  n * factorial(n-1)
end

# Test Cases
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040

# Write a function ice_cream_shop(flavors, favorite) that takes in an
# array of ice cream flavors available at the ice cream shop, as well as
# the user's favorite ice cream flavor. Recursively find out whether or
# not the shop offers their favorite flavor.
def ice_cream_shop(flavors, favorite)
  return true if flavors[0] == favorite
  return false if flavors.empty?
  p flavors
  ice_cream_shop(flavors[1..-1], favorite)
end

# Test Cases
p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false

# Write a function reverse(string) that
# takes in a string and returns it reversed.
def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0..-2])
end
