#Create a method that takes an array as a parameter. Within that method, try calling methods that do not mutate the caller. 
#How does that affect the array outside of the method? What about when you call a method that mutates the caller within the method?

array = [2, 4, 6, 2, 8, 2, 6, 8]

def array_non_mutate(arr)
  p arr.uniq
end

array_non_mutate(array)

p array   #array still remains as original and does not mutate.

def array_mutate(this)
  p this.uniq!
end

array_mutate(array)

p array   #array is permanently mutated to a different value.
