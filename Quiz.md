#Quiz: Lesson 1

Some exercises from lesson 1 materials:

What is the value of a after the below code is executed?

  a = 1
  b = a
  b = 3

Answer: a will still be 1. 
---

What's the difference between an Array and a Hash?

Answer: Array stores variables in order. Hash stores key and value pair and not in order.

Tealeaf answer: An Array is an ordered list of objects organized by indices while a Hash is a collection of objects organized with key-valued pairs. Order matters in arrays and they can only use integers as indices. In hashes, you can define any type of object as its keys and values.
---

Every Ruby expression returns a value. Say what value is returned in the below expressions:

arr = [1, 2, 3, 3] Returns: [1, 2, 3, 3]
[1, 2, 3, 3].uniq  Returns: [1, 2, 3]
[1, 2, 3, 3].uniq! Returns: [1, 2, 3]
---

What's the difference between the map and select methods for the Array class? Give an example of when you'd use one versus the other.

Answer: Select method will not return the array back but only the values.

Tealeaf answer:  Map and select are both methods that iterate through an array. Both are similar in that they return a new array. However, they are used for different situations.


Map is used to iterate through an array of elements, returning a new array with values of the called block. This block applies a method to each of the elements, thus transforming the existing array. Select is used to iterate through an array of elements, returning a new array with values that returns true for the block of condition. 

For example,

arr = [1, 2, 3, 4, 5]

# The block is calling a method on each of the elements in the array.
arr.map { |e| e + 1 }       # => [2, 3, 4, 5, 6]
arr.select { |e| e + 1 }    # => [1, 2, 3, 4, 5]

# The block is calling a condition on each of the elements in the array.
arr.select { |e| e.even? }  # => [2, 4]
arr.map { |e| e.even? }     # => [false, true, false, true, false]
---

Say you wanted to create a Hash. How would you do so if you wanted the hash keys to be String objects instead of symbols?

Answer: hash = {"key" => "value"}
---

What is returned?

  x = 1

  x.odd? ? "no way!" : "yes, sir!"

Answer: no way!
---

What is x?

  x = 1

  3.times do
    x += 1
  end

  puts x

Answer: 4
---

What is x?

  3.times do
    x += 1
  end

  puts x

Answer: 3

Tealeaf answer: This will produce an error, because x has not been declared as a local variable.
---

