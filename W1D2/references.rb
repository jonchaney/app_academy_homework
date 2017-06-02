# arrays

x = Array.new(3, [])
# this creates an array of length 3 with an empty array as each element.
# However, each element points the same array. So if you do:

x[0] << "Hello"
# each array contains => ["Hello"]
# to create and array with three empty arrays that point to three
# different arrays, use this syntax:

x = Array.new(3) { [] }
# pass in a block

# the same issue occurs when setting default values to hashes.
# the work around is:
cats = Hash.new { |h, k| h[k] = [] }
# each time you add a key to the hash, its default value will be an
# empty array
