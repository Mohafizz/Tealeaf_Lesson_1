# Introduce the game of Rock, Paper, Scissors
# Ask Player for input of the 3 lettered choices
# Computer will randomize its choice
# Compare the result and check who wins!

# Checks input from player and sets it to the choice in full word
def classify_player(chosen)
  if chosen == 'R' || chosen == 'r'
    return 'Rock'
  elsif chosen == 'P' || chosen == 'p'
    return 'Paper'
  elsif chosen == 'S' || chosen == 's'
    return 'Scissors'
  elsif chosen == 'y' || chosen == 'Y'
    output "Great! Let's go!!!"
    play_again(chosen)
  elsif chosen == 'n' || chosen == 'N'
    puts "Goodbye!"
    exit
  elsif chosen.to_s.empty?
    puts "*****Please enter a valid option!*****\n"
    play_again(chosen)
  else puts "*****Invalid option!*****\n"
    play_again(chosen)
  end
end

# Checks input from computer and converts the integer random generation into full word
def classify_com(chosen)
  if chosen == 0
    return 'Rock'
  elsif chosen == 1
    return 'Paper'
  elsif chosen == 2
    return 'Scissors'
  end
end

# Compares input from both and determines the winner
def winner(p,c)
  if p == c
    output "It's a Draw!"
  elsif ("#{p}" == 'Rock' && "#{c}" == 'Paper')
    output "Computer wins!"
  elsif ("#{p}" == 'Paper' && "#{c}" == 'Scissors')
    output "Computer wins!"
  elsif ("#{p}" == 'Scissors' && "#{c}" == 'Rock')
    output "Computer wins!"
  else "Player wins!"
  end
end

def play_again(a)
  until a == 'n' || a == 'N'
    # Displays messages
    def output(msg)
      puts "=====#{msg}====="
      puts "\n"
    end

    output "Rock, Paper, Scissors"
    output "Please make your move: (R/P/S)"
    pl_move = gets.chomp
    classify_player(pl_move)

    # Generates an integer of 0...2 for computer's choice. 0:Rock, 1:Paper and 2:Scissors
    com = Random.new
    com_move = com.rand(3)

    # Updates inputs from both into full words.
    pl_move = classify_player(pl_move)
    com_move = classify_com(com_move)

    # Verdict
    output "Player chose #{pl_move} and Computer chose #{com_move}."
    puts winner(pl_move,com_move)

    # Ask to continue?
    output "Would you like to play again?(Y/N)"
    a = gets.chomp
    classify_player(a)
  end
end

answer = ''
play_again(answer)
