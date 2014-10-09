#1 Create a local variable and modify it at an inner scope. You can try

# a) re-assigning the variable to something else

a = 10

5.times {|i| a += 1}

puts "Variable a is now #{a}"  #a should be 15

# b) call a method that doesn’t mutate the caller.

def var_non_mutate(int)
  int * 2
end

var_non_mutate(a)

puts "Variable a still remains #{a}"   #a = 15 and still remains as original and does not mutate.

# c) call a method that mutates the caller.

def var_mutate(this)
  this - 2
end

a = var_mutate(a)

puts "Variable a is now changed to #{a}"   #a = 115 and is permanently mutated to a different value.




