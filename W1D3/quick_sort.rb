# def quicksort(arr)
#   return arr if arr.length <= 1
#   high = []
#   low = []
#   i = 1
#   while i < arr.length
#     if arr[i] < arr[0]
#       low << arr[i]
#     else
#       high << arr[i]
#     end
#     i+=1
#   end
#   quicksort(low) + [arr[0]] + quicksort(high)
# end

def quicksort(arr)
  return arr if arr.length <= 1
  pivot_arr = [arr.first]
  left_side = arr[1..-1].select {|num| num < arr.first}
  right_side = arr[1..-1].select {|num| num > arr.first}
  left_side + pivot_arr + right_side
end


arr = [1,2,3,4,5]
arr.shuffle!
p quicksort(arr)
