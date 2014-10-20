#Hints:
# 1. Think of the data structure required to keep track of cards in a deck. 
# 2. You'll need to look up and use a "while" loop, since there could be an indeterminate number of "hits" by both the player and dealer. 
#    "while" loops are used when we don't have a finite number of iterations.
# 3. Code something. Get started, even if it's just capturing the player's name. Give it an honest attempt before looking at solutions.
# 4. Use methods to extract the piece of functionality that calculates the total, since we need it throughout the program.

# Bonus:
# 1. Save the player's name, and use it throughout the app.
# 2. Ask the player if he wants to play again, rather than just exiting.
# 3. Save not just the card value, but also the suit. 
# 4. Use multiple decks to prevent against card counting players.

def check_blackjack(cards)
  if (cards.flatten.include?('Ace') and cards.flatten.include?('Jack'))
  return true 
  end
end 

def calculate_total(cards) #[["3","Hearts"],["Ace","Spades"]]
  #Pull out the values for calculation
  arr = cards.map {|c| c[0]} #["3","Ace"]
  
  #initialize total
  total = 0

  #Check card value accordingly
  arr.each do |item|
    #If it is an Ace
    if item == "Ace"
      total += 11
    #If it is a Jack, Queen or King
    elsif item.to_i == 0
      total += 10
    else total += item.to_i
    end
  end

  #Check how many Aces
  count = arr.count("Ace")
  count.times do
    if total > 21
      total -= 10
    end
  end
  total
end

def check_winner(player,dealer)
  return "Player won!!!" if player > dealer
  return "Dealer won!!!" if dealer > player
  return "It's a Draw..." if player == dealer
  return nil
end


puts "Welcome to a game of Blackjack! \n*******************************"

#Set the playing cards
CARDS = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
SUITS = ['Spades','Hearts','Clubs','Diamonds']

deck = []
SUITS.each {|suit| CARDS.each {|card| deck << [card,suit]}}
deck.shuffle!

player = []
dealer = []

#Deal 2 cards for Player and Dealer
2.times do
  player << deck.pop
  dealer << deck.pop
end

player_total = calculate_total(player)
dealer_total = calculate_total(dealer)

#Show cards to player
puts "You have: #{player.flatten[0]} of #{player.flatten[1]} and #{player.flatten[2]} of #{player.flatten[3]}. Total: #{player_total}"
puts "Dealer have: #{dealer.flatten[0]} of #{dealer.flatten[1]} and #{dealer.flatten[2]} of #{dealer.flatten[3]}. Total: #{dealer_total}"

#Check if there is any Blackjack, if yes no need to proceed.
if check_blackjack(player) || player_total == 21
  puts "Blackjack!!! Player wins!"
  exit
end
if check_blackjack(dealer) || dealer_total == 21
  puts "Blackjack!!! Dealer wins!"
  exit
end

while player_total < 21
  #Player to make move
  puts "\nWould you like to 1)HIT or 2)STAY?"
  move = gets.chomp
  
  #If player hits
  if move == "1"
    player << deck.pop
    player_total = calculate_total(player)
    puts "You got a #{player.last[0]} of #{player.last[1]}. Total: #{player_total}"
    
    #If player hits blackjack
    if player_total == 21
      puts "Blackjack!!! Player wins!"
      exit
    #If player hits above 21
    elsif player_total > 21
      puts "Sorry, you have busted!"
      exit
    end
  end
 
  #If input not 1 or 2
  if !["1","2"].include?(move)          #From solutions video
    puts "Error, choose 1 or 2 only!"
    next
  end

  #If player stays, break from while loop
  if move == "2"
    puts "Wise choice..."
    break
  end
end

#Dealer auto hit if below 17
while dealer_total < 17
  dealer << deck.pop
  dealer_total = calculate_total(dealer)
  puts "\nDealer got a #{dealer.last[0]} of #{dealer.last[1]}. Total: #{dealer_total}"

  #If dealer hits 21, game ends
  if dealer_total == 21
    puts "Blackjack!!! Dealer wins!"
    exit
  #If dealer hits above 21
  elsif dealer_total > 21
    puts "Dealer have busted! You win!!!"
    exit
  end
end

#Compare values
winner = check_winner(player_total,dealer_total)
puts "\n" + winner
