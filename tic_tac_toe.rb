# 1. Draw the tic tac toe board
# 2. Set the squares on the board
# 3. Ask player to select square
# 4. Randomize computer's move
# 5. Check for winner

def initialize_board
  b = {}
  (1..9).each {|pos| b[pos] = ' '}
  b
end

def update_board(b)
  system 'clear'
  puts "    +   +    "
  puts "  #{b[1]} + #{b[2]} + #{b[3]}  "
  puts "----+---+----"
  puts "  #{b[4]} + #{b[5]} + #{b[6]}  "
  puts "----+---+----"
  puts "  #{b[7]} + #{b[8]} + #{b[9]}  "
  puts "    +   +    "
end

def player_move(b)
  puts "Please select an empty square #{check_empty_squares(b)}"
  choice = gets.chomp.to_i
  if check_empty_squares(b).include?(choice)
    b[choice] = 'X'
  else
    player_move(b)
  end
end

def com_move(b)
  choice = check_empty_squares(b).sample
  b[choice] = 'O'
end

def check_empty_squares(b)
  b.keys.select {|pos| b[pos]==' '}
end

def check_winner(b)
  win_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  win_lines.each do |line|
    return "Player" if b[line[0]] == 'X' and b[line[1]] == 'X' and b[line[2]] == 'X'
    return "Computer" if b[line[0]] == 'O' and b[line[1]] == 'O' and b[line[2]] == 'O'
    end
    return nil
end

board = initialize_board
update_board(board)

begin
  player_move(board)
  com_move(board)
  update_board(board)
  winner = check_winner(board)
end until winner || check_empty_squares(board).empty?

if winner 
  puts "#{winner} wins!"
else "It's a draw!"
end
