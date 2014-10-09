#Code up your own calculator from the lecture. Make sure you can run it from the command line. Save the calculator file in a directory, 
#and initialize the directory as a git repository. Make sure this isn't nested in another existing git repository. Then, push this git 
#repository to Github.

def output(msg)
  puts "*****#{msg}*****"
end

output "Please key in first integer."
int1 = gets.chomp

output "You have entered #{int1}. Please key in the second integer."
int2 = gets.chomp

output "You have entered #{int2}. Please select the operation: 1)Add, 2)Subtract, 3)Multiply and 4)Divide"
choice = gets.chomp

answer = case choice   #choice must take in strings instead of integers!
when '1'
  int1.to_i + int2.to_i
when '2'
  int1.to_i - int2.to_i
when '3'
  int1.to_i * int2.to_i
when '4'
  int1.to_f / int2.to_f
else
  output "You have entered an invalid number. Please choose only 1-4." 
end

output "You have entered #{choice}. The answer is #{answer}"